USE [BombayMetrics]
GO
/****** Object:  StoredProcedure [dbo].[GetInvestorProfitLossDetail]    Script Date: 7/14/2022 4:45:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec GetInvestorProfitLossDetail 426
ALTER procedure [dbo].[GetInvestorProfitLossDetail]
@UserID int
AS

BEGIN

create table #Temp1
(
	UserID int,
	UserName varchar(100),
    AsOnDate DateTime, 
    Holding bigint, 
    vwap decimal(10,2),
    PrevInvestment decimal(18,2),
    Qty bigint, 
    Prevvwap decimal(10,2),
	ProfitLoss decimal(18,2)
)
declare @UserName nvarchar(100);
declare @NextAsonDate date;
DECLARE @AsOnDate date;
declare @Holding bigint;
declare @vwap decimal(10,2);
declare @PrevInvestment  decimal(18,2)
declare @Prevvwap decimal(10,2)
declare @PrevHolding bigint
declare @Qty bigint
declare @ProfitLoss decimal(18,2)

DECLARE db_cursor CURSOR FOR 
select distinct F.AsOnDate from Folio F order by F.asondate 
OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @AsOnDate 

WHILE @@FETCH_STATUS = 0  
BEGIN 
--print '@AsOnDate' print @AsOnDate
if @NextAsonDate is not null and not exists(select F.ID	from Folio F where UserID=@UserID and  F.AsOnDate=@AsOnDate )

begin
			select @UserName= UserName from [User] where ID=@UserID
			select  @vwap=dbo.GetWeekAvgVwap(@AsOnDate)			
			set @Qty =  @Holding 
			set @ProfitLoss=(@Holding *@vwap) - @PrevInvestment   
--print 'sold@' print @AsOnDate print  @vwap
insert into #Temp1 (UserID, UserName,AsOnDate,Holding,vwap,PrevInvestment,Qty, Prevvwap, ProfitLoss) select @UserID, @UserName, @AsOnDate,0 , @vwap, @PrevInvestment, @Qty,@Prevvwap, @ProfitLoss
	set @NextAsonDate= null	
end
else
begin
		DECLARE db_cursor1 CURSOR FOR 
		select [User].UserName, F.Holding,( select dbo.GetWeekAvgVwap(F.AsOnDate)) as [Apox Price] 
		from Folio F join [User] on F.UserID =[User].ID
		where UserID=@UserID and  F.AsOnDate=@AsOnDate
		order by F.asondate 
		OPEN db_cursor1  
		FETCH NEXT FROM db_cursor1 INTO @UserName,  @Holding , @vwap

		WHILE @@FETCH_STATUS = 0  
		BEGIN 
		--Print @AsOnDate
		declare @PrevAsonDate  Date

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
		set @NextAsonDate =@AsOnDate
		insert into #Temp1 (UserID, UserName,AsOnDate,Holding,vwap,PrevInvestment,Qty, Prevvwap, ProfitLoss) select @UserID, @UserName,@AsOnDate,@Holding , @vwap, @PrevInvestment, @Qty,@Prevvwap, @ProfitLoss
		FETCH NEXT FROM db_cursor1 INTO  @Username,@Holding  , @vwap 
		END 

		CLOSE db_cursor1
		DEALLOCATE db_cursor1
end
FETCH NEXT FROM db_cursor INTO @AsOnDate 
END 
CLOSE db_cursor
DEALLOCATE db_cursor

select top 1 UserID, UserName, convert(varchar,AsOnDate, 1) as [Investment Date],
Holding, PrevInvestment as [Investment value], ProfitLoss from #Temp1 --where vwap!='0.00'
order by AsOnDate desc

drop table #Temp1		
END
