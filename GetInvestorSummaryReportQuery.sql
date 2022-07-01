
Declare @UserID int
Declare @UserName varchar(100)
DECLARE db_cursor CURSOR FOR 
select ID, UserName from [User] where ID<5

create table #Temp
(
	UserID int,
	UserName varchar(100),
    AsOnDate DateTime, 
    Holding bigint,     
    Investment decimal(18,2),
	ProfitLoss decimal(18,2)
)
OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @UserID,@UserName

WHILE @@FETCH_STATUS = 0  
BEGIN 

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
insert into #Temp (UserID ,	UserName ,    AsOnDate ,    Holding ,   Investment,	ProfitLoss ) 
(select  top 1 @UserID, @UserName, convert(varchar,AsOnDate, 1),Holding, PrevInvestment , ProfitLoss from #Temp1
where vwap!='0.00' order by AsOnDate desc)

drop table #Temp1

FETCH NEXT FROM db_cursor INTO @UserID,@UserName
END 

CLOSE db_cursor
DEALLOCATE db_cursor

select * from #Temp
drop table #Temp