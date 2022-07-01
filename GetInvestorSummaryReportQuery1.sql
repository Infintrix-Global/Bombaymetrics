
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
insert #Temp1
exec GetInvestorProfitLossReport @UserID

select top 1 * from #Temp1 order by AsOnDate desc
drop table #Temp1

FETCH NEXT FROM db_cursor INTO @UserID,@UserName
END 

CLOSE db_cursor
DEALLOCATE db_cursor

select * from #Temp
drop table #Temp