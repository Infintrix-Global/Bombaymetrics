USE [Bombaymetrics]
GO
/****** Object:  StoredProcedure [dbo].[GetInvestorSummaryReport]    Script Date: 7/1/2022 6:11:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec GetInvestorSummaryReport 
ALTER PROCEDURE [dbo].[GetInvestorSummaryReport]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @TotalShare as bigint
	set @TotalShare= 1539240

    
Declare @UserID int
Declare @UserName varchar(100)
DECLARE db_cursor CURSOR FOR 
select ID, UserName from [User] 

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

insert into #Temp (UserID ,	UserName ,    AsOnDate ,    Holding ,   Investment,	ProfitLoss ) 
exec GetInvestorProfitLossDetail @UserID

FETCH NEXT FROM db_cursor INTO @UserID,@UserName
END 

CLOSE db_cursor
DEALLOCATE db_cursor

select UserID as ID ,	UserName ,  convert(varchar,AsOnDate, 1)as  AsOnDate ,    Holding ,
Cast(cast(((Holding *100) /@TotalShare)as decimal(18,2)) as varchar(50)) + ' %' as [HoldingPercentage] ,   
Investment,	ProfitLoss from #Temp

drop table #Temp
END
