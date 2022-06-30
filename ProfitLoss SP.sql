--USE [Bombaymetrics]
GO
/****** Object:  StoredProcedure [dbo].[GetInvestorProfitLossReport]    Script Date: 6/29/2022 5:34:36 PM ******/
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
alter PROCEDURE [dbo].[GetInvestorProfitLossReport]
@UserID int
AS
BEGIN
select UserName, PanNo from [User] where ID=@UserID

ALTER table #Temp1
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
