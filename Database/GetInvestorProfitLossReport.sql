USE [BombayMetrics]
GO
/****** Object:  StoredProcedure [dbo].[GetInvestorProfitLossReport]    Script Date: 7/14/2022 4:41:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec GetInvestorProfitLossReport 426
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
			select  @vwap=dbo.GetWeekAvgVwap(@AsOnDate)			
			set @Qty =  @Holding 
			set @ProfitLoss=(@Holding *@vwap) - @PrevInvestment   
--print 'sold@' print @AsOnDate print  @vwap
insert into #Temp1 (AsOnDate,Holding,vwap,PrevInvestment,Qty, Prevvwap, ProfitLoss) select @AsOnDate,0 , @vwap, @PrevInvestment, @Qty,@Prevvwap, @ProfitLoss
	set @NextAsonDate= null	
end
else
begin
		DECLARE db_cursor1 CURSOR FOR 
		select F.Holding,( select dbo.GetWeekAvgVwap(F.AsOnDate)) as [Apox Price] 
		from Folio F
		where UserID=@UserID and  F.AsOnDate=@AsOnDate
		order by F.asondate 
		OPEN db_cursor1  
		FETCH NEXT FROM db_cursor1 INTO  @Holding , @vwap

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
		insert into #Temp1 (AsOnDate,Holding,vwap,PrevInvestment,Qty, Prevvwap, ProfitLoss) select @AsOnDate,@Holding , @vwap, @PrevInvestment, @Qty,@Prevvwap, @ProfitLoss
		FETCH NEXT FROM db_cursor1 INTO  @Holding  , @vwap 
		END 

		CLOSE db_cursor1
		DEALLOCATE db_cursor1
end
FETCH NEXT FROM db_cursor INTO @AsOnDate 
END 
CLOSE db_cursor
DEALLOCATE db_cursor

select convert(varchar,AsOnDate, 1) as [Investment Date],Qty,isnull(vwap,0) as [Apox VWP price],Holding, PrevInvestment as [Investment], ProfitLoss from #Temp1

drop table #Temp1		
END