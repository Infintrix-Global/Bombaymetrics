drop TABLE [dbo].[CountryMaster]

CREATE TABLE [dbo].[CountryMaster](
	[CountryID] [tinyint] NOT NULL  identity(1,1),
	[CountryCode] [nvarchar](5) NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CountryCodeMaster] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
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
create PROCEDURE [dbo].[InsertCountry]
	@CountryCode as nvarchar(5),
	@CountryName as nvarchar(100)

AS
BEGIN

	insert into CountryMaster Values( @CountryCode,@CountryName)
	
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
create PROCEDURE [dbo].[GetCountries]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CountryMaster
END



Alter Table PortMaster
Add Id_new Int Identity(1, 1)
Go

Alter Table PortMaster Drop Column PortID
Go
Exec sp_rename 'PortMaster.Id_new', 'PortID', 'Column'

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[InsertPort]
	@PortCode as nvarchar(5),
	@PortName as nvarchar(100)

AS
BEGIN

	insert into PortMaster Values( @PortCode,@PortName)
	
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
create PROCEDURE [dbo].[GetPorts]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT PortID, PortCode, PortName from PortMaster
END
GO
CREATE PROCEDURE [dbo].[UpdatePort]
	@PortID int,
	@PortCode nvarchar(50),
	@PortName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  PortMaster set PortCode=@PortCode, PortName=@PortName
	where PortID=@PortID
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeletePort]
	@PortID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete  PortMaster where PortID=@PortID
END

Alter Table StateMaster
Add Id_new Int Identity(1, 1)
Go

Alter Table StateMaster Drop Column StateID
Go
Exec sp_rename 'StateMaster.Id_new', 'StateID', 'Column'

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[InsertState]
	@StateCode as nvarchar(5),
	@StateName as nvarchar(100)

AS
BEGIN

	insert into StateMaster Values( @StateCode,@StateName)
	
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
create PROCEDURE [dbo].[GetStates]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from StateMaster
END
GO
CREATE PROCEDURE [dbo].[UpdateState]
	@StateID int,
	@StateCode nvarchar(5),
	@StateName nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  StateMaster set StateCode=@StateCode, StateName=@StateName
	where StateID=@StateID
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteState]
	@StateID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete  StateMaster where StateID=@StateID
END
