
CREATE TABLE [dbo].[SupplyTypeMaster](
	[SupplyTypeID] [tinyint] NOT NULL  identity(1,1),
	[SupplyTypeCode] [nvarchar](50) NOT NULL
 CONSTRAINT [PK_SupplyTypeCodeMaster] PRIMARY KEY CLUSTERED 
(
	[SupplyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[InsertSupplyType]
	@SupplyTypeCode as nvarchar(50)

AS
BEGIN

	insert into SupplyTypeMaster Values( @SupplyTypeCode)
	
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GetSupplyTypes]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT SupplyTypeID, SupplyTypeCode  from SupplyTypeMaster
END
GO
CREATE PROCEDURE [dbo].[UpdateSupplyType]
	@SupplyTypeID int,
	@SupplyTypeCode nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  SupplyTypeMaster set SupplyTypeCode=@SupplyTypeCode
	where SupplyTypeID=@SupplyTypeID
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSupplyType]
	@SupplyTypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete  SupplyTypeMaster where SupplyTypeID=@SupplyTypeID
END
