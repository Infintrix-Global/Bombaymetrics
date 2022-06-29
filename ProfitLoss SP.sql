declare @UserID int
set @UserID=10;


create table #Temp
(
    AsOnDate DateTime, 
    Holding decimal(10,2), 
    vwap decimal(10,2),
    PrevInvestment decimal(10,2),
    PrevHolding decimal(10,2), 
    Prevvwap decimal(10,2)
)

DECLARE @AsOnDate date;
 declare @Holding decimal(10,2);
  declare @Price decimal(10,2);

DECLARE db_cursor1 CURSOR FOR 
select F.AsOnDate,F.Holding,( select dbo.GetWeekAvgVwap(F.AsOnDate)) as [Apox Price] 
from Folio F
where UserID=@UserID 
order by F.asondate 
OPEN db_cursor1  
FETCH NEXT FROM db_cursor1 INTO @AsOnDate, @Holding  , @Price

WHILE @@FETCH_STATUS = 0  
BEGIN 
--Print @AsOnDate
insert into #Temp (AsOnDate,Holding,vwap) select @AsOnDate,@Holding  , @Price
    
	FETCH NEXT FROM db_cursor1 INTO @AsOnDate, @Holding  , @Price 
END 

CLOSE db_cursor1
DEALLOCATE db_cursor1

DECLARE db_cursor4 CURSOR FOR 
select AsOnDate,Holding ,vwap from #Temp
OPEN db_cursor4  
FETCH NEXT FROM db_cursor4 INTO @AsOnDate, @Holding  , @Price

WHILE @@FETCH_STATUS = 0  
BEGIN 
Print @AsOnDate
update #Temp set PrevHolding=isnull((select Holding  from  dbo.GetPreviousAsonDateForUser(@UserID,@AsOnDate) ),0),
Prevvwap=isnull((select vwap  from  dbo.GetPreviousAsonDateForUser(@UserID,@AsOnDate) ),0),
PrevInvestment=isnull((select [Investment value]  from  dbo.GetPreviousAsonDateForUser(@UserID,@AsOnDate) ),vwap * Holding)
where #Temp.AsOnDate= @AsOnDate and #Temp.Holding= @Holding  and #Temp.vwap= @Price
    
      FETCH NEXT FROM db_cursor4 INTO @AsOnDate, @Holding  , @Price 
END 

CLOSE db_cursor4
DEALLOCATE db_cursor4
select convert(varchar,AsOnDate, 1) as [Investment Date],Holding - PrevHolding as [Qty],PrevInvestment,
isnull(vwap,0) as [Apox VWP price], Holding, 
case when (Holding -PrevHolding =0)
	Then (PrevInvestment)
	else 
	((Holding - PrevHolding) *vwap) + PrevInvestment
	end
 as [Investment value], PrevHolding from #Temp

drop table #Temp