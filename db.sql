USE [EcommerceShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/28/2024 4:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](255) NOT NULL,
	[passWord] [nvarchar](255) NOT NULL,
	[isAdmin] [int] NOT NULL,
	[email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/28/2024 4:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cID] [int] IDENTITY(1,1) NOT NULL,
	[cName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/28/2024 4:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NOT NULL,
	[accountID] [int] NOT NULL,
	[addressReceive] [nvarchar](max) NULL,
	[sdt] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[totalPrice] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/28/2024 4:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/28/2024 4:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pID] [int] IDENTITY(1,1) NOT NULL,
	[pName] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cID] [int] NULL,
	[pAmount] [int] NULL,
	[isDeleted] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[pID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [userName], [passWord], [isAdmin], [email]) VALUES (11, N'admin', N'123', 1, N'admin@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [isAdmin], [email]) VALUES (12, N'user', N'123', 0, N'user@gmail.com')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cID], [cName]) VALUES (1, N'Giày Nike')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (8, N'Giày Adidas')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (9, N'Giày Jordan')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (10, N'Giày Vans')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (11, N'Giày Converse')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (1, N'Jordan 1 Retro High Dark Mocha', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/89b0414dbb05499782be24efffcf29c3_9366/Adifom_Climacool_Shoes_Green_IF3937_01_standard.jpg', 320.0000, N'', N'', 9, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (2, N'Jordan 5 Retro Alternate Bel-Air', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7c05f80341d640ba9c0594c7479455db_9366/D.O.N._Issue_5_Shoes_White_IE7799_01_standard.jpg', 630.0000, N'', N'', 9, 19, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (3, N'Jordan 4 Retro SE 95 Neon', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b65606c1962f4d88a2f06f14de9c5b35_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_01_standard.jpg', 455.0000, N'', N'', 9, 13, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (25, N'Adidas Yeezy Boost 350 V2 Black Red', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/910be30b9d004bdaaee80d58bcf24d8d_9366/Campus_00s_Shoes_Brown_ID2077_01_standard.jpg', 200.0000, N'', N'', 8, 14, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (44, N'Vans Sk8-Hi Re-Issue Flags', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b9a626b41f7c41efa29d3ebc98b113e7_9366/S2G_Spikeless_24_Wide_Golf_Shoes_White_IF0277_01_standard.jpg', 60.0000, N'', N'', 10, 8, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (45, N'Vans Authentic Comme des Garcons White', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/99ac2fdea36e4714bdbaaf4200bcc5ff_9366/Island_Club_Adilette_22_Slides_Brown_HQ4670_01_standard.jpg', 220.0000, N'', N'', 10, 8, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (46, N'Vans Style 36 C2H4 50/50 Enlighten Trailblazer', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b00a682997bd40d3bdfaaed70181d5b6_9366/VULC_RAID3R_Lifestyle_Skateboarding_Slip-On_Canvas_Shoes_Black_HP6554_01_standard.jpg', 360.0000, N'', N'', 10, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (57, N'Converse Ox Archival Flame Print', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bfff95f0750341bf939daed70141260e_9366/NMD_V3_Shoes_White_GX9468_01_standard.jpg', 66.0000, N'', N'', 11, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (58, N'Converse Thunderbolt Ox Vince Staples', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/236d087cb25740908bf5c6deb683a3ba_9366/Predator_League_Firm_Ground_Football_Boots_Black_IG7763_22_model.jpg', 68.0000, N'', N'', 11, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (59, N'Converse Hi Miley Cyrus White Black Stars (W)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fb1edca9a23e4c99b63f92dabffd1ad2_9366/Harden_Volume_8_Shoes_Orange_IE2694_01_standard.jpg', 45.0000, N'', N'', 11, 7, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (62, N'Nike Air Force 1 Low White ''07', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3bbecbdf584e40398446a8bf0117cf62_9366/Samba_OG_Shoes_White_B75806_01_standard.jpg', 2700.0000, N'', N'', 1, 9, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (63, N'Nike Air Max 97 Triple White Wolf Grey', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/73a000b08a1d4cbca81b6a1a434f9bee_9366/AE_1_Best_Of_Adi_Basketball_Shoes_White_IF1857_01_standard.jpg', 2500.0000, N'', N'', 1, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (64, N'Nike Air Force 1 Low Off-White', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b810b829e9b742378b88c42047781ef4_9366/Stan_Smith_CS_Shoes_White_IG1296_01_standard.jpg', 1990.0000, N'', N'', 1, 0, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (67, N'Adidas XPLR White Black', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/cb99a0d8acf548e583b32671ff2f3003_9366/Gazelle_Indoor_Shoes_White_IG1896_01_standard.jpg', 2830.0000, N'', N'', 8, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (68, N'Adidas Prophere Triple White (W)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/15efd399b216463e9392af5700c52792_9366/Adifom_Superstar_Shoes_White_HQ8750_01_standard.jpg', 1540.0000, N'sdf', N'ds', 8, 7, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([pID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cID])
REFERENCES [dbo].[Category] ([cID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
