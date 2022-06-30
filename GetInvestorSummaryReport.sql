USE [Bombaymetrics_UAT]
GO
/****** Object:  StoredProcedure [dbo].[GetInvestorSummaryReport]    Script Date: 6/30/2022 7:28:43 PM ******/
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

    -- Insert statements for procedure here
	SELECT [User].ID, UserName,  convert(varchar,AsOnDate, 1)  as AsOnDate,Folio.Holding as [TotalShares],
	Cast(cast(((Holding *100) /@TotalShare)as decimal(18,2)) as varchar(50)) + ' %' as [HoldingPercentage] 
	from Folio join [User] on Folio.UserID=[User].ID where Folio.AsOnDate=dbo.GetMaxAsOnDateForInvestor([User].ID)
END
