--USE [Bombaymetrics_UAT]
GO
/****** Object:  StoredProcedure [dbo].[GetInvestorProfitLossReport]    Script Date: 7/1/2022 6:46:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec GetInvestorProfitLossDetail 172
create procedure [dbo].[GetInvestorProfitLossDetail]
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


declare @UserName varchar(100);
DECLARE @AsOnDate date;
declare @Holding bigint;
declare @vwap decimal(10,2);

DECLARE db_cursor1 CURSOR FOR 
select [User].UserName, F.AsOnDate,F.Holding,( select dbo.GetWeekAvgVwap(F.AsOnDate)) as [Apox Price] 
from Folio F join [User] on F.UserID =[User].ID
where UserID=@UserID 
order by F.asondate 
OPEN db_cursor1  
FETCH NEXT FROM db_cursor1 INTO @UserName,@AsOnDate, @Holding , @vwap

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

insert into #Temp1 (UserID,UserName, AsOnDate,Holding,vwap,PrevInvestment,Qty, Prevvwap, ProfitLoss) select @UserID,@UserName, @AsOnDate,@Holding , @vwap, @PrevInvestment, @Qty,@Prevvwap, @ProfitLoss
FETCH NEXT FROM db_cursor1 INTO @UserName, @AsOnDate, @Holding  , @vwap 
END 

CLOSE db_cursor1
DEALLOCATE db_cursor1

select top 1 UserID, UserName, convert(varchar,AsOnDate, 1) as [Investment Date],
Holding, PrevInvestment as [Investment value], ProfitLoss from #Temp1 where vwap!='0.00'
order by AsOnDate desc

drop table #Temp1		
END
