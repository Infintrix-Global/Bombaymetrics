USE [Bombaymetrics_UAT]
GO
/****** Object:  UserDefinedFunction [dbo].[GetPreviousAsonDateForUser]    Script Date: 6/29/2022 6:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[GetPreviousAsonDateForUser](@UserID int,@AsOnDate date)
RETURNS TABLE  
as
RETURN  
select isnull( F2.Holding,0) as Holding,isnull(  dbo.GetWeekAvgVwap(F2.AsOnDate),0)as vwap ,(S2.vwap * F2.Holding ) as [Investment value] ,F2.AsOnDate
from Folio F2 join Series S2  on F2.AsOnDate=S2.AsOnDate and  F2.UserID=@UserID 
and F2.AsOnDate =(select max(F3.AsOnDate) from Folio F3 where F3.AsOnDate <@AsOnDate and F3.UserID=@UserID) 

