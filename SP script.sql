USE [Bombaymetrics]
GO
/****** Object:  StoredProcedure [dbo].[GetFolio]    Script Date: 6/29/2022 7:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetFolio]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT REPLACE( CONVERT(NVARCHAR, SYSDATETIME(), 106),' ' ,'-') AS [As On Date],FolioNo,UserName,Holding,Category,LockinHolding,EmailID,PanNo, PhoneNo, PledgeQty from Folio join [User] on Folio.UserID=[User].ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetInvestorProfitLossReport]    Script Date: 6/29/2022 7:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
--exec GetInvestorProfitLossReport 172
ALTER PROCEDURE [dbo].[GetInvestorProfitLossReport]
@UserID int
AS
BEGIN
select UserName, PanNo from [User] where ID=@UserID

create table #Temp1
(
    AsOnDate DateTime, 
    Holding bigint, 
    vwap decimal(10,2),
    PrevInvestment decimal(18,2),
    Qty bigint, 
    Prevvwap decimal(10,2),
	ProfitLoss decimal(18,2)
)

DECLARE @AsOnDate date;
declare @Holding bigint;
declare @vwap decimal(10,2);

DECLARE db_cursor1 CURSOR FOR 
select F.AsOnDate,F.Holding,( select dbo.GetWeekAvgVwap(F.AsOnDate)) as [Apox Price] 
from Folio F
where UserID=@UserID 
order by F.asondate 
OPEN db_cursor1  
FETCH NEXT FROM db_cursor1 INTO @AsOnDate, @Holding , @vwap

WHILE @@FETCH_STATUS = 0  
BEGIN 
--Print @AsOnDate
declare @PrevAsonDate  Date
declare @PrevInvestment  decimal(18,2)
declare @Prevvwap decimal(10,2)
declare @PrevHolding bigint
declare @Qty bigint
declare @ProfitLoss decimal(18,2)

if @PrevAsonDate is null
begin
	set @Prevvwap = 0
	set @Qty = @Holding
	set @PrevInvestment =@Holding * @vwap
	set @ProfitLoss=0
end
else
begin
	select @Prevvwap =  dbo.GetWeekAvgVwap(@PrevAsonDate)
	set @Qty =  @Holding -@PrevHolding 
	set @PrevInvestment = @PrevInvestment + (@Qty * @vwap)	  
	set @ProfitLoss=(@Holding *@vwap) -@PrevInvestment
end

set @PrevAsonDate= @AsOnDate	
set @PrevHolding =@Holding

insert into #Temp1 (AsOnDate,Holding,vwap,PrevInvestment,Qty, Prevvwap, ProfitLoss) select @AsOnDate,@Holding , @vwap, @PrevInvestment, @Qty,@Prevvwap, @ProfitLoss
FETCH NEXT FROM db_cursor1 INTO @AsOnDate, @Holding  , @vwap 
END 

CLOSE db_cursor1
DEALLOCATE db_cursor1

select convert(varchar,AsOnDate, 1) as [Investment Date],Qty,isnull(vwap,0) as [Apox VWP price],Holding, PrevInvestment as [Investment value], ProfitLoss from #Temp1

drop table #Temp1		
END
GO
/****** Object:  StoredProcedure [dbo].[GetInvestorShareHoldingDatewiseReport]    Script Date: 6/29/2022 7:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
--exec GetInvestorShareHoldingDatewiseReport '06-17-22'
ALTER PROCEDURE [dbo].[GetInvestorShareHoldingDatewiseReport]
@AsOnDate varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @TotalShare as bigint
	set @TotalShare= 1539240

    -- Insert statements for procedure here
	SELECT [User].ID, UserName,convert(varchar,AsOnDate, 1) as AsOnDate,Sum(Holding) as [TotalShares],
	Cast(cast(((Sum(Holding) *100) /@TotalShare)as decimal(10,2)) as varchar(50)) + ' %' as [HoldingPercentage] 
	from Folio join [User] on Folio.UserID=[User].ID
	group by  [User].ID,UserName, AsOnDate  having convert(varchar,AsOnDate, 1)=  replace(@AsOnDate,'-','/')
END
GO
/****** Object:  StoredProcedure [dbo].[GetLogin]    Script Date: 6/29/2022 7:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
--exec GetLogin 'Admmin','123456'
ALTER PROCEDURE [dbo].[GetLogin]
	@UserName nvarchar(50),
	@Password nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

    -- Insert statements for procedure here
	SELECT * from [dbo].[Login]  where [UserName]= @UserName and Password=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[GetMaxFolioDate]    Script Date: 6/29/2022 7:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[GetMaxFolioDate]
AS
Begin
select max(asondate) from Folio
End
GO
/****** Object:  StoredProcedure [dbo].[GetMenu]    Script Date: 6/29/2022 7:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetMenu]
@UserID int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select LG.UserID,LG.RoleID,RL.RoleName,MR.MenuID,MR.Page_Add,MR.Page_Delete,MR.Page_Edit,MR.Page_View 
             ,MN.MenuName,MN.OrderNo,MN.ParentId,MN.Path from [Login] LG  
             Left outer join Role RL on RL.RoleID = LG.RoleID Left outer join MenuRights MR on MR.RoleID = LG.RoleID 
             Left outer join Menu MN on MN.MenuID = MR.MenuID where UserID=@UserID and MN.IsActive= 1 and ISNULL(MenuName,'')<>'' 
			 order by ParentID,MR.MenuID, OrderNo asc
END
GO
/****** Object:  StoredProcedure [dbo].[GetSeries]    Script Date: 6/29/2022 7:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetSeries]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  convert(varchar,AsOnDate, 1) AS [As On Date], [Series], [Open], High, Low, PrevClose as [Prev Close],LTP, [Close],[vwap] ,[52WH],[52WL], 
cast(Volume as decimal(10,0)) as Volume, Value, NoofTrades as [No of Trades] from Series
END
GO
/****** Object:  StoredProcedure [dbo].[GetSeriesDetailReport]    Script Date: 6/29/2022 7:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetSeriesDetailReport]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @TotalShare as bigint
	set @TotalShare= 1539240
	declare @MarketCap as bigint
	set @MarketCap= 143149320
	declare @PriceBand as int
	set @PriceBand= 10

    -- Insert statements for procedure here
		SELECT convert(varchar,AsOnDate, 1) AS [As On Date], [Series], [Open], High, Low, PrevClose as [Prev Close],LTP, [Close],[vwap] ,[52WH],[52WL], 
	cast(Volume as decimal(10,0)) as Volume, Value, NoofTrades as [No of Trades]
	, @TotalShare as [TOTAL NO OF SHARES], (@TotalShare * S1.Ltp) as [MARKET CAP],
	Cast((cast(((((@TotalShare * S1.Ltp)- @MarketCap)/@MarketCap ) * 100)as decimal(10,2))) as varchar(50)) + ' %' as GROWTH,
	Cast((select (isnull(S2.[Close],0) * cast(  Priceband as decimal(10,2)))- isnull(S2.[Close],0) from Series S2 where S2.AsOnDate=(select max(AsOnDate) from Series S3 where S3.AsOnDate <S1.AsOnDate))as decimal(10,2)) as [LOWER BAND], 
	Cast((select (isnull(S2.[Close],0) * cast( Priceband as decimal(10,2)))+ isnull(S2.[Close],0) from Series S2 where S2.AsOnDate=(select max(AsOnDate) from Series S3 where S3.AsOnDate <S1.AsOnDate))as decimal(10,2))  as [UPPER BAND], 
	Cast(Cast( Cast(Priceband  as decimal(10,2)) *100 as integer) as varchar(50))+'%' as  [PRICE BAND%],
	Cast(cast( (((S1.Ltp - S1.PrevClose)/S1.Ltp) * 100 )as decimal(10,2)) as varchar(50)) + ' %' [DAY GROTH]	
	from Series S1 order by S1.AsOnDate desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetShareHolderPANReport]    Script Date: 6/29/2022 7:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetShareHolderPANReport]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

    -- Insert statements for procedure here
	SELECT distinct UserName, FolioNo ,PanNo, EmailID, PhoneNo from Folio join [User] on Folio.UserID=[User].ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetWeekAverageDateWiseReport]    Script Date: 6/29/2022 7:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
--exec GetWeekAverageDateWiseReport '04-01-2022','06-21-2022'
ALTER PROCEDURE [dbo].[GetWeekAverageDateWiseReport]
	@FromDate date,
	@ToDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	
DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX)

select @cols = STUFF((SELECT distinct ',' +  QUOTENAME(AsOnDate) 
                   from Folio                    
                   where AsonDate between @FromDate and @ToDate
				   group by AsOnDate
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

set @query = N'SELECT  UserName ,FolioNo,PanNo ,' + @cols + N' from 
             (
                select distinct  UserName ,FolioNo,PanNo, Holding, AsOnDate
                from Folio  join [User] on Folio.UserID=[User].ID
            ) x 
            pivot 
            (
                max(holding)
                for AsOnDate in (' + @cols + N')
            ) p '

exec sp_executesql @query;	
END
GO
/****** Object:  StoredProcedure [dbo].[InsertFolio]    Script Date: 6/29/2022 7:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertFolio]
	@AsOnDate as Date,
	@FolioNo as nvarchar(50),
	@Name nvarchar(50),
	@Holding decimal(18,2),
	@Category nvarchar(50),
	@LockingHolding decimal(18,2),
	@Email nvarchar(50),
	@PanNo nvarchar(20),
	@PhoneNo nvarchar(20) ,
	@PledgeQty decimal(18,2)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @ID int;
    -- Insert statements for procedure here
	select @ID= ID from [User] where UserName= @Name and PanNo= @PanNo
	If(@ID is null)
	Begin
		insert into [User] Values (@Name,@Email, @PanNo,@PhoneNo,1)
		set @ID=@@Identity
	End
	insert into Folio Values( @ID,@FolioNo,@Category,@AsOnDate, @Holding,@LockingHolding,@PledgeQty)

END
GO
/****** Object:  StoredProcedure [dbo].[InsertSeries]    Script Date: 6/29/2022 7:01:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertSeries]
	@AsOnDate as Date,
	@Series nvarchar(10),
	@Open decimal(18,2),
	@High decimal(18,2),
	@Low decimal(18,2),
	@PrevClose decimal(18,2),
	@Ltp decimal(18,2),
	@Close decimal(18,2),
	@vwap decimal(18,2),
	@52WH decimal(18,2),
	@52WL decimal(18,2),
	@Volume decimal(18,2),
	@Value decimal(18,2),
	@NoofTrades int,
	@PriceBand nvarchar(50) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	if not exists(select AsOnDate from Series where AsOnDate=@AsOnDate)
	Begin
	insert into Series 
	Values( @AsOnDate,@Series,@Open,@High,@Low,@PrevClose, @Ltp,@Close, @vwap,@52WH,@52WL,@Volume,@Value,@NoofTrades,@PriceBand)
	End
END
GO
