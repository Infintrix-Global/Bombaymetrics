USE [Bombaymetrics_UAT]
GO
/****** Object:  UserDefinedFunction [dbo].[GetWeekAvgVwap]    Script Date: 6/30/2022 4:48:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select dbo.GetMaxAsOnDateForInvestor(145)
create  Function [dbo].[GetMaxAsOnDateForInvestor](@ID as int)
RETURNS date
AS
Begin
 DECLARE @ret date;
select @ret= MAX(AsOnDate) from Folio where UserID=@ID
   
   return @ret
  
  End