
CREATE TABLE [dbo].[HSNMaster](
	[HSNID] [int] NOT NULL IDENTITY(1,1),
	[HSNCode] [nvarchar](20) NOT NULL,
	[HSNDescription] [nvarchar](200) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[StateMaster](
	[StateID] [int] NOT NULL IDENTITY(1,1),
	[State Code] [nvarchar](5) NOT NULL,
	[State Name] [nvarchar](50) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[CompanyMaster](
	[CompanyID] [int] NOT NULL IDENTITY(1,1),
	[Legal Name] [nvarchar](50) NOT NULL,
	[GSTIN] [nvarchar](50) NULL,
	[Supplier Address] nvarchar(500),
	Place  [nvarchar](50) NULL,
	[State Code] [nvarchar](10) NULL,
	[PIN Code] [nvarchar](10) NULL
) ON [PRIMARY]
GO

insert into StateMaster values ('01','JAMMU AND KASHMIR')
insert into StateMaster values ('02','HIMACHAL PRADESH')
insert into StateMaster values ('03','PUNJAB')
insert into StateMaster values ('04','CHANDIGARH')
insert into StateMaster values ('05','UTTARAKHAND')
insert into StateMaster values ('06','HARYANA')
insert into StateMaster values ('07','DELHI')
insert into StateMaster values ('08','RAJASTHAN')
insert into StateMaster values ('09','UTTAR PRADESH')
insert into StateMaster values ('10','BIHAR')
insert into StateMaster values ('11','SIKKIM')
insert into StateMaster values ('12','ARUNACHAL PRADESH')
insert into StateMaster values ('13','NAGALAND')
insert into StateMaster values ('14','MANIPUR')
insert into StateMaster values ('15','MIZORAM')
insert into StateMaster values ('16','TRIPURA')
insert into StateMaster values ('17','MEGHALAYA')
insert into StateMaster values ('18','ASSAM')
insert into StateMaster values ('19','WEST BENGAL')
insert into StateMaster values ('20','JHARKHAND')
insert into StateMaster values ('21','ORISSA')
insert into StateMaster values ('22','CHHATTISGARH')
insert into StateMaster values ('23','MADHYA PRADESH')
insert into StateMaster values ('24','GUJARAT')
insert into StateMaster values ('25','DAMAN AND DIU')
insert into StateMaster values ('26','DADRA AND NAGAR HAVELI')
insert into StateMaster values ('27','MAHARASHTRA')
insert into StateMaster values ('29','KARNATAKA')
insert into StateMaster values ('30','GOA')
insert into StateMaster values ('31','LAKSHWADEEP')
insert into StateMaster values ('32','KERALA')
insert into StateMaster values ('33','TAMILADU')
insert into StateMaster values ('34','PUDUCHERRY')
insert into StateMaster values ('35','ANDAMAN AND NICOBAR')
insert into StateMaster values ('36','TELENGANA')
insert into StateMaster values ('37','ANDHRA PRADESH')
insert into StateMaster values ('38','LADAKH')
insert into StateMaster values ('97','OTHER TERRITORY')
insert into StateMaster values ('96','OTHER COUNTRY')




CREATE TABLE [dbo].[SupplyTypeCodeMaster](
	[SupplyTypeCodeID] [int] NOT NULL IDENTITY(1,1),
	[Supply Type] [nvarchar](10) NOT NULL
) ON [PRIMARY]

insert into [SupplyTypeCodeMaster] values ('B2B')
insert into [SupplyTypeCodeMaster] values ('SEZWP')
insert into [SupplyTypeCodeMaster] values ('SEZWOP')
insert into [SupplyTypeCodeMaster] values ('EXPWP')
insert into [SupplyTypeCodeMaster] values ('EXPWOP')
insert into [SupplyTypeCodeMaster] values ('DEXP')
insert into [SupplyTypeCodeMaster] values ('B2C')
GO
CREATE TABLE [dbo].[DocumentTypeCodeMaster](
	[DocumentTypeCodeID] [int] NOT NULL IDENTITY(1,1),
	[Document Type] [nvarchar](10) NOT NULL
) ON [PRIMARY]
GO
insert into [DocumentTypeCodeMaster] values ('INV')
insert into [DocumentTypeCodeMaster] values ('CRN')
insert into [DocumentTypeCodeMaster] values ('DBN')

GO
CREATE TABLE [dbo].[TaxRateMaster](
	[TaxRateID] [int] NOT NULL IDENTITY(1,1),
	[TaxRate] decimal(3,2) NOT NULL
) ON [PRIMARY]
GO

insert into [TaxRateMaster] values ('0')
insert into [TaxRateMaster] values ('0.1')
insert into [TaxRateMaster] values ('0.25')
insert into [TaxRateMaster] values ('1')
insert into [TaxRateMaster] values ('1.5')
insert into [TaxRateMaster] values ('3')
insert into [TaxRateMaster] values ('5')
insert into [TaxRateMaster] values ('7.5')
insert into [TaxRateMaster] values ('12')
insert into [TaxRateMaster] values ('18')
insert into [TaxRateMaster] values ('28')

GO

CREATE TABLE [dbo].[ModeOfPaymentMaster](
	[ModeOfPaymentID] [int] NOT NULL IDENTITY(1,1),
	[ModeOfPayment] [nvarchar](50) NOT NULL
) ON [PRIMARY]
insert into [ModeOfPaymentMaster] values ('Cash')
insert into [ModeOfPaymentMaster] values ('Credit')
insert into [ModeOfPaymentMaster] values ('Direct Transfer')

GO


CREATE TABLE [dbo].[TransModeMaster](
	[TransModeID] [int] NOT NULL IDENTITY(1,1),
	[TransMode] [nvarchar](50) NOT NULL
) ON [PRIMARY]
insert into TransModeMaster values ('Road')
insert into TransModeMaster values ('Rail')
insert into TransModeMaster values ('Air')
insert into TransModeMaster values ('Ship')
GO


CREATE TABLE [dbo].[VehicleTypeMaster](
	[VehicleTypeID] [int] NOT NULL IDENTITY(1,1),
	VehicleType [nvarchar](50) NOT NULL
) ON [PRIMARY]
insert into VehicleTypeMaster values ('O')
insert into VehicleTypeMaster values ('R')
GO


CREATE TABLE [dbo].[ItemTypeMaster](
	[ItemTypeID] [int] NOT NULL IDENTITY(1,1),
	ItemTypeCode [nvarchar](5) NOT NULL,
	ItemType [nvarchar](50) NOT NULL
) ON [PRIMARY]
insert into [ItemTypeMaster] values ('G', 'Goods')
insert into [ItemTypeMaster] values ('S','Service')
GO


CREATE TABLE [dbo].[UnitMaster](
	[UnitID] [tinyint] NOT NULL,
	[UnitCode] [nvarchar](5) NOT NULL,
	[UnitDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UnitMaster] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (1, N'BAG', N'BAGS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (2, N'BAL', N'BALE')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (3, N'BDL', N'BUNDLES')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (4, N'BKL', N'BUCKLES')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (5, N'BOU', N'BILLION OF UNITS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (6, N'BOX', N'BOX')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (7, N'BTL', N'BOTTLES')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (8, N'BUN', N'BUNCHES')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (9, N'CAN', N'CANS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (10, N'CCM', N'CUBIC CENTIMETERS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (11, N'CMS', N'CENTIMETERS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (12, N'CBM', N'CUBIC METERS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (13, N'CTN', N'CARTONS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (14, N'DOZ', N'DOZENS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (15, N'DRM', N'DRUMS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (16, N'GGK', N'GREAT GROSS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (17, N'GMS', N'GRAMMES')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (18, N'GRS', N'GROSS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (19, N'GYD', N'GROSS YARDS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (20, N'KGS', N'KILOGRAMS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (21, N'KLR', N'KILOLITRE')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (22, N'KME', N'KILOMETRE')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (23, N'LTR', N'LITRES')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (24, N'MLS', N'MILLI LITRES')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (25, N'MLT', N'MILILITRE')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (26, N'MTR', N'METERS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (27, N'MTS', N'METRIC TON')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (28, N'NOS', N'NUMBERS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (29, N'OTH', N'OTHERS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (30, N'PAC', N'PACKS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (31, N'PCS', N'PIECES')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (32, N'PRS', N'PAIRS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (33, N'QTL', N'QUINTAL')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (34, N'ROL', N'ROLLS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (35, N'SET', N'SETS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (36, N'SQF', N'SQUARE FEET')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (37, N'SQM', N'SQUARE METERS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (38, N'SQY', N'SQUARE YARDS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (39, N'TBS', N'TABLETS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (40, N'TGM', N'TEN GROSS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (41, N'THD', N'THOUSANDS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (42, N'TON', N'TONNES')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (43, N'TUB', N'TUBES')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (44, N'UGS', N'US GALLONS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (45, N'UNT', N'UNITS')
GO
INSERT [dbo].[UnitMaster] ([UnitID], [UnitCode], [UnitDescription]) VALUES (46, N'YDS', N'YARDS')
GO


GO
/****** Object:  Table [dbo].[CountryCodeMaster]    Script Date: 7/6/2022 8:24:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryCodeMaster](
	[CountryID] [tinyint] NOT NULL,
	[CountryCode] [nvarchar](5) NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CountryCodeMaster] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrencyMaster]    Script Date: 7/6/2022 8:24:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrencyMaster](
	[CurrencyID] [tinyint] NOT NULL,
	[CurrencyCode] [nvarchar](5) NOT NULL,
	[CurrencyName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CurrencyMaster] PRIMARY KEY CLUSTERED 
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortMaster]    Script Date: 7/6/2022 8:24:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortMaster](
	[PortID] [smallint] NOT NULL,
	[PortCode] [nvarchar](50) NOT NULL,
	[PortName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (1, N'AD', N'Andorra')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (2, N'AE', N'United Arab Emirates')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (3, N'AF', N'Afghanistan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (4, N'AG', N'Antigua and Barbuda')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (5, N'AI', N'Anguilla')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (6, N'AL', N'Albania')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (7, N'AM', N'Armenia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (8, N'AO', N'Angola')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (9, N'AQ', N'Antarctica')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (10, N'AR', N'Argentina')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (11, N'AS', N'American Samoa')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (12, N'AT', N'Austria')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (13, N'AU', N'Australia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (14, N'AW', N'Aruba')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (15, N'AX', N'�land Islands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (16, N'AZ', N'Azerbaijan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (17, N'BA', N'Bosnia and Herzegovina')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (18, N'BB', N'Barbados')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (19, N'BD', N'Bangladesh')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (20, N'BE', N'Belgium')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (21, N'BF', N'Burkina Faso')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (22, N'BG', N'Bulgaria')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (23, N'BH', N'Bahrain')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (24, N'BI', N'Burundi')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (25, N'BJ', N'Benin')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (26, N'BL', N'Saint Barth�lemy')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (27, N'BM', N'Bermuda')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (28, N'BN', N'Brunei Darussalam')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (29, N'BO', N'Bolivia (Plurinational State of)')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (30, N'BQ', N'Bonaire, Sint Eustatius and Saba')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (31, N'BR', N'Brazil')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (32, N'BS', N'Bahamas')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (33, N'BT', N'Bhutan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (34, N'BV', N'Bouvet Island')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (35, N'BW', N'Botswana')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (36, N'BY', N'Belarus')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (37, N'BZ', N'Belize')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (38, N'CA', N'Canada')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (39, N'CC', N'Cocos (Keeling) Islands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (40, N'CD', N'Congo, Democratic Republic of the')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (41, N'CF', N'Central African Republic')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (42, N'CG', N'Congo')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (43, N'CH', N'Switzerland')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (44, N'CI', N'C�te dIvoire')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (45, N'CK', N'Cook Islands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (46, N'CL', N'Chile')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (47, N'CM', N'Cameroon')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (48, N'CN', N'China')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (49, N'CO', N'Colombia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (50, N'CR', N'Costa Rica')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (51, N'CU', N'Cuba')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (52, N'CV', N'Cabo Verde')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (53, N'CW', N'Cura�ao')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (54, N'CX', N'Christmas Island')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (55, N'CY', N'Cyprus')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (56, N'CZ', N'Czechia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (57, N'DE', N'Germany')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (58, N'DJ', N'Djibouti')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (59, N'DK', N'Denmark')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (60, N'DM', N'Dominica')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (61, N'DO', N'Dominican Republic')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (62, N'DZ', N'Algeria')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (63, N'EC', N'Ecuador')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (64, N'EE', N'Estonia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (65, N'EG', N'Egypt')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (66, N'EH', N'Western Sahara')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (67, N'ER', N'Eritrea')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (68, N'ES', N'Spain')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (69, N'ET', N'Ethiopia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (70, N'FI', N'Finland')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (71, N'FJ', N'Fiji')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (72, N'FK', N'Falkland Islands (Malvinas)')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (73, N'FM', N'Micronesia (Federated States of)')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (74, N'FO', N'Faroe Islands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (75, N'FR', N'France')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (76, N'GA', N'Gabon')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (77, N'GB', N'United Kingdom of Great Britain and Northern Ireland')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (78, N'GD', N'Grenada')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (79, N'GE', N'Georgia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (80, N'GF', N'French Guiana')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (81, N'GG', N'Guernsey')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (82, N'GH', N'Ghana')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (83, N'GI', N'Gibraltar')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (84, N'GL', N'Greenland')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (85, N'GM', N'Gambia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (86, N'GN', N'Guinea')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (87, N'GP', N'Guadeloupe')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (88, N'GQ', N'Equatorial Guinea')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (89, N'GR', N'Greece')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (90, N'GS', N'South Georgia and the South Sandwich Islands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (91, N'GT', N'Guatemala')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (92, N'GU', N'Guam')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (93, N'GW', N'Guinea-Bissau')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (94, N'GY', N'Guyana')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (95, N'HK', N'Hong Kong')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (96, N'HM', N'Heard Island and McDonald Islands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (97, N'HN', N'Honduras')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (98, N'HR', N'Croatia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (99, N'HT', N'Haiti')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (100, N'HU', N'Hungary')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (101, N'ID', N'Indonesia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (102, N'IE', N'Ireland')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (103, N'IL', N'Israel')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (104, N'IM', N'Isle of Man')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (105, N'IN', N'India')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (106, N'IO', N'British Indian Ocean Territory')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (107, N'IQ', N'Iraq')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (108, N'IR', N'Iran (Islamic Republic of)')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (109, N'IS', N'Iceland')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (110, N'IT', N'Italy')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (111, N'JE', N'Jersey')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (112, N'JM', N'Jamaica')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (113, N'JO', N'Jordan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (114, N'JP', N'Japan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (115, N'KE', N'Kenya')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (116, N'KG', N'Kyrgyzstan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (117, N'KH', N'Cambodia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (118, N'KI', N'Kiribati')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (119, N'KM', N'Comoros')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (120, N'KN', N'Saint Kitts and Nevis')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (121, N'KP', N'Korea (Democratic Peoples Republic of)')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (122, N'KR', N'Korea, Republic of')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (123, N'KW', N'Kuwait')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (124, N'KY', N'Cayman Islands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (125, N'KZ', N'Kazakhstan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (126, N'LA', N'Lao Peoples Democratic Republic')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (127, N'LB', N'Lebanon')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (128, N'LC', N'Saint Lucia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (129, N'LI', N'Liechtenstein')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (130, N'LK', N'Sri Lanka')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (131, N'LR', N'Liberia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (132, N'LS', N'Lesotho')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (133, N'LT', N'Lithuania')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (134, N'LU', N'Luxembourg')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (135, N'LV', N'Latvia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (136, N'LY', N'Libya')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (137, N'MA', N'Morocco')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (138, N'MC', N'Monaco')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (139, N'MD', N'Moldova, Republic of')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (140, N'ME', N'Montenegro')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (141, N'MF', N'Saint Martin (French part)')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (142, N'MG', N'Madagascar')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (143, N'MH', N'Marshall Islands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (144, N'MK', N'North Macedonia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (145, N'ML', N'Mali')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (146, N'MM', N'Myanmar')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (147, N'MN', N'Mongolia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (148, N'MO', N'Macao')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (149, N'MP', N'Northern Mariana Islands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (150, N'MQ', N'Martinique')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (151, N'MR', N'Mauritania')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (152, N'MS', N'Montserrat')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (153, N'MT', N'Malta')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (154, N'MU', N'Mauritius')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (155, N'MV', N'Maldives')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (156, N'MW', N'Malawi')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (157, N'MX', N'Mexico')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (158, N'MY', N'Malaysia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (159, N'MZ', N'Mozambique')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (160, N'NA', N'Namibia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (161, N'NC', N'New Caledonia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (162, N'NE', N'Niger')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (163, N'NF', N'Norfolk Island')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (164, N'NG', N'Nigeria')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (165, N'NI', N'Nicaragua')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (166, N'NL', N'Netherlands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (167, N'NO', N'Norway')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (168, N'NP', N'Nepal')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (169, N'NR', N'Nauru')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (170, N'NU', N'Niue')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (171, N'NZ', N'New Zealand')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (172, N'OM', N'Oman')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (173, N'PA', N'Panama')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (174, N'PE', N'Peru')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (175, N'PF', N'French Polynesia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (176, N'PG', N'Papua New Guinea')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (177, N'PH', N'Philippines')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (178, N'PK', N'Pakistan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (179, N'PL', N'Poland')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (180, N'PM', N'Saint Pierre and Miquelon')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (181, N'PN', N'Pitcairn')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (182, N'PR', N'Puerto Rico')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (183, N'PS', N'Palestine, State of')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (184, N'PT', N'Portugal')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (185, N'PW', N'Palau')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (186, N'PY', N'Paraguay')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (187, N'QA', N'Qatar')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (188, N'RE', N'R�union')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (189, N'RO', N'Romania')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (190, N'RS', N'Serbia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (191, N'RU', N'Russian Federation')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (192, N'RW', N'Rwanda')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (193, N'SA', N'Saudi Arabia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (194, N'SB', N'Solomon Islands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (195, N'SC', N'Seychelles')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (196, N'SD', N'Sudan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (197, N'SE', N'Sweden')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (198, N'SG', N'Singapore')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (199, N'SH', N'Saint Helena, Ascension and Tristan da Cunha')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (200, N'SI', N'Slovenia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (201, N'SJ', N'Svalbard and Jan Mayen')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (202, N'SK', N'Slovakia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (203, N'SL', N'Sierra Leone')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (204, N'SM', N'San Marino')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (205, N'SN', N'Senegal')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (206, N'SO', N'Somalia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (207, N'SR', N'Suriname')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (208, N'SS', N'South Sudan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (209, N'ST', N'Sao Tome and Principe')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (210, N'SV', N'El Salvador')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (211, N'SX', N'Sint Maarten (Dutch part)')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (212, N'SY', N'Syrian Arab Republic')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (213, N'SZ', N'Eswatini')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (214, N'TC', N'Turks and Caicos Islands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (215, N'TD', N'Chad')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (216, N'TF', N'French Southern Territories')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (217, N'TG', N'Togo')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (218, N'TH', N'Thailand')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (219, N'TJ', N'Tajikistan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (220, N'TK', N'Tokelau')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (221, N'TL', N'Timor-Leste')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (222, N'TM', N'Turkmenistan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (223, N'TN', N'Tunisia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (224, N'TO', N'Tonga')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (225, N'TR', N'Turkey')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (226, N'TT', N'Trinidad and Tobago')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (227, N'TV', N'Tuvalu')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (228, N'TW', N'Taiwan, Province of China')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (229, N'TZ', N'Tanzania, United Republic of')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (230, N'UA', N'Ukraine')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (231, N'UG', N'Uganda')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (232, N'UM', N'United States Minor Outlying Islands')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (233, N'US', N'United States of America')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (234, N'UY', N'Uruguay')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (235, N'UZ', N'Uzbekistan')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (236, N'VA', N'Holy See')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (237, N'VC', N'Saint Vincent and the Grenadines')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (238, N'VE', N'Venezuela (Bolivarian Republic of)')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (239, N'VG', N'Virgin Islands (British)')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (240, N'VI', N'Virgin Islands (U.S.)')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (241, N'VN', N'Viet Nam')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (242, N'VU', N'Vanuatu')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (243, N'WF', N'Wallis and Futuna')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (244, N'WS', N'Samoa')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (245, N'YE', N'Yemen')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (246, N'YT', N'Mayotte')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (247, N'ZA', N'South Africa')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (248, N'ZM', N'Zambia')
GO
INSERT [dbo].[CountryCodeMaster] ([CountryID], [CountryCode], [CountryName]) VALUES (249, N'ZW', N'Zimbabwe')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (1, N'BDT', N'Bangladeshi taka')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (2, N'AED', N'United Arab Emirates dirham')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (3, N'AFN', N'Afghan afghani')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (4, N'ALL', N'Albanian lek')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (5, N'AMD', N'Armenian dram')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (6, N'ANG', N'Netherlands Antillean guilder')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (7, N'AOA', N'Angolan kwanza')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (8, N'ARS', N'Argentine peso')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (9, N'AUD', N'Australian dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (10, N'AWG', N'Aruban florin')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (11, N'AZN', N'Azerbaijani manat')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (12, N'BAM', N'Bosnia and Herzegovina convertible mark')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (13, N'BBD', N'Barbados dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (14, N'BDT', N'Bangladeshi taka')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (15, N'BGN', N'Bulgarian lev')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (16, N'BHD', N'Bahraini dinar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (17, N'BIF', N'Burundian franc')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (18, N'BMD', N'Bermudian dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (19, N'BND', N'Brunei dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (20, N'BOB', N'Boliviano')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (21, N'BOV', N'Bolivian Mvdol (funds code)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (22, N'BRL', N'Brazilian real')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (23, N'BSD', N'Bahamian dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (24, N'BTN', N'Bhutanese ngultrum')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (25, N'BWP', N'Botswana pula')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (26, N'BYN', N'Belarusian ruble')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (27, N'BZD', N'Belize dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (28, N'CAD', N'Canadian dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (29, N'CDF', N'Congolese franc')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (30, N'CHE', N'WIR�Euro (complementary currency)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (31, N'CHF', N'Swiss franc')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (32, N'CHW', N'WIR�Franc (complementary currency)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (33, N'CLF', N'Unidad de Fomento�(funds code)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (34, N'CLP', N'Chilean peso')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (35, N'CNY', N'Renminbi (Chinese) yuan')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (36, N'COP', N'Colombian peso')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (37, N'COU', N'Unidad de Valor Real (UVR) (funds code)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (38, N'CRC', N'Costa Rican colon')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (39, N'CUC', N'Cuban convertible peso')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (40, N'CUP', N'Cuban peso')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (41, N'CVE', N'Cape Verdean escudo')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (42, N'CZK', N'Czech koruna')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (43, N'DJF', N'Djiboutian franc')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (44, N'DKK', N'Danish krone')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (45, N'DOP', N'Dominican peso')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (46, N'DZD', N'Algerian dinar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (47, N'EGP', N'Egyptian pound')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (48, N'ERN', N'Eritrean nakfa')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (49, N'ETB', N'Ethiopian birr')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (50, N'EUR', N'Euro')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (51, N'FJD', N'Fiji dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (52, N'FKP', N'Falkland Islands pound')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (53, N'GBP', N'Pound sterling')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (54, N'GEL', N'Georgian lari')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (55, N'GHS', N'Ghanaian cedi')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (56, N'GIP', N'Gibraltar pound')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (57, N'GMD', N'Gambian dalasi')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (58, N'GNF', N'Guinean franc')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (59, N'GTQ', N'Guatemalan quetzal')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (60, N'GYD', N'Guyanese dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (61, N'HKD', N'Hong Kong dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (62, N'HNL', N'Honduran lempira')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (63, N'HRK', N'Croatian kuna')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (64, N'HTG', N'Haitian gourde')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (65, N'HUF', N'Hungarian forint')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (66, N'IDR', N'Indonesian rupiah')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (67, N'ILS', N'Israeli new shekel')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (68, N'INR', N'Indian rupee')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (69, N'IQD', N'Iraqi dinar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (70, N'IRR', N'Iranian rial')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (71, N'ISK', N'Icelandic kr�na')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (72, N'JMD', N'Jamaican dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (73, N'JOD', N'Jordanian dinar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (74, N'JPY', N'Japanese yen')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (75, N'KES', N'Kenyan shilling')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (76, N'KGS', N'Kyrgyzstani som')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (77, N'KHR', N'Cambodian riel')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (78, N'KMF', N'Comoro franc')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (79, N'KPW', N'North Korean won')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (80, N'KRW', N'South Korean won')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (81, N'KWD', N'Kuwaiti dinar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (82, N'KYD', N'Cayman Islands dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (83, N'KZT', N'Kazakhstani tenge')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (84, N'LAK', N'Lao kip')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (85, N'LBP', N'Lebanese pound')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (86, N'LKR', N'Sri Lankan rupee')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (87, N'LRD', N'Liberian dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (88, N'LSL', N'Lesotho loti')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (89, N'LYD', N'Libyan dinar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (90, N'MAD', N'Moroccan dirham')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (91, N'MDL', N'Moldovan leu')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (92, N'MGA', N'Malagasy ariary')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (93, N'MKD', N'Macedonian denar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (94, N'MMK', N'Myanmar kyat')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (95, N'MNT', N'Mongolian t�gr�g')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (96, N'MOP', N'Macanese pataca')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (97, N'MRU', N'Mauritanian ouguiya')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (98, N'MUR', N'Mauritian rupee')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (99, N'MVR', N'Maldivian rufiyaa')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (100, N'MWK', N'Malawian kwacha')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (101, N'MXN', N'Mexican peso')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (102, N'MXV', N'Mexican Unidad de Inversion�(UDI) (funds code)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (103, N'MYR', N'Malaysian ringgit')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (104, N'MZN', N'Mozambican metical')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (105, N'NAD', N'Namibian dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (106, N'NGN', N'Nigerian naira')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (107, N'NIO', N'Nicaraguan c�rdoba')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (108, N'NOK', N'Norwegian krone')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (109, N'NPR', N'Nepalese rupee')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (110, N'NZD', N'New Zealand dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (111, N'OMR', N'Omani rial')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (112, N'PAB', N'Panamanian balboa')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (113, N'PEN', N'Peruvian sol')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (114, N'PGK', N'Papua New Guinean kina')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (115, N'PHP', N'Philippine peso')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (116, N'PKR', N'Pakistani rupee')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (117, N'PLN', N'Polish zloty')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (118, N'PYG', N'Paraguayan guaran�')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (119, N'QAR', N'Qatari riyal')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (120, N'RON', N'Romanian leu')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (121, N'RSD', N'Serbian dinar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (122, N'RUB', N'Russian ruble')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (123, N'RWF', N'Rwandan franc')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (124, N'SAR', N'Saudi riyal')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (125, N'SBD', N'Solomon Islands dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (126, N'SCR', N'Seychelles rupee')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (127, N'SDG', N'Sudanese pound')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (128, N'SEK', N'Swedish krona/kronor')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (129, N'SGD', N'Singapore dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (130, N'SHP', N'Saint Helena pound')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (131, N'SLL', N'Sierra Leonean leone')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (132, N'SOS', N'Somali shilling')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (133, N'SRD', N'Surinamese dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (134, N'SSP', N'South Sudanese pound')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (135, N'STN', N'S?o Tom� and Pr�ncipe dobra')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (136, N'SVC', N'Salvadoran col�n')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (137, N'SYP', N'Syrian pound')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (138, N'SZL', N'Swazi lilangeni')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (139, N'THB', N'Thai baht')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (140, N'TJS', N'Tajikistani somoni')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (141, N'TMT', N'Turkmenistan manat')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (142, N'TND', N'Tunisian dinar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (143, N'TOP', N'Tongan pa?anga')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (144, N'TRY', N'Turkish lira')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (145, N'TTD', N'Trinidad and Tobago dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (146, N'TWD', N'New Taiwan dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (147, N'TZS', N'Tanzanian shilling')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (148, N'UAH', N'Ukrainian hryvnia')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (149, N'UGX', N'Ugandan shilling')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (150, N'USD', N'United States dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (151, N'USN', N'United States dollar (next day) (funds code)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (152, N'UYI', N'Uruguay Peso en Unidades Indexadas (URUIURUI) (funds code)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (153, N'UYU', N'Uruguayan peso')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (154, N'UYW', N'Unidad previsional')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (155, N'UZS', N'Uzbekistan som')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (156, N'VES', N'Venezuelan bol�var soberano')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (157, N'VND', N'Vietnamese d?ng')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (158, N'VUV', N'Vanuatu vatu')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (159, N'WST', N'Samoan tala')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (160, N'XAF', N'CFA franc BEAC')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (161, N'XAG', N'Silver�(one�troy ounce)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (162, N'XAU', N'Gold�(one�troy ounce)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (163, N'XBA', N'European Composite Unit�(EURCO) (bond market unit)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (164, N'XBB', N'European Monetary Unit�(E.M.U.-6) (bond market unit)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (165, N'XBC', N'European Unit of Account 9�(E.U.A.-9) (bond market unit)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (166, N'XBD', N'European Unit of Account 17�(E.U.A.-17) (bond market unit)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (167, N'XCD', N'East Caribbean dollar')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (168, N'XDR', N'Special drawing rights')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (169, N'XOF', N'CFA franc BCEAO')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (170, N'XPD', N'Palladium�(one�troy ounce)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (171, N'XPF', N'CFP franc�(franc Pacifique)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (172, N'XPT', N'Platinum�(one�troy ounce)')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (173, N'XSU', N'SUCRE')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (174, N'XTS', N'Code reserved for testing')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (175, N'XUA', N'ADB Unit of Account')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (176, N'XXX', N'No currency')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (177, N'YER', N'Yemeni rial')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (178, N'ZAR', N'South African rand')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (179, N'ZMW', N'Zambian kwacha')
GO
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencyName]) VALUES (180, N'ZWL', N'Zimbabwean dollar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (1, N'INABG1', N'Alibag')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (2, N'INACH1', N'Achra')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (3, N'INADA6', N'Ahmedabad Adalaj')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (4, N'INADI1', N'Androth Island')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (5, N'INAGI1', N'Agatti Island')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (6, N'INAGR4', N'Agra')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (7, N'INAGR5', N'FPO AGRA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (8, N'INAGR6', N'Agra')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (9, N'INAGTB', N'Agartala')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (10, N'INAGX4', N'Agatti Island')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (11, N'INAHD6', N'ICD SANAND')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (12, N'INAIG6', N'GE PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (13, N'INAII6', N'M/S IGATE GS LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (14, N'INAIK6', N'IBRAHIMPURICD KHURJA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (15, N'INAIR6', N'SP PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (16, N'INAJE6', N'WLSPUN ANJAR SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (17, N'INAJJ6', N'Arakkonam Melpakkam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (18, N'INAJL4', N'Aizawl')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (19, N'INAJM6', N'MUNDRA PORT SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (20, N'INAKB6', N'BIACPL SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (21, N'INAKD4', N'Akola')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (22, N'INAKP6', N'APIICL SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (23, N'INAKR6', N'RPCIPL SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (24, N'INAKV6', N'Ankleshwar ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (25, N'INALA1', N'ALANG SBY')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (26, N'INALF1', N'Allepey')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (27, N'INAMD4', N'Ahmedabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (28, N'INAMD5', N'Ahmedabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (29, N'INAMD6', N'Ahmedabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (30, N'INAMG6', N'Amingaon (Gauhati)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (31, N'INAMI1', N'Amini Island')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (32, N'INAMK6', N'KSITIL/SEZ/ALAPPUZHA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (33, N'INANG1', N'Anijengo')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (34, N'INANL1', N'Arnala')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (35, N'INAPI6', N'AAP-SEZ AHMEDABAD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (36, N'INAPL6', N'Dadri ACPL CFS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (37, N'INAPT6', N'Anaparti')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (38, N'INARR6', N'Aroor')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (39, N'INASR2', N'Amritsar Railway Stn')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (40, N'INASR6', N'Amritsar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (41, N'INATQ4', N'Amritsar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (42, N'INATQ6', N'Amritsar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (43, N'INATRB', N'Attari Road')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (44, N'INATT2', N'Attari Railway Stat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (45, N'INAWM6', N'SEZ, SHENDRA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (46, N'INAWS6', N'SOMANI SEZ BHIWADI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (47, N'INAWW6', N'WIDL AEZ, AURANGABAD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (48, N'INAZK1', N'Azhikkal')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (49, N'INBAG6', N'GEM&JEWEL-SEZ/ULWE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (50, N'INBAI6', N'IT/ITES-B-SEZ/ULWE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (51, N'INBAM6', N'MULTISERVCE-SEZ/ULWE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (52, N'INBAP6', N'MULTISERVICEDRONAGIR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (53, N'INBAT6', N'IT/ITES-C SEZ/UIWE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (54, N'INBAU6', N'IT/ITES-A-SEZ/ULWE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (55, N'INBAW6', N'ICD BAWAL')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (56, N'INBBI4', N'Bhubaneswar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (57, N'INBBM6', N'Bari Brahamna ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (58, N'INBBP1', N'Bahabal Pur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (59, N'INBBS6', N'SEZ, OIIDC, BHUBANES')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (60, N'INBCH6', N'HARI SEZ VARANASI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (61, N'INBCO6', N'EURO MULTIVISION SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (62, N'INBCP6', N'PRITECH/SEZ/BANGLORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (63, N'INBDB6', N'PRECIOUSCARGOCUSTOMS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (64, N'INBDG1', N'Badagara')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (65, N'INBDH6', N'ICD BADOHI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (66, N'INBDI6', N'ICD BADDI,')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (67, N'INBDM6', N'ICD, PANCHI, SONIPAT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (68, N'INBDQ1', N'Vadodara')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (69, N'INBDR1', N'Baindur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (70, N'INBED1', N'Bedi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (71, N'INBEK4', N'Bareilly')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (72, N'INBEP4', N'Bellary')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (73, N'INBET1', N'Betul')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (74, N'INBEY1', N'Beypore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (75, N'INBFR6', N'M/S GRFL, ICD, BALLA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (76, N'INBGK6', N'Bhagat ki Kothi Jodh')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (77, N'INBGMB', N'Baghmara')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (78, N'INBGQ6', N'QUEST SEZ BELGAUM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (79, N'INBGUB', N'Bairgania')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (80, N'INBGW1', N'Bhagwa')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (81, N'INBHC6', N'JUBILANT/SEZ/VILAYAT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (82, N'INBHD6', N'DAHEZ SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (83, N'INBHJ4', N'Bhuj')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (84, N'INBHL6', N'Bhilwara')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (85, N'INBHM1', N'Bheemunipatnam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (86, N'INBHO4', N'Bhopal')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (87, N'INBHS6', N'STERLING BHARUCH')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (88, N'INBHU1', N'Bhavanagar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (89, N'INBHU4', N'Bhavanagar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (90, N'INBKB4', N'Bikaner')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (91, N'INBKR1', N'Belekeri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (92, N'INBKT1', N'Bankot')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (93, N'INBLC6', N'CESSNA/SEZ/BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (94, N'INBLE6', N'CONCOR ICD BALASORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (95, N'INBLJ6', N'Agra')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (96, N'INBLK1', N'Belekeri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (97, N'INBLM1', N'Bilimora')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (98, N'INBLP1', N'Belapur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (99, N'INBLR4', N'Bangalore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (100, N'INBLR5', N'Bangalore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (101, N'INBLR6', N'Bangalore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (102, N'INBLTB', N'Balet')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (103, N'INBLV6', N'VTV/SEZ/BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (104, N'INBMA6', N'APIIC PRAKASHAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (105, N'INBMR2', N'Barmer Railway Stati')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (106, N'INBNC6', N'KBITS SEZ BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (107, N'INBND1', N'Bandra')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (108, N'INBNG6', N'MAHAGAON ICD, THANE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (109, N'INBNK6', N'KOLKATA IT PARK')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (110, N'INBNP1', N'Bheemunipatnam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (111, N'INBNRB', N'Bhimnagar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (112, N'INBNT6', N'TCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (113, N'INBNW6', N'WIPRO SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (114, N'INBNX6', N'CANDOR ONE HTSPL,SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (115, N'INBNYB', N'Berhni')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (116, N'INBOK6', N'BORKHEDI ICD NAGPUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (117, N'INBOLB', N'Bolanganj')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (118, N'INBOM1', N'Mumbai (Ex Bombay)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (119, N'INBOM4', N'Mumbai (Ex Bombay)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (120, N'INBOM5', N'Mumbai (Ex Bombay)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (121, N'INBOM6', N'Mumbai(EPZ/SEZ)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (122, N'INBPL5', N'BHOPAL FPO')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (123, N'INBPS5', N'APSO MUMBAI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (124, N'INBRAB', N'Barsora')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (125, N'INBRC6', N'Baroda')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (126, N'INBRH1', N'Broach')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (127, N'INBRI6', N'RNBIPL SEZ BIKANER')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (128, N'INBRL6', N'L & T/SEZ/VADODARA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (129, N'INBRM1', N'Borlai � Mandla')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (130, N'INBRS6', N'S E & C/SEZ/WAGHODIA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (131, N'INBRY1', N'Borya')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (132, N'INBSAB', N'Banbasa')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (133, N'INBSB6', N'Varanasi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (134, N'INBSL6', N'Bhusaval ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (135, N'INBSN1', N'Bassein')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (136, N'INBSR1', N'Bulsar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (137, N'INBSW6', N'AFS KAPASHERA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (138, N'INBTK1', N'Bhatkal')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (139, N'INBTMB', N'Bhithamore(Sursnad)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (140, N'INBTR1', N'Bitra Island')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (141, N'INBUD1', N'Budge-Budge')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (142, N'INBUL6', N'AN FTWZ BULANDSHAHR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (143, N'INBUP4', N'Bhatinda')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (144, N'INBUP6', N'Bhatinda')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (145, N'INBVC6', N'CONCR-ICD/BALLABGARH')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (146, N'INBWD6', N'Bhiwadi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (147, N'INBWN1', N'Bhiwandi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (148, N'INBXR6', N'DLF LTD., SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (149, N'INBYT1', N'Beyt')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (150, N'INCAG6', N'TATA STEEL SEZGANJAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (151, N'INCAM1', N'Cambay')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (152, N'INCAP1', N'Calingapatam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (153, N'INCAR1', N'Carijam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (154, N'INCAS6', N'SAPL SEZ/ GANJAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (155, N'INCBC6', N'CHIPL SEZ/ COIMBATOR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (156, N'INCBD4', N'Car Nicobar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (157, N'INCBDB', N'Changrabandh')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (158, N'INCBE6', N'COIMBATORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (159, N'INCBL1', N'Chandbali')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (160, N'INCBS6', N'SE&C COIMBATORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (161, N'INCCH6', N'Chinchwad ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (162, N'INCCI6', N'WIPRO SEZ HINJEWADI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (163, N'INCCJ1', N'Kozhikode (ex Calicu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (164, N'INCCJ4', N'Kozhikode (ex Calicu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (165, N'INCCP6', N'PEPPL SEZ, CHINCHWAD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (166, N'INCCQ6', N'M/S QB PARK LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (167, N'INCCT6', N'KINFRAFP SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (168, N'INCCU1', N'Calcutta')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (169, N'INCCU4', N'Calcutta')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (170, N'INCCU5', N'Calcutta')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (171, N'INCCW6', N'WIPRO LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (172, N'INCDC6', N'RGT PARK (PHASE-II)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (173, N'INCDD6', N'RGT PARK (PHASE-I)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (174, N'INCDL1', N'Cuddalore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (175, N'INCDP1', N'Coondapur (Ganguly)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (176, N'INCDP4', N'Cuddapah')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (177, N'INCDP6', N'M/S APIIC LTD SEZ.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (178, N'INCDQ6', N'QUARKCITY/SEZ/MOHALI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (179, N'INCDR6', N'SUN PHARMACEUTICALS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (180, N'INCEC6', N'L&T AE IT SEZ PVT.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (181, N'INCGA6', N'MWCD APARELS CHENGPA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (182, N'INCGE6', N'ETA TECH. PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (183, N'INCGI6', N'MWCD SEZ CHENGALPATU')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (184, N'INCGL6', N'MWCD AUTO ANCILARIES')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (185, N'INCHE6', N'Tiruppur-Chettipalay')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (186, N'INCHJ6', N'ICD WARDHA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (187, N'INCHL1', N'Colachel')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (188, N'INCHMB', N'Chamurchi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (189, N'INCHN6', N'Vadodara Chhani CFS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (190, N'INCHPB', N'Champai')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (191, N'INCHR1', N'Chapora')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (192, N'INCJA6', N'L&T AE IT SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (193, N'INCJB4', N'Coimbatore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (194, N'INCJB6', N'Coimbatore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (195, N'INCJC6', N'NCTL (ENGG.) SEZ/ KA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (196, N'INCJD6', N'DLF INFOCITY DEV.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (197, N'INCJE6', N'ECTN KANCHEEPURAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (198, N'INCJF6', N'FTIL SRIPERUMBUDUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (199, N'INCJH6', N'ICD WARDHA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (200, N'INCJI6', N'ETL IS LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (201, N'INCJJ6', N'J M FTZ/SEZ/MANNUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (202, N'INCJN6', N'NIPL SEZ SRIPERUMBUD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (203, N'INCJO6', N'SIPCOT ORAGADAM SRIP')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (204, N'INCJS6', N'SIPCOT SRIPERUMBUDUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (205, N'INCLK6', N'KSITIL/SEZ/KOZHIKODE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (206, N'INCLU6', N'ULCCS/SEZ/KOZHIKODE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (207, N'INCLX6', N'Chirala')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (208, N'INCMB1', N'Cambay')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (209, N'INCML6', N'KATHUWAS ICD ALWAR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (210, N'INCNB1', N'Car-Nicobar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (211, N'INCNC6', N'NCT PVT. LTD. SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (212, N'INCNN1', N'Cannanore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (213, N'INCOA6', N'KAKINADA SEZ KAKINAD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (214, N'INCOH4', N'Cooch Behar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (215, N'INCOK1', N'Cochin')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (216, N'INCOK4', N'Cochin')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (217, N'INCOK6', N'Cochin(EPZ/SEZ)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (218, N'INCOL1', N'Colochel')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (219, N'INCOO1', N'Coondapur (Ganguly)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (220, N'INCOP6', N'PARRY SEZ KAKINADA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (221, N'INCPC6', N'Kanpur Chakeri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (222, N'INCPL6', N'Dadri CGML')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (223, N'INCPR6', N'ICD CHAWAPAYAL')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (224, N'INCRL6', N'RGA SEZ CHIKKANKANNE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (225, N'INCRN1', N'Cornwallis')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (226, N'INCRW6', N'WIPRO/SEZ/BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (227, N'INCRXB', N'LOKSAN LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (228, N'INCSP6', N'SI PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (229, N'INCSV6', N'SPVL SEZ COIMBATORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (230, N'INCTI1', N'Chetlat Island')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (231, N'INCUM1', N'Cutch Mandvi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (232, N'INDAE4', N'Daparizo')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (233, N'INDAH1', N'Dahej')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (234, N'INDAI4', N'Darjeeling')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (235, N'INDAM1', N'Daman')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (236, N'INDAM4', N'Daman')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (237, N'INDAR6', N'ARTHA SEZ GR. NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (238, N'INDBD4', N'Dhanbad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (239, N'INDBS6', N'SANTA-SEZ/ViII-MUPPI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (240, N'INDDL6', N'PSWC ICD DHANDARIKAL')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (241, N'INDEA6', N'AS PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (242, N'INDED4', N'Dehra Dun')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (243, N'INDEF6', N'INFOSYS SEZ DADRI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (244, N'INDEG1', N'Deogad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (245, N'INDEH6', N'HCL TECH. LTD. DEV.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (246, N'INDEI6', N'IVR SEZ NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (247, N'INDEJ6', N'JUBILANT SEZ NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (248, N'INDEL4', N'Delhi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (249, N'INDEL5', N'Delhi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (250, N'INDEM6', N'MOSERBAER/SEZ/NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (251, N'INDEN6', N'M/S NIIT TECH. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (252, N'INDEP4', N'Deparizo')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (253, N'INDER6', N'Dadri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (254, N'INDES6', N'M/S SEAVIEW DEV. LTD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (255, N'INDET6', N'UNITECH HITECH NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (256, N'INDEU6', N'UNITECHINFRA NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (257, N'INDEW6', N'M/S WIPRO LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (258, N'INDGI6', N'GALLANT SEZ NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (259, N'INDGT6', N'GOLDEN SEZ NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (260, N'INDHA6', N'Indore-Dhannad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (261, N'INDHBB', N'Dhubri Steamerghat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (262, N'INDHLB', N'Dhalaighat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (263, N'INDHM4', N'Dharamsala')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (264, N'INDHN1', N'Dahanu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (265, N'INDHP1', N'Dabhol Port')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (266, N'INDHR1', N'Dholera')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (267, N'INDHU1', N'Dahanu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (268, N'INDIB4', N'Dibrugarh')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (269, N'INDID6', N'SEZ, MIDC, NANDED')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (270, N'INDIG1', N'Dighi Port')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (271, N'INDIG6', N'Dighi (Pune)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (272, N'INDIT6', N'ANSAL IT/SEZ/NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (273, N'INDIU1', N'Diu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (274, N'INDIU4', N'Diu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (275, N'INDIV1', N'Div')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (276, N'INDLAB', N'Dharchula')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (277, N'INDLH6', N'APLLP SEZ BENGALURU')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (278, N'INDLI2', N'Delhi Railway Statio')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (279, N'INDLOB', N'BIRPARA LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (280, N'INDLUB', N'Dalu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (281, N'INDMA1', N'DHAMRA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (282, N'INDMRB', N'Demagir')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (283, N'INDMT1', N'Dharamtar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (284, N'INDMU4', N'Dimapur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (285, N'INDPC4', N'DPC BKC Mumbai')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (286, N'INDPR6', N'DAPPER')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (287, N'INDRC6', N'RCIPL SEZ NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (288, N'INDRGB', N'Darranga')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (289, N'INDRK1', N'Dwarka (Rupen)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (290, N'INDRL1', N'Dabolim')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (291, N'INDRU6', N'Belgaum Desur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (292, N'INDSK1', N'Dhanu-shkodi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (293, N'INDSM6', N'SMRTPL SEZ NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (294, N'INDTW1', N'Dantiwara')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (295, N'INDUR6', N'ICD Durgapur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (296, N'INDWA1', N'Dwarka')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (297, N'INDWKB', N'Dawki')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (298, N'INDWN6', N'ICD SAMALKHA PANIPAT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (299, N'INDWR6', N'INFOSYS SEZ HUBLI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (300, N'INENR1', N'KAMARAJAR PORT LTD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (301, N'INERP6', N'PUTHUVYPEEN SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (302, N'INERV6', N'VALLARPADOM SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (303, N'INESH1', N'Elphinstone Harbour')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (304, N'INFBD6', N'ICD Faridabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (305, N'INFBE6', N'ESPIRE SEZ FARIDABAD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (306, N'INFBM6', N'METRO SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (307, N'INFBP6', N'PERPETUAL FARIDABAD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (308, N'INFBRB', N'Fulbari LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (309, N'INFBS6', N'SELECTOSEZ FARIDABAD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (310, N'INFCH5', N'FPO(SEA) CHENNAI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (311, N'INFLT6', N'Falta(SEZ)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (312, N'INFMA6', N'APIICL MEDAK')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (313, N'INFMH6', N'HGSEZL RANGA REDDY')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (314, N'INFMJ6', N'M/S J.T. SEZ, RANGAR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (315, N'INFMS6', N'M/S STARGAZE, SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (316, N'INGAIB', N'Gauriphanta')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (317, N'INGALB', N'Galgalia')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (318, N'INGAO6', N'OPGS POWER GUJARAT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (319, N'INGAS6', N'ANSAL SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (320, N'INGAU1', N'Gauhati (Panidi)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (321, N'INGAU2', N'Gauhati (Panidi)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (322, N'INGAU4', N'Gauhati (Panidi)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (323, N'INGAU5', N'FPO GUWAHATI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (324, N'INGAW2', N'Guwahati')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (325, N'INGAY4', N'Gaya')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (326, N'INGDL6', N'DLF CYBERCITY SEZ,')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (327, N'INGDM6', N'MF PARK PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (328, N'INGDP6', N'FLLPL SEZ THIRUVALUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (329, N'INGED2', N'Gede Railway Station')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (330, N'INGGA1', N'Gogha')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (331, N'INGGB6', N'SBPL SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (332, N'INGGC6', N'ORIENT SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (333, N'INGGD6', N'DLF LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (334, N'INGGE6', N'AEPL SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (335, N'INGGF6', N'FRESH SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (336, N'INGGG6', N'GHI SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (337, N'INGGI6', N'GIL SEZ, GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (338, N'INGGL6', N'LUXOR SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (339, N'INGGM6', N'MIPPL SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (340, N'INGGN2', N'Gurgaon')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (341, N'INGGO6', N'ORIENTCRAFT SEZ GGN')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (342, N'INGGP6', N'SUNWISE SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (343, N'INGGS6', N'SUNCITY SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (344, N'INGGU6', N'URP LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (345, N'INGGV1', N'GANGAVARAM PORT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (346, N'INGHA1', N'Ghogha')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (347, N'INGHC6', N'ASF INSIGNIA SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (348, N'INGHPB', N'Ghasuapara')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (349, N'INGHR6', N'Garhi Harsaru Gurgao')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (350, N'INGHWB', N'Gauhati Steamerghat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (351, N'INGID6', N'MID PLTD SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (352, N'INGIN6', N'Gandhidham')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (353, N'INGJIB', N'Gunji')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (354, N'INGJXB', N'Ghojadanga')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (355, N'INGKJ2', N'Golakganj Railway St')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (356, N'INGKJB', N'Golakganj LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (357, N'INGLY6', N'APIIC MAHABOOBNAGAR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (358, N'INGMI6', N'MID PVT LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (359, N'INGNA6', N'APPL, SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (360, N'INGNC6', N'GIFT SEZ LTD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (361, N'INGNG6', N'GIDC, SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (362, N'INGNL6', N'LOMA ITPARK GHANSOLI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (363, N'INGNP6', N'GPRPL SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (364, N'INGNR6', N'LIPL/MARRIPLEMGUNTUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (365, N'INGNT6', N'TCSL, SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (366, N'INGOI4', N'Goa')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (367, N'INGOP4', N'Gorakhpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (368, N'INGPB6', N'PROGRESSIVE GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (369, N'INGPR1', N'Gopalpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (370, N'INGRD6', N'Mumbai DP-II')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (371, N'INGRL6', N'GPRL SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (372, N'INGRN6', N'RELIANCE SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (373, N'INGRR6', N'Mumbai DP-I')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (374, N'INGRS6', N'RAHEJA SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (375, N'INGRW6', N'APM ICD BHAMBOLIKHED')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (376, N'INGTGB', N'Gitaldah road')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (377, N'INGTI6', N'INFOSYS TECH. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (378, N'INGTR2', N'Guntur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (379, N'INGTS6', N'SP PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (380, N'INGTZB', N'Getandah')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (381, N'INGUX4', N'Guna')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (382, N'INGWL4', N'Gwalior')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (383, N'INGWL6', N'Malanpuri (Gwalior)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (384, N'INGWM4', N'VIJAYAWADA AIRPORT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (385, N'INHAL1', N'Haldia')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (386, N'INHAN6', N'HINDAUN ICD KARAULI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (387, N'INHAO6', N'OPTOINFRA/SEZ/HASSAN')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (388, N'INHAS6', N'HASSAN ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (389, N'INHBB6', N'SDPL SEZ BENGALURU')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (390, N'INHBX4', N'Hubli')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (391, N'INHDD6', N'SIDCUL ICD PANTNAGAR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (392, N'INHEB6', N'GOCL SEZ BENGALURU')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (393, N'INHEI6', N'INFOSYS/SEZ/MYSORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (394, N'INHEM6', N'MEBP/SEZ/BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (395, N'INHGLB', N'Hingalganj')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (396, N'INHGT1', N'Hangarkatta')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (397, N'INHIR6', N'SHB ICD SURAT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (398, N'INHJR4', N'Khajuraho')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (399, N'INHLD2', N'Haldibari Railway St')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (400, N'INHLE6', N'INFY SEZ BEGURHOBLI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (401, N'INHLIB', N'Hilli')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (402, N'INHND1', N'HEMNAGAR PORT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (403, N'INHON1', N'Honavar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (404, N'INHPI6', N'SANDKHERA ICD KASHIP')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (405, N'INHRN1', N'Harnai')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (406, N'INHSF6', N'KIADBFP SEZ HASSAN')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (407, N'INHSP6', N'KIADBP SEZ HASSAN')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (408, N'INHSS4', N'Hissar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (409, N'INHST6', N'KIADBT SEZ HASSAN')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (410, N'INHSU6', N'ICD HOSUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (411, N'INHTSB', N'Hatisar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (412, N'INHUR6', N'M/S RASSI, SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (413, N'INHWR1', N'Honawar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (414, N'INHYB6', N'LHT PARK PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (415, N'INHYD4', N'Hyderabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (416, N'INHYD5', N'FPO HYDERABAD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (417, N'INHYD6', N'Hyderabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (418, N'INHZA1', N'HAZIRA, SURAT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (419, N'INHZA6', N'Hazira SEZ, Surat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (420, N'INIDR4', N'Indore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (421, N'INIDR6', N'Indore(EPZ/SEZ)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (422, N'INIGU6', N'Coimbatore Irugur IC')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (423, N'INILP6', N'Tiruvallur-ILP ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (424, N'INIMF4', N'Imphal')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (425, N'ININB6', N'CRYSTAL IT PARK, SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (426, N'ININD6', N'ICD Pithampur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (427, N'ININI6', N'IMPETUS INFOTECH SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (428, N'ININN6', N'INFOSYS SEZ INDORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (429, N'ININT6', N'TCS SEZ INDORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (430, N'INISK4', N'Nasik')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (431, N'INISK6', N'Nasik')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (432, N'INIXA4', N'Agartala')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (433, N'INIXB4', N'Bagdogra')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (434, N'INIXC4', N'Chandigarh')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (435, N'INIXD4', N'Allahabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (436, N'INIXE1', N'Mangalore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (437, N'INIXE4', N'Mangalore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (438, N'INIXG4', N'Belgaum')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (439, N'INIXH4', N'Kailashahar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (440, N'INIXI4', N'Lilabari')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (441, N'INIXJ4', N'Jammu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (442, N'INIXK4', N'Keshod')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (443, N'INIXL4', N'Leh')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (444, N'INIXL5', N'FPO LEH')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (445, N'INIXM4', N'Madurai')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (446, N'INIXM6', N'MaduraiICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (447, N'INIXN4', N'Khowai')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (448, N'INIXP4', N'Pathankot')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (449, N'INIXQ4', N'Kamalpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (450, N'INIXR4', N'Ranchi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (451, N'INIXS4', N'Silchar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (452, N'INIXT4', N'Pasighat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (453, N'INIXU4', N'AURANGABAD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (454, N'INIXW4', N'Jamshedpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (455, N'INIXW6', N'Jamshedpur ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (456, N'INIXY1', N'Kandla')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (457, N'INIXY4', N'Kandla')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (458, N'INIXY6', N'Kandla SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (459, N'INIXZ1', N'Port Blair')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (460, N'INIXZ4', N'Port Blair')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (461, N'INJAI4', N'Jaipur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (462, N'INJAI5', N'Jaipur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (463, N'INJAI6', N'Jaipur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (464, N'INJAK1', N'Jakhau')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (465, N'INJAL6', N'Jalgaon')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (466, N'INJAYB', N'Jayanagar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (467, N'INJBD1', N'Jafrabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (468, N'INJBL6', N'E-COMPLEX SEZ/Amreli')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (469, N'INJBNB', N'JOGBANI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (470, N'INJDA1', N'Jodia')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (471, N'INJDH4', N'Jodhpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (472, N'INJDH6', N'Jodhpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (473, N'INJGA4', N'Jamnagar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (474, N'INJGB4', N'Jagdalpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (475, N'INJGD1', N'Jaigad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (476, N'INJGI6', N'GENPACT SEZ JAIPUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (477, N'INJHA6', N'VEDANTA ALU. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (478, N'INJHOB', N'Jhulaghat (Pithoraga')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (479, N'INJHV6', N'VEDANTASEZJHARSUGUDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (480, N'INJIGB', N'Jaigaon')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (481, N'INJJK6', N'ICD JSL JAJPUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (482, N'INJKA6', N'SACHANA ICD VIRAMGAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (483, N'INJLR4', N'Jabalpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (484, N'INJNJ6', N'NEWFOUND SEZ THANE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (485, N'INJNR4', N'Nashik-Janori ACC')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (486, N'INJNR6', N'Nashik-Janori ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (487, N'INJPGB', N'Jalpaiguri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (488, N'INJPI6', N'RIICO SEZ 1 SITAPUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (489, N'INJPV6', N'VATIKA SEZ JAIPUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (490, N'INJPW6', N'MWC JAIPUR LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (491, N'INJRH4', N'Jorhat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (492, N'INJSA4', N'Jaisalmer')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (493, N'INJSG6', N'CONCOR JHARSUGUDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (494, N'INJSM6', N'ADANI POWER SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (495, N'INJSZ6', N'JAIPUR SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (496, N'INJTP1', N'Jaitapur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (497, N'INJUC6', N'Jalandhar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (498, N'INJUX6', N'Basni Jodhpur ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (499, N'INJWAB', N'Jarwa')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (500, N'INKAK1', N'Kakinada')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (501, N'INKAK6', N'Kakinada')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (502, N'INKAL1', N'Kallai')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (503, N'INKAP6', N'Kapadra (Surat)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (504, N'INKAR6', N'Karur ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (505, N'INKAT1', N'KATTUPALLI PORT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (506, N'INKBC6', N'ICD HAZIRA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (507, N'INKBT1', N'Khambhat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (508, N'INKCG6', N'NSL SEZ PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (509, N'INKDD6', N'Karedu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (510, N'INKDI1', N'Kadmat Island')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (511, N'INKDL6', N'KANDLA SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (512, N'INKDN1', N'Kodinar(Muldwarka)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (513, N'INKDP1', N'Kondiapetnam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (514, N'INKELB', N'Kel Sahar Subdivisio')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (515, N'INKGG6', N'GLOBAL/SEZ/BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (516, N'INKGJ1', N'KARIMGANJ STEAMERGHA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (517, N'INKHD6', N'ICD Kheda-Dhar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (518, N'INKIW1', N'Kelwa')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (519, N'INKJA6', N'APP/SEZ/DODAKANAHALI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (520, N'INKJB6', N'BAGMAN/SEZ/BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (521, N'INKJD6', N'DIVYA/SEZ/BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (522, N'INKJG6', N'GOPALAN/SEZ/BANGALOR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (523, N'INKJH6', N'HCL/SEZ/BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (524, N'INKJIB', N'PIPRAUN LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (525, N'INKJM6', N'BD SEZ BENGALURU')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (526, N'INKJR6', N'BBREL KUNDALAHALLI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (527, N'INKKR1', N'Kilakari')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (528, N'INKKU6', N'Kanakpura Jaipur ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (529, N'INKLB6', N'BLUE/SEZ/ERNAKULAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (530, N'INKLC6', N'CARB/SEZ/ERNAKULAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (531, N'INKLG6', N'SGS/SEZ/ERNAKULAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (532, N'INKLH4', N'Kohlapur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (533, N'INKLI6', N'INFOPARK/SEZ/EKM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (534, N'INKLK6', N'KINFRA KANAYANNOOR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (535, N'INKLM6', N'MULTISERVCEKALAMBOLI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (536, N'INKLN6', N'IT/ITES/SEZ/KALAMBOL')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (537, N'INKLS6', N'SMART CITY SEZ KOCHI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (538, N'INKLY1', N'Kalyan')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (539, N'INKMAB', N'KULKULI LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (540, N'INKMB1', N'Kumbharu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (541, N'INKMI6', N'INFO SEZ ERNAKULAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (542, N'INKML6', N'DEIPL KURUBARAPALLI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (543, N'INKND1', N'Kankudy')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (544, N'INKNK6', N'INFOPARK SEZ KORATTY')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (545, N'INKNLB', N'Kunauli')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (546, N'INKNU4', N'Kanpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (547, N'INKNU5', N'FPO KANPUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (548, N'INKNU6', N'Kanpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (549, N'INKOC5', N'Kochi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (550, N'INKOD1', N'Kodinar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (551, N'INKOI1', N'Koilthottum')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (552, N'INKOK1', N'Koka')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (553, N'INKON1', N'Konarak')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (554, N'INKPK6', N'CONCOR ICD MIHAN')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (555, N'INKRI1', N'Krishnapatnam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (556, N'INKRK1', N'Karaikal')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (557, N'INKRM6', N'MADC LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (558, N'INKRN1', N'Karanja')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (559, N'INKRP1', N'Kiranpani')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (560, N'INKRW1', N'Karwar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (561, N'INKSG1', N'Kasargod')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (562, N'INKSH1', N'Kelshi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (563, N'INKSP1', N'Kulasekarapatnam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (564, N'INKTD1', N'Kotda')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (565, N'INKTGB', N'Katarniyaghat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (566, N'INKTI1', N'Kiltan Island')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (567, N'INKTRB', N'Kathihar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (568, N'INKTT6', N'Kota')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (569, N'INKTU4', N'Kota')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (570, N'INKTU6', N'Kota')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (571, N'INKTW1', N'Koteshwar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (572, N'INKTY6', N'CHEYYAR POCHAMPALLI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (573, N'INKUK1', N'KOLLAM PORT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (574, N'INKUK6', N'KSITIL/SEZ/KOLLAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (575, N'INKUR6', N'OIIDC SEZ KHURDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (576, N'INKUU4', N'Kulu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (577, N'INKVI1', N'Kavi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (578, N'INKVL1', N'Kovalam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (579, N'INKVR6', N'WFPML SEZ KOVVUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (580, N'INKVT1', N'Kavaratti Island')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (581, N'INKWAB', N'Khunwa')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (582, N'INKWGB', N'Khowaighat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (583, N'INKWHB', N'KAKRAHAWA LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (584, N'INKXJ2', N'Karimganj Railway St')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (585, N'INKYM6', N'KOTTAYAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (586, N'INKZE6', N'E TECH-I/SEZ/THPURAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (587, N'INKZP6', N'E PARK-III/SEZ/T''RAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (588, N'INKZT6', N'E PARK-II/SEZ/TPURAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (589, N'INLCH6', N'HCL IT SEZ LUCKNOW')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (590, N'INLDA4', N'Malda')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (591, N'INLDH6', N'Ludhiana')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (592, N'INLGLB', N'Lalgola Town')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (593, N'INLKO4', N'Lucknow')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (594, N'INLKQB', N'LAUKAHA LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (595, N'INLON6', N'ICD Loni')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (596, N'INLPB6', N'BBLLP NANAKRAMGUDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (597, N'INLPC6', N'CMC LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (598, N'INLPD6', N'M/S DLF, SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (599, N'INLPG6', N'GCPL SEZ KOKAPET')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (600, N'INLPI6', N'M/S SUNDEW, SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (601, N'INLPJ6', N'RELIANCE SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (602, N'INLPM6', N'MDL NANAKRAMGUDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (603, N'INLPR1', N'Leapuram')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (604, N'INLPS6', N'D NSL IP LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (605, N'INLPW6', N'WIPRO LTD. HYDERABAD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (606, N'INLTBB', N'Latu Bazar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (607, N'INLUD6', N'LUDHIANA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (608, N'INLUH4', N'Ludhiana')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (609, N'INLUH5', N'FPO LUDHIANA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (610, N'INLUH6', N'Ludhiana')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (611, N'INLWG6', N'WIPRO LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (612, N'INMAA1', N'Chennai (Ex Madras)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (613, N'INMAA4', N'Chennai (Ex Madras)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (614, N'INMAA5', N'Chennai (Ex Madras)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (615, N'INMAA6', N'Chennai(EPZ/SEZ)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (616, N'INMAB6', N'BRIGADE/SEZ/KANNADA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (617, N'INMAE6', N'EC OF TAMIL NADU')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (618, N'INMAH1', N'Mahe')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (619, N'INMAI6', N'INFOSYS/SEZ/MANGALOR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (620, N'INMAL1', N'Malpe')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (621, N'INMAP1', N'Masulipatnam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (622, N'INMAQ6', N'MANGALORE SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (623, N'INMAS6', N'TRIL INFOPARK LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (624, N'INMBC6', N'Moradabad(EPZ/SEZ)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (625, N'INMBD6', N'Pakwara (Moradabad)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (626, N'INMBS6', N'Madhosingh ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (627, N'INMCI1', N'Minicoi I')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (628, N'INMDA1', N'Magdalla')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (629, N'INMDD6', N'Mandideep ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (630, N'INMDE6', N'APIIC SEZ MEDAK')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (631, N'INMDG6', N'Margao')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (632, N'INMDK1', N'Muldwarka')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (633, N'INMDP1', N'Mandapam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (634, N'INMDU6', N'KERN ICD MADURAI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (635, N'INMDV1', N'Mandvi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (636, N'INMDW1', N'Meadows')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (637, N'INMEA6', N'APIIC-SEZ/ViII-LALGA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (638, N'INMEC6', N'EC OF TAMIL NADU')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (639, N'INMGHB', N'Mahendraganj')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (640, N'INMGR1', N'Mangrol')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (641, N'INMHA1', N'Mahuva')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (642, N'INMHDB', N'Kotawalighat (Mohedi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (643, N'INMHE1', N'Mahe')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (644, N'INMHGB', N'Mahurighat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (645, N'INMHN2', N'Mahisashan Railway S')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (646, N'INMKCB', N'Manikarchar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (647, N'INMKD6', N'MIKADO SEZ GURGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (648, N'INMLI1', N'Maroli')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (649, N'INMLP1', N'Mallipuram')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (650, N'INMLW1', N'Malwan')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (651, N'INMNB2', N'Munabao Railway Stat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (652, N'INMNR1', N'Manori')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (653, N'INMNUB', N'Manu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (654, N'INMNW1', N'Mandwa')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (655, N'INMOH4', N'Mohanbari')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (656, N'INMOR2', N'Moradabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (657, N'INMPC1', N'TEST')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (658, N'INMPR6', N'Malanpur ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (659, N'INMQK6', N'KIADB/SEZ/MANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (660, N'INMRA1', N'Mora')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (661, N'INMRD1', N'Murad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (662, N'INMREB', N'Moreh')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (663, N'INMRG4', N'Margao')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (664, N'INMRJ6', N'Miraj')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (665, N'INMRM1', N'Marmagoa')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (666, N'INMSR6', N'RENAIS/SEZ/BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (667, N'INMTW1', N'Metwad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (668, N'INMUC6', N'SCPL/SEZ/MULUND')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (669, N'INMUL6', N'Mulund ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (670, N'INMUN1', N'Mundra')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (671, N'INMUR1', N'Murad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (672, N'INMUZ6', N'MODINAGAR ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (673, N'INMWA6', N'ICD Maliwada')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (674, N'INMYB1', N'Mayabandar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (675, N'INMYL6', N'L AND T/SEZ/MYSORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (676, N'INMYO6', N'OPTOINFRA/SEZ/MYSORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (677, N'INMYQ4', N'Mysore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (678, N'INMZA4', N'Muzaffarnagar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (679, N'INMZU4', N'Muzaffarpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (680, N'INNAG4', N'Nagpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (681, N'INNAG6', N'Nagpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (682, N'INNAN1', N'Nancowrie')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (683, N'INNAV1', N'Navlakhi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (684, N'INNDA6', N'Noida(EPZ/SEZ)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (685, N'INNDC4', N'Nanded')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (686, N'INNDG1', N'Nandgaon')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (687, N'INNDP1', N'Tuglakabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (688, N'INNEE1', N'Neendakara')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (689, N'INNEL1', N'Nellore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (690, N'INNGB6', N'BUTIBORI ICD NAGPUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (691, N'INNGKB', N'NAGARKATA LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (692, N'INNGO6', N'OSE SEZ NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (693, N'INNGP6', N'Nagpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (694, N'INNGRB', N'Nepalgunj Road')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (695, N'INNGSB', N'Village Namgaya Ship')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (696, N'INNKI6', N'INDIABULLS NASHIK')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (697, N'INNKNB', N'Namkhana')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (698, N'INNML1', N'New Mangalore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (699, N'INNMTB', N'Neamati steamer Ghat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (700, N'INNNN6', N'AMRL SEZ NANGUNERI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (701, N'INNPGB', N'Nampong')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (702, N'INNPT1', N'Nagapattinam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (703, N'INNRP6', N'AA LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (704, N'INNSA1', N'Jawaharlal Nehru (Nh')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (705, N'INNSK6', N'Nasik')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (706, N'INNTLB', N'SHERATHANG LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (707, N'INNTVB', N'THOOTHIBARI LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (708, N'INNUR6', N'Kundli')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (709, N'INNVB1', N'Navabunder(with its')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (710, N'INNVP1', N'Navaspur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (711, N'INNVT1', N'Nivti')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (712, N'INNVY4', N'Neyveli')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (713, N'INNWP1', N'Newapur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (714, N'INNYP6', N'APIIC LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (715, N'INOKH1', N'Okha')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (716, N'INOMN4', N'Osmanabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (717, N'INOMU1', N'Old Mundra Port')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (718, N'INONJ1', N'Onjal')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (719, N'INPAB4', N'Bilaspur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (720, N'INPAK6', N'KSITIL/SEZ/PAYYANOOR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (721, N'INPAN1', N'Panaji Port')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (722, N'INPAO6', N'HBS SEZ PANOLI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (723, N'INPAP2', N'Panipat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (724, N'INPAT4', N'Patna')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (725, N'INPAV1', N'Pipavav (Victor) Por')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (726, N'INPAV2', N'Pipavav (Victor) Por')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (727, N'INPBD1', N'Porbandar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (728, N'INPBD4', N'Porbandar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (729, N'INPBLB', N'KAMARDWISA LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (730, N'INPDD1', N'Padubidri Minor Port')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (731, N'INPEK6', N'EKIPL/SEZ/PUNE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (732, N'INPGH4', N'Pantnagar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (733, N'INPHBB', N'Phulbari')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (734, N'INPID1', N'Port Indai')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (735, N'INPIN1', N'Pindhara')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (736, N'INPIT6', N'ITL/SEZ/PUNE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (737, N'INPKD6', N'IGEL SEZ SETTIPALI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (738, N'INPKR6', N'ICD PALI, REWARI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (739, N'INPMB1', N'Pamban')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (740, N'INPMP6', N'Pimpri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (741, N'INPMT6', N'MTDCCL/SEZ/PUNE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (742, N'INPNB6', N'BTSL SEZ PUNE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (743, N'INPNE6', N'NT PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (744, N'INPNF5', N'PATNA FPO')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (745, N'INPNI6', N'MITTAL SEZ PANIPAT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (746, N'INPNJ1', N'Panjim')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (747, N'INPNK6', N'KLPPL PANKI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (748, N'INPNL6', N'PERSIPINA SEZ RAIGAD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (749, N'INPNM1', N'Panambur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (750, N'INPNN1', N'Ponnani')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (751, N'INPNP6', N'Babarpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (752, N'INPNQ2', N'Pune')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (753, N'INPNQ4', N'Pune')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (754, N'INPNQ6', N'SERUM BIO/SEZ/PUNE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (755, N'INPNTB', N'Panitanki(Naxalbari)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (756, N'INPNU6', N'TMSF PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (757, N'INPNV6', N'ICD Panvel')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (758, N'INPNY1', N'Pondicherry')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (759, N'INPNY4', N'Pondicherry')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (760, N'INPNY6', N'ICD PULICHAPALLAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (761, N'INPPG6', N'Patparganj ICD,DELHI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (762, N'INPPJ1', N'Pellet Plant Jetty a')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (763, N'INPRD6', N'PREPL SEZ PERUNGUDI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (764, N'INPRG1', N'Purangad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (765, N'INPRK6', N'ICD POWARKHEDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (766, N'INPRT1', N'Paradeep')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (767, N'INPSH1', N'Palshet')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (768, N'INPSI6', N'SIPL/SEZ/PUNE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (769, N'INPSN6', N'PERFECT SEZ NOIDA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (770, N'INPSP6', N'NSPL SEZ HINJEWADI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (771, N'INPTL6', N'Patli ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (772, N'INPTN1', N'Portonovo')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (773, N'INPTPB', N'Petrapole LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (774, N'INPUA6', N'AIGP SEZ WAGHOLI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (775, N'INPUE6', N'EON KHARADI SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (776, N'INPUI6', N'KIPPLGDPLSEZ KHARADI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (777, N'INPUL1', N'Pulicat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (778, N'INPUM6', N'MIDC PUNE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (779, N'INPUN6', N'M/S KBTV PVT., PUNE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (780, N'INPUR1', N'Puri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (781, N'INPUT4', N'Puttaparthi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (782, N'INPVL6', N'Panvel ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (783, N'INPVS6', N'SNPIP SEZ TAMBARAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (784, N'INPWL6', N'PALWAL ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (785, N'INPYB4', N'Jeypore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (786, N'INPYS6', N'SIPCOT SEZ ERODE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (787, N'INQRP6', N'ADANI ICD KILARAIPUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (788, N'INQUI1', N'Quilon')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (789, N'INRAI6', N'Raipur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (790, N'INRAJ4', N'Rajkot')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (791, N'INRAJ6', N'Rajkot')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (792, N'INRAM1', N'Rameshwaram')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (793, N'INRDP2', N'Radhikapur Railway S')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (794, N'INREA6', N'Rewari')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (795, N'INRED1', N'Redi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (796, N'INREW4', N'Rewa')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (797, N'INRGBB', N'Old Raghna Bazar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (798, N'INRGH4', N'Balurghat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (799, N'INRGJ2', N'RAIGANJ LCS RLY')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (800, N'INRGT1', N'Ranghat Bay')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (801, N'INRGUB', N'Ryngku')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (802, N'INRJA4', N'Rajahmundry')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (803, N'INRJI4', N'Rajouri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (804, N'INRJN6', N'LS PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (805, N'INRJP1', N'Rajpara')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (806, N'INRJR1', N'Rajpuri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (807, N'INRKG1', N'Rajakkamangalam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (808, N'INRMD4', N'Ramagundam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (809, N'INRML6', N'CONCOR ICDNAYARAIPUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (810, N'INRNC5', N'RANCHI FPO')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (811, N'INRNG2', N'Ranaghat Railway Sta')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (812, N'INRNR1', N'Ranpar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (813, N'INRPL6', N'Raddipalam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (814, N'INRPR4', N'Raipur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (815, N'INRPR6', N'Raipur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (816, N'INRPU5', N'RAIPUR FPO')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (817, N'INRRI1', N'Raili')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (818, N'INRRK4', N'Rourkela')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (819, N'INRTC1', N'Ratnagiri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (820, N'INRTC4', N'Ratnagiri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (821, N'INRTM6', N'CONCOR ICD RATLAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (822, N'INRUP4', N'Rupsi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (823, N'INRVD1', N'Revdanda')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (824, N'INRWR1', N'Rameshwaram')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (825, N'INRXLB', N'Raxaul')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (826, N'INSABB', N'Sabroom')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (827, N'INSAC6', N'Sachin (Surat)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (828, N'INSAJ6', N'NAVKAR ICD UMBERGAON')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (829, N'INSAL1', N'Salaya')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (830, N'INSAS6', N'INFOSYS SEZ MOHALI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (831, N'INSAU6', N'THAR DRY PORT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (832, N'INSBC6', N'BIOCON SEZ BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (833, N'INSBH1', N'Sinbhour')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (834, N'INSBI6', N'ICD Sabarmati')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (835, N'INSBK6', N'KIADB/SEZ/BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (836, N'INSBL6', N'INFOSYS/SEZ/BANGLORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (837, N'INSBW6', N'WIPRO ELEC/SEZ/BLR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (838, N'INSBZ1', N'SHELLA BAZAR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (839, N'INSCH6', N'SAP-SEZ SURAT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (840, N'INSGF6', N'GRFL ICD SAHNEWAL')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (841, N'INSHI1', N'Shirola')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (842, N'INSHL4', N'Shillong')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (843, N'INSHP1', N'Sinbhour Port')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (844, N'INSIK1', N'Sikka')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (845, N'INSJR6', N'Surajpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (846, N'INSKD6', N'ICD KALINGANAGAR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (847, N'INSKPB', N'Sukhia Pokhari')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (848, N'INSLL6', N'Singanallur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (849, N'INSLR2', N'Silcher R.M.S. Offic')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (850, N'INSLRB', N'Silcher Steamerghat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (851, N'INSLT6', N'SALT LAKE (EPZ/SEZ)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (852, N'INSLV4', N'Simla')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (853, N'INSMK6', N'KEONICS/SEZ/SHIMOGA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (854, N'INSMPB', N'Srimantapur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (855, N'INSMR1', N'Simor')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (856, N'INSNA6', N'ANSAL SEZ SONEPAT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (857, N'INSNBB', N'Sonabarsa')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (858, N'INSNF6', N'ICD, Hyderabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (859, N'INSNG2', N'Singabad Railway Sta')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (860, N'INSNI6', N'KANECH, ICD SAHNEWAL')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (861, N'INSNLB', N'Sonauli')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (862, N'INSNN6', N'APIIC LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (863, N'INSNR6', N'ARI LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (864, N'INSNS6', N'NLE PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (865, N'INSPC6', N'CCLPIL SEZ VIZAG')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (866, N'INSPE6', N'ASDI SEZ NELLORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (867, N'INSRE6', N'Saharanpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (868, N'INSRK6', N'KSITILA/SEZ/PALI/ALZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (869, N'INSRV1', N'Surasani-Yanam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (870, N'INSSE4', N'Sholapur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (871, N'INSTFB', N'SIKTA LCS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (872, N'INSTIB', N'Sitai')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (873, N'INSTM6', N'MIDC PHALTAN SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (874, N'INSTP1', N'Satpati')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (875, N'INSTRB', N'Sutarkandi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (876, N'INSTT6', N'Dadri STTPL CFS')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (877, N'INSTU6', N'MIDC SEZ SATARA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (878, N'INSTV1', N'Surat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (879, N'INSTV4', N'Surat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (880, N'INSTV6', N'Surat(EPZ/SEZ)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (881, N'INSWD1', N'Shriwardhan')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (882, N'INSXE6', N'ELCOT AMMAPALAYAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (883, N'INSXR4', N'Srinagar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (884, N'INSXR5', N'FPO SRINAGAR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (885, N'INSXV4', N'Salem')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (886, N'INSXV6', N'Salem')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (887, N'INTAD1', N'Tadri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (888, N'INTAS6', N'SRICITYPVTLTD-SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (889, N'INTBC6', N'CTS PVT. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (890, N'INTBM6', N'PHPL SEZ KANCHEPURAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (891, N'INTBP6', N'SPIPL SEZ, PERUGULTH')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (892, N'INTBS6', N'HEXAWARE TECH. LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (893, N'INTBT6', N'TCS LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (894, N'INTCR6', N'M/S TICS, ICD MATHIL')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (895, N'INTDE6', N'Tudiyalur-Coimbatore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (896, N'INTEI4', N'Tezu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (897, N'INTEL1', N'Tellicherry')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (898, N'INTEN6', N'SIPCOT GANGAKONDAN')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (899, N'INTEZ4', N'Tezpur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (900, N'INTGN6', N'KEIPL/ PUNE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (901, N'INTHA6', N'Thar Dry Port Jodhpu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (902, N'INTHL1', N'Thal')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (903, N'INTHO6', N'Tiruppur-Thottiplaya')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (904, N'INTIR4', N'Tirupati')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (905, N'INTIV1', N'Tiviri')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (906, N'INTJA1', N'Talaja')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (907, N'INTJPB', N'Tezpur Steamerghat')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (908, N'INTJV4', N'Thanjavur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (909, N'INTKD2', N'Tuglakabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (910, N'INTKD6', N'Tuglakabad')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (911, N'INTKNB', N'Tikonia')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (912, N'INTLG6', N'Pune-Talegoan ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (913, N'INTLT6', N'L&T SBL L&T CHENNAI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (914, N'INTMI6', N'M/S IFFCO KISAN, SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (915, N'INTMP1', N'Trombay')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (916, N'INTMX6', N'ICD, THIMMAPUR,')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (917, N'INTNA1', N'Thana')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (918, N'INTNC6', N'CCCL SEZ TUTICORIN')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (919, N'INTND1', N'Tondi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (920, N'INTNGB', N'Tungi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (921, N'INTNI6', N'HIPL SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (922, N'INTNK1', N'Tankari')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (923, N'INTNS6', N'SSL SEZ TUTICORIN')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (924, N'INTPH1', N'Thopputhurai')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (925, N'INTPJ6', N'ECTN SEZ TRICHY')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (926, N'INTPN1', N'Talpona')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (927, N'INTRA1', N'Tranquebar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (928, N'INTRL6', N'ICD Tiruvallur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (929, N'INTRP1', N'Tarapur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (930, N'INTRV4', N'Thiruvananthapuram (')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (931, N'INTRZ4', N'Tiruchirapalli')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (932, N'INTSI6', N'HVCPL SEZ KADAYAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (933, N'INTTP6', N'Dadri TTPL')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (934, N'INTTS1', N'T.T. SHED (KIDDERPOR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (935, N'INTUI6', N'FCPL SEZ KESAVARAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (936, N'INTUN1', N'Tuna')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (937, N'INTUP6', N'Tirupur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (938, N'INTUT1', N'Tuticorin')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (939, N'INTUT6', N'Tuticorin ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (940, N'INTVC6', N'KINFRAA SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (941, N'INTVT6', N'ICD TONDIARPET CHENN')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (942, N'INTYR1', N'Tirukkadayyur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (943, N'INUDI6', N'SYNEFRA-SEZ/UDUPI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (944, N'INUDN6', N'GHB-SEZ SURAT')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (945, N'INUDR4', N'Udaipur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (946, N'INUDR6', N'Udaipur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (947, N'INUDZ6', N'Udaipur')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (948, N'INUKL6', N'ETLISL SEZ ERODE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (949, N'INULPB', N'Ultapani')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (950, N'INULW1', N'Ulwa')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (951, N'INUMB1', N'Umbergoan')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (952, N'INUMR1', N'Umarsadi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (953, N'INURF6', N'FAB CITY SPV-SEZ/SRI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (954, N'INURG6', N'GMR HYDTABAD AVIATIO')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (955, N'INURI6', N'INDU TECHZONE PVT.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (956, N'INURT6', N'TCS LTD. ADIBATLA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (957, N'INUTN1', N'Uttan')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (958, N'INVAD1', N'Vadinar')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (959, N'INVAL6', N'Valvada ICD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (960, N'INVAP1', N'Vapi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (961, N'INVEN1', N'Vengurla')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (962, N'INVEP1', N'Veppalodai')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (963, N'INVGA4', N'Vijayawada')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (964, N'INVGA5', N'FPO VIJAYAWADA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (965, N'INVGR6', N'BHOJVA ICD VIRAMGAM')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (966, N'INVKH6', N'HIRANANDANI BUIL.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (967, N'INVKM1', N'Valinokkam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (968, N'INVLD6', N'DISH/SEZ/KALYANGADH')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (969, N'INVLN6', N'NG REALTY-SEZ/TALUKA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (970, N'INVLR6', N'SIPCOT LTD.')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (971, N'INVNG1', N'Vengurla')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (972, N'INVNS4', N'Varanasi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (973, N'INVNS5', N'FPO VARANASI')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (974, N'INVNS6', N'Varanasi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (975, N'INVPI6', N'Vapi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (976, N'INVRD1', N'Varavda')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (977, N'INVRU1', N'Vadarevu')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (978, N'INVSA6', N'APIIC (HALL NO.3)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (979, N'INVSI1', N'Vansi-Borsi')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (980, N'INVSK6', N'APIIC- (HALL NO. 2)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (981, N'INVSP6', N'WIPRO SEZRESPUVANIPA')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (982, N'INVSV1', N'Varsova')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (983, N'INVTC6', N'CHEYYAR VELLORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (984, N'INVTZ1', N'Visakhapatnam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (985, N'INVTZ4', N'Visakhapatnam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (986, N'INVTZ6', N'Visakhapatnam SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (987, N'INVVA1', N'Veraval')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (988, N'INVYD1', N'Vijaydurg')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (989, N'INVZJ1', N'Vazhinjam')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (990, N'INVZM6', N'DLL SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (991, N'INVZR6', N'M/S DR. REDDY SEZ')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (992, N'INWAL6', N'Waluj (Aurangabad)')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (993, N'INWFD6', N'ICD Bangalore')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (994, N'INWFI6', N'INFO/SEZ/BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (995, N'INWFT6', N'ITPL SEZ II BENGALUR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (996, N'INWGC4', N'Warrangal')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (997, N'INWRR6', N'WARDHA POWER CO LTD')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (998, N'INYMA6', N'MODERN ASSET SEZ II')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (999, N'INYNA6', N'MOSERN ASSET SEZ I')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (1000, N'INYNK6', N'KIP/SEZ/N BANGALORE')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (1001, N'INYNL6', N'L&T CEL SEZ II')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (1002, N'INYNM6', N'MILESTONE/SEZ/BLR')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (1003, N'INYNT6', N'L&T CEL SEZ I')
GO
INSERT [dbo].[PortMaster] ([PortID], [PortCode], [PortName]) VALUES (1004, N'INZIP6', N'ZIPL-SEZ AHMEDABAD')
GO


CREATE TABLE [dbo].[ItemMaster](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemNo] [nvarchar](20) NOT NULL,
	[ItemDescription] [nvarchar](200) NOT NULL,
	[GoodsService] [nvarchar](20) NOT NULL,
	[UOM] [nvarchar](20) NOT NULL,
	[GSTRate] [nvarchar](10) NOT NULL,
	[HTSCode] [nvarchar](20) NOT NULL,
	[HsnCode] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO