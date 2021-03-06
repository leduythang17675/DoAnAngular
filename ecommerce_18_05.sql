USE [master]
GO
/****** Object:  Database [Ecommerce]    Script Date: 5/18/2022 9:02:37 AM ******/
CREATE DATABASE [Ecommerce] ON  PRIMARY 
( NAME = N'MyWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Ecommerce.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Ecommerce_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ecommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ecommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ecommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [Ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ecommerce] SET DB_CHAINING OFF 
GO
USE [Ecommerce]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Alias] [varchar](255) NULL,
	[Image] [varchar](max) NULL,
	[Index] [int] NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Code] [varchar](32) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [varchar](124) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Avatar] [varchar](max) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Dob] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[LastLogin] [datetime] NULL,
	[OTP] [varchar](32) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailConfiguration]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailConfiguration](
	[Id] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_EmailConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailRegistration]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_EmailRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailSignUp]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailSignUp](
	[Email] [nvarchar](50) NOT NULL,
	[OTP] [varchar](10) NOT NULL,
 CONSTRAINT [PK_EmailSignUp] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailTemplate]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Subject] [nvarchar](500) NULL,
	[CC] [nvarchar](255) NULL,
	[BCC] [nvarchar](255) NULL,
	[KeyGuide] [nvarchar](500) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gallery](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentMenu] [int] NULL,
	[Group] [varchar](10) NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Alias] [varchar](255) NOT NULL,
	[Index] [int] NULL,
	[ShowHomePage] [bit] NULL,
	[Type] [varchar](50) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerCode] [varchar](32) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[TotalAmount] [float] NULL,
	[Status] [int] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductImage] [varchar](max) NULL,
	[ProductPrice] [float] NULL,
	[ProductDiscountPrice] [float] NULL,
	[Qty] [int] NULL,
	[Attribute] [nvarchar](500) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Alias] [varchar](255) NOT NULL,
	[Image] [varchar](max) NULL,
	[Index] [int] NULL,
	[Status] [int] NULL,
	[Price] [float] NULL,
	[DiscountPrice] [float] NULL,
	[Selling] [bit] NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AttributeId] [int] NOT NULL,
	[Value] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Image] [varchar](max) NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductRelated]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRelated](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductRelatedId] [int] NOT NULL,
 CONSTRAINT [PK_ProductRelated] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Review]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Star] [int] NULL,
	[Content] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [varchar](32) NOT NULL,
	[Password] [varchar](124) NULL,
	[FullName] [nvarchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Website]    Script Date: 5/18/2022 9:02:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Website](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Logo] [varchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Location] [varchar](max) NULL,
	[Facebook] [nvarchar](255) NULL,
	[Youtube] [nvarchar](255) NULL,
	[Copyright] [nvarchar](255) NULL,
 CONSTRAINT [PK_Website] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([Id], [MenuId], [Title], [Alias], [Image], [Index], [ShortDescription], [Description], [Active], [Created]) VALUES (19, 12, N'Về chúng tôi', N've-chung-toi-19', NULL, 1, N'<div><h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong>&#160;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br><div><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &#34;de Finibus Bonorum et Malorum&#34; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &#34;Lorem ipsum dolor sit amet..&#34;, comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &#34;de Finibus Bonorum et Malorum&#34; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div>', NULL, 1, CAST(N'2021-08-17 19:41:36.723' AS DateTime))
INSERT [dbo].[Article] ([Id], [MenuId], [Title], [Alias], [Image], [Index], [ShortDescription], [Description], [Active], [Created]) VALUES (20, 13, N'Chính sách bảo hành', N'chinh-sach-bao-hanh-20', NULL, 1, N'<div><h2>What is Lorem Ipsum?</h2><p><span>Lorem Ipsum</span>&#160;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br><div><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &#34;de Finibus Bonorum et Malorum&#34; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &#34;Lorem ipsum dolor sit amet..&#34;, comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &#34;de Finibus Bonorum et Malorum&#34; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div>', NULL, 1, CAST(N'2021-08-17 19:42:18.283' AS DateTime))
INSERT [dbo].[Article] ([Id], [MenuId], [Title], [Alias], [Image], [Index], [ShortDescription], [Description], [Active], [Created]) VALUES (21, 14, N'Chính sách bảo mật', N'chinh-sach-bao-mat-21', NULL, 1, N'<div><h2>What is Lorem Ipsum?</h2><p><span>Lorem Ipsum</span>&#160;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br><div><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &#34;de Finibus Bonorum et Malorum&#34; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &#34;Lorem ipsum dolor sit amet..&#34;, comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &#34;de Finibus Bonorum et Malorum&#34; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div>', NULL, 1, CAST(N'2021-08-17 19:42:27.037' AS DateTime))
INSERT [dbo].[Article] ([Id], [MenuId], [Title], [Alias], [Image], [Index], [ShortDescription], [Description], [Active], [Created]) VALUES (22, 15, N'Hướng dẫn thanh toán', N'huong-dan-thanh-toan-22', NULL, 1, N'<div><h2>What is Lorem Ipsum?</h2><p><span>Lorem Ipsum</span>&#160;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br><div><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &#34;de Finibus Bonorum et Malorum&#34; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &#34;Lorem ipsum dolor sit amet..&#34;, comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &#34;de Finibus Bonorum et Malorum&#34; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div>', NULL, 1, CAST(N'2021-08-17 19:42:37.590' AS DateTime))
INSERT [dbo].[Article] ([Id], [MenuId], [Title], [Alias], [Image], [Index], [ShortDescription], [Description], [Active], [Created]) VALUES (23, 16, N'Hướng dẫn mua hàng', N'huong-dan-mua-hang-23', NULL, 1, N'<div><h2>What is Lorem Ipsum?</h2><p><span>Lorem Ipsum</span>&#160;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br><div><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &#34;de Finibus Bonorum et Malorum&#34; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &#34;Lorem ipsum dolor sit amet..&#34;, comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &#34;de Finibus Bonorum et Malorum&#34; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div>', NULL, 1, CAST(N'2021-08-17 19:42:46.677' AS DateTime))
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[Attribute] ON 

INSERT [dbo].[Attribute] ([Id], [Name]) VALUES (9, N'Màu sắc')
INSERT [dbo].[Attribute] ([Id], [Name]) VALUES (10, N'Loại')
INSERT [dbo].[Attribute] ([Id], [Name]) VALUES (11, N'Cấu hình')
SET IDENTITY_INSERT [dbo].[Attribute] OFF
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'24a1860eb3564607851152e639a7b052', N'tai98796543@gmail.com', N'38c26ca673d5209629f876e317a0f83e920f81ca28a99065d6ca4dda32485f3c', N'Tài Nguyễn', NULL, N'0987654321', NULL, NULL, NULL, CAST(N'2022-05-15 21:07:09.487' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'39f6a03a8b1545f98c64a1e2dfcaeab1', N'hoquanganh.work@gmail.com', N'808d20fcd7e0e3fb551cebe689ad3fb9f638b285ae9a1e847825e481410b86c3', N'Trương Quỳnh Ngọc', NULL, N'0928.266.288', NULL, NULL, NULL, CAST(N'2021-08-19 23:31:06.357' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'92f7419fba0d48feab5eb0b453d0bfa9', N'hoanganh.nguyet@gmail.com', N'3a2bad04f8fe9e2c97573688cd2ac5e40f26865c0cf8016b90a87f8972759236', N'Hoàng Ánh Nguyệt', NULL, N'0359789950', N'374c  Đường Mỹ Đình', CAST(N'2021-08-18' AS Date), N'Nữ', CAST(N'2021-08-18 10:44:14.323' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'a0f8f150ef2c4710b9293e5dfdb08552', N'ngocanh.29@gmail.com', N'b45171a3344a371a6c98e61ce1f92056ccfab6816125f277831a114829f14a66', N'Lương Ngọc Anh', NULL, N'0963.258.665', N'Dịch Vọng, Cầu Giấy, Hà Nội, Việt Nam', CAST(N'1992-12-21' AS Date), N'Nam', CAST(N'2021-08-17 20:17:20.710' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'a0f8f150ef2c4710b9293e5ffdb08552', N'quyloc.ho@gmail.com', N'bc36d3ec911ccaba2055f9026260f65092b5c6c3ec2dd23cd9b6ecb71d2cb160', N'Hồ Quý Lộc', NULL, N'0336.124.443', N'Ngọc Lâm, Long Biên, Hà Nội, Việt Nam', CAST(N'2000-11-02' AS Date), N'Nam', CAST(N'2021-08-19 23:23:05.407' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'a0f8f150ef2c4710b969325dfdb08552', N'trunganh.phan.work@gmail.com', N'd0ece465e471aab4e82d135d2149267c6fb64e5bf80a9d14b6fd6fc2bd8345df', N'Phan Trung Anh', NULL, N'0933.123.456', N'Số 34, ngõ 58, ngách 3 Trần Bình, Mai Dịch, Cầu Giấy, Hà Nội 100000, Việt Nam', CAST(N'1990-02-12' AS Date), N'Nam', CAST(N'2021-08-17 20:17:20.710' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'a0f8f150ef2c4710b9693c5dfdb08552', N'tienloc.nguyen@gmail.com', N'2dff4fb36ab5bcd8d6a39d4248f1fd85b690fedacca06bdb9c50e187b60e9e1d', N'Nguyễn Tiến Lộc', NULL, N'0368.122.336', N'Ngọc Hồi, Thanh Trì, Hà Nội, Việt Nam', CAST(N'1992-11-15' AS Date), N'Nam', CAST(N'2021-08-18 10:28:38.750' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'a0f8f150ef2c4710b9693e5dfdb02552', N'quanganh.nguyen@gmail.com', N'684b4c2c24d2f90891b5be223582e9c7f6c866e95a7dfb462682f014625c43de', N'Nguyễn Quang Anh', NULL, N'0983.126.824', N'Vinhomes Skylake Phạm Hùng, Phạm Hùng, Mỹ Đình 1, Nam Từ Liêm, Hà Nội', CAST(N'1984-12-12' AS Date), N'Nam', CAST(N'2021-08-18 10:29:18.060' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'a0f8f150ef2c4710b9693e5dfdb08552', N'mailtest.work@gmail.com', N'0f0d020532224ed5469ba72d9ad0118994cf8cf369b3fec8aeeb36e139524442', N'Ngô Xuân Dương', NULL, N'0926.888.888', N'Km5+200, Đ. Lê Trọng Tấn, An Khánh, Hoài Đức, Hà Nội, Việt Nam', CAST(N'1990-08-06' AS Date), N'Nam', CAST(N'2021-08-18 10:25:04.330' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'a0f8f150ef2c4710b9693eddb08552', N'quynhanh.truong2990@gmail.com', N'ce6801ba7b9bf91c46f3803194360a9f24c6fcd86df090c4788b78b521a1fe49', N'Trương Quỳnh Anh', NULL, N'0942.246.809', N'Số 1 Phố Xốm, Phú Lâm, Hà Đông, Hà Nội, Việt Nam', CAST(N'2001-01-09' AS Date), N'Nam', CAST(N'2021-08-18 10:28:55.567' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'a0f8f150ef2c4710b9693r5dfdb08552', N'cuong.phandz@gmail.com', N'bee218225b7c6246e774a764463e7dead2cc42b0886c2eb1e68a17cc5146bf1f', N'Phan Mạnh Cường', NULL, N'0359.345.554', N'ĐT199, Đông Tảo, Khoái Châu, Hưng Yên, Việt Nam', CAST(N'1999-12-28' AS Date), N'Nam', CAST(N'2021-08-18 10:28:22.897' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'a0f8f150ef2c4710b96c3e5dfdb08552', N'baoanh1990@gmail.com', N'5298801ba856d4704814b1a7c4ca143cf4b9a45295be16bb85752880a375c5eb', N'Bảo Anh', NULL, N'0912.543.666', N'29A Ngõ 124 Phố Vĩnh Tuy, Thanh Long, Hai Bà Trưng, Hà Nội, Việt Nam', CAST(N'1998-02-15' AS Date), N'Nam', CAST(N'2021-08-18 10:26:34.050' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'ad1b0767f77741ceb3fac1313105dfb8', N'mailtest@gmail.com', N'808d20fcd7e0e3fb551cebe689ad3fb9f638b285ae9a1e847825e481410b86c3', N'Ngô Hoàng Linh', NULL, N'0926.236.888', N'Hà Nội', CAST(N'2000-08-15' AS Date), N'Nữ', CAST(N'2021-08-19 23:39:44.593' AS DateTime), NULL)
INSERT [dbo].[Customer] ([Code], [Email], [Password], [FullName], [Avatar], [PhoneNumber], [Address], [Dob], [Gender], [LastLogin], [OTP]) VALUES (N'b1c1e417886c45dfa18ee322b4367f7e', N'huy98796543@gmail.com', N'ad432ed4f6de81cc87731303c358a6aebd146c7ec3a366bdb91638972d54b720', N'Huy', NULL, N'0998777666', NULL, NULL, NULL, CAST(N'2022-04-10 10:02:00.527' AS DateTime), NULL)
INSERT [dbo].[EmailConfiguration] ([Id], [Email], [Password]) VALUES (1, N'huy98796543@gmail.com', N'Nguyenhuy6^')
SET IDENTITY_INSERT [dbo].[EmailRegistration] ON 

INSERT [dbo].[EmailRegistration] ([Id], [Email], [Created]) VALUES (1, N'honghanh29@gmail.com', CAST(N'2021-08-17 17:16:55.920' AS DateTime))
INSERT [dbo].[EmailRegistration] ([Id], [Email], [Created]) VALUES (2, N'truongquynhanh@gmail.com', CAST(N'2021-08-17 17:17:05.197' AS DateTime))
INSERT [dbo].[EmailRegistration] ([Id], [Email], [Created]) VALUES (3, N'nguyenbao.work@gmail.com', CAST(N'2021-08-18 11:06:29.937' AS DateTime))
INSERT [dbo].[EmailRegistration] ([Id], [Email], [Created]) VALUES (4, N'mailtest@gmail.com', CAST(N'2021-08-19 23:34:17.763' AS DateTime))
SET IDENTITY_INSERT [dbo].[EmailRegistration] OFF
INSERT [dbo].[EmailSignUp] ([Email], [OTP]) VALUES (N'huy98796543@gmai.com', N'476123')
INSERT [dbo].[EmailSignUp] ([Email], [OTP]) VALUES (N'huy98796543@gmail.com', N'225548')
INSERT [dbo].[EmailSignUp] ([Email], [OTP]) VALUES (N'mailtest@gmail.com', N'909322')
INSERT [dbo].[EmailSignUp] ([Email], [OTP]) VALUES (N'tai98796543@gmail.com', N'600563')
SET IDENTITY_INSERT [dbo].[EmailTemplate] ON 

INSERT [dbo].[EmailTemplate] ([Id], [Type], [Subject], [CC], [BCC], [KeyGuide], [Content]) VALUES (3, N'Mail gửi KH:  Đặt hàng thành công', N'Đặt hàng thành công', N'', NULL, N'<b>@OrderCode</b>: Mã đơn hàng &emsp;&emsp;
<b>@OrderDate</b>: Ngày đặt hàng &emsp;&emsp;
<b>@Customer</b>: Tên khách hàng &emsp;&emsp; <br>
<b>@Address</b>: Địa chỉ nhận hàng &emsp;&emsp;
<b>@OrderDetail</b>: Chi tiết đơn hàng', N'&#10;&#10;&#10;&#10;&#10;<h2><img src="data:image/png;base64,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"><font color="#09d105"><br></font></h2><h2><font color="#09d105">&#272;&#7863;t h&#224;ng th&#224;nh c&#244;ng</font></h2><h4>C&#7843;m &#417;n qu&#253; kh&#225;ch h&#224;ng &#273;&#227; &#273;&#7863;t h&#224;ng tr&#234;n h&#7879; th&#7889;ng DEcommerce.</h4><div><div>Th&#244;ng tin &#273;&#417;n h&#224;ng:</div></div><div><ul><li>M&#227; &#273;&#417;n h&#224;ng:  <b>@OrderCode</b></li><li>Ng&#224;y &#273;&#7863;t h&#224;ng: <b>@OrderDate</b></li><li>T&#234;n kh&#225;ch h&#224;ng: <b>@Customer</b></li><li>&#272;&#7883;a ch&#7881; nh&#7853;n h&#224;ng: <b>@Address</b></li><li>Chi ti&#7871;t &#273;&#417;n h&#224;ng:</li></ul><div>@OrderDetail<br></div></div><div><br></div><div>M&#7885;i th&#7855;c m&#7855;c vui l&#242;ng li&#234;n h&#7879; v&#7899;i <b>DEcommerce: </b>decommerce@gmail.com - 0968.268.888</div>&#10;')
INSERT [dbo].[EmailTemplate] ([Id], [Type], [Subject], [CC], [BCC], [KeyGuide], [Content]) VALUES (4, N'Mail gửi Admin:  Thông báo có đơn hàng mới', N'Thông báo có đơn hàng mới', N'ad.website.dnx@gmail.com', NULL, N'<b>@OrderCode</b>: Mã đơn hàng &emsp;&emsp;
<b>@OrderDate</b>: Ngày đặt hàng &emsp;&emsp;
<b>@Customer</b>: Tên khách hàng &emsp;&emsp; <br>
<b>@Address</b>: Địa chỉ nhận hàng &emsp;&emsp;
<b>@OrderDetail</b>: Chi tiết đơn hàng', N'<h2><img src="data:image/png;base64,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"><font color="#09d105"><br></font></h2><h2><font color="#09d105">Th&#244;ng b&#225;o c&#243; &#273;&#417;n &#273;&#7863;t h&#224;ng m&#7899;i</font></h2><div><div><span>Th&#244;ng tin &#273;&#417;n h&#224;ng:</span><br></div></div><div><ul><li>M&#227; &#273;&#417;n h&#224;ng:  <b>@OrderCode</b></li><li>Ng&#224;y &#273;&#7863;t h&#224;ng: <b>@OrderDate</b></li><li>T&#234;n kh&#225;ch h&#224;ng: <b>@Customer</b></li><li>&#272;&#7883;a ch&#7881; nh&#7853;n h&#224;ng:&#160;<b>@Address</b></li><li>Chi ti&#7871;t &#273;&#417;n h&#224;ng:</li></ul><div>@OrderDetail</div></div>')
INSERT [dbo].[EmailTemplate] ([Id], [Type], [Subject], [CC], [BCC], [KeyGuide], [Content]) VALUES (5, N'Mail gửi KH: Quên mật khẩu', N'Yêu cầu đặt lại mật khẩu', NULL, NULL, N'<b>@NewPassword</b>: Mật khẩu mới;', N'M&#7853;t kh&#7849;u m&#7899;i c&#7911;a b&#7841;n l&#224;: <b>@NewPassword</b>')
INSERT [dbo].[EmailTemplate] ([Id], [Type], [Subject], [CC], [BCC], [KeyGuide], [Content]) VALUES (6, N'Mail gửi KH: Gửi mã OTP đăng ký tài khoản', N'Mã OTP xác thực tài khoản', NULL, NULL, N'<b>@OTP</b>: Mã OTP;', N'M&#227; OTP x&#225;c th&#7921;c t&#224;i kho&#7843;n c&#7911;a b&#7841;n l&#224;:&#160;<span><b>@OTP</b></span>')
SET IDENTITY_INSERT [dbo].[EmailTemplate] OFF
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([Id], [Image], [Type]) VALUES (31, N'5e35ffe5ab434ee3b5e45382853e2971.png', 1)
INSERT [dbo].[Gallery] ([Id], [Image], [Type]) VALUES (32, N'f1cb5f7cb4754c029620f6be3305d7b1.png', 1)
INSERT [dbo].[Gallery] ([Id], [Image], [Type]) VALUES (33, N'529b92d6da9a4dfb83c884a29e0ea68c.png', 1)
INSERT [dbo].[Gallery] ([Id], [Image], [Type]) VALUES (34, N'9100a53175094e5da59746d02cac928b.png', 1)
INSERT [dbo].[Gallery] ([Id], [Image], [Type]) VALUES (35, N'726916eea3fc4e65a93dd6bec845ae86.png', 1)
INSERT [dbo].[Gallery] ([Id], [Image], [Type]) VALUES (36, N'649add2c1b46460eab03a8403a15b76f.png', 1)
INSERT [dbo].[Gallery] ([Id], [Image], [Type]) VALUES (37, N'd7140220af47462db440f629e354002b.png', 1)
INSERT [dbo].[Gallery] ([Id], [Image], [Type]) VALUES (39, N'd05eb5cf5f834063a3239f4feed76ffd.png', 2)
SET IDENTITY_INSERT [dbo].[Gallery] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [ParentMenu], [Group], [Name], [Alias], [Index], [ShowHomePage], [Type], [Active]) VALUES (1, NULL, N'main', N'CÀ PHÊ ĐẶC SẢN', N'ca-phe-dac-san-1', 1000, 1, N'san-pham', 1)
INSERT [dbo].[Menu] ([Id], [ParentMenu], [Group], [Name], [Alias], [Index], [ShowHomePage], [Type], [Active]) VALUES (2, NULL, N'main', N'DỤNG CỤ PHA CHẾ', N'dung-cu-pha-che-2', 2000, 1, N'san-pham', 1)
INSERT [dbo].[Menu] ([Id], [ParentMenu], [Group], [Name], [Alias], [Index], [ShowHomePage], [Type], [Active]) VALUES (4, NULL, N'main', N'QUẦY BAR', N'quay-bar-4', 4000, 1, N'san-pham', 1)
INSERT [dbo].[Menu] ([Id], [ParentMenu], [Group], [Name], [Alias], [Index], [ShowHomePage], [Type], [Active]) VALUES (8, NULL, N'main', N'Tin tức & Sự kiện', N'tin-tuc-su-kien-8-8-8', 7000, 0, N'bai-viet', 0)
INSERT [dbo].[Menu] ([Id], [ParentMenu], [Group], [Name], [Alias], [Index], [ShowHomePage], [Type], [Active]) VALUES (12, NULL, N'sub', N'Về chúng tôi', N've-chung-toi-12', 10, 0, N'chi-tiet-bai-viet', 1)
INSERT [dbo].[Menu] ([Id], [ParentMenu], [Group], [Name], [Alias], [Index], [ShowHomePage], [Type], [Active]) VALUES (13, NULL, N'sub', N'Phương thức vận chuyển', N'phuong-thuc-van-chuyen-13', 20, 0, N'chi-tiet-bai-viet', 1)
INSERT [dbo].[Menu] ([Id], [ParentMenu], [Group], [Name], [Alias], [Index], [ShowHomePage], [Type], [Active]) VALUES (14, NULL, N'sub', N'Chính sách bảo mật', N'chinh-sach-bao-mat-14-14-14', 30, 0, N'chi-tiet-bai-viet', 1)
INSERT [dbo].[Menu] ([Id], [ParentMenu], [Group], [Name], [Alias], [Index], [ShowHomePage], [Type], [Active]) VALUES (15, NULL, N'sub', N'Hướng dẫn thanh toán', N'huong-dan-thanh-toan-15-15', 40, 0, N'chi-tiet-bai-viet', 1)
INSERT [dbo].[Menu] ([Id], [ParentMenu], [Group], [Name], [Alias], [Index], [ShowHomePage], [Type], [Active]) VALUES (16, NULL, N'sub', N'Hướng dẫn mua hàng', N'huong-dan-mua-hang-16-16', 50, 0, N'chi-tiet-bai-viet', 1)
INSERT [dbo].[Menu] ([Id], [ParentMenu], [Group], [Name], [Alias], [Index], [ShowHomePage], [Type], [Active]) VALUES (25, NULL, N'main', N'MÁY NGÀNH CÀ PHÊ', N'may-nganh-ca-phe-25', 2010, 0, N'san-pham', 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200002, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926888888', N'Hà Nội', 115660000, 40, NULL, CAST(N'2021-01-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200003, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926888888', N'Hà Nội', 60680000, 40, NULL, CAST(N'2021-01-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200004, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926888888', N'Hà Nội', 27490000, 40, NULL, CAST(N'2021-01-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200005, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926888888', N'Hà Nội', 76211000, 50, NULL, CAST(N'2021-01-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200006, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926888888', N'Hà Nội', 127960000, 40, NULL, CAST(N'2021-03-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200007, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926888888', N'Hà Nội', 95970000, 40, NULL, CAST(N'2021-02-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200008, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926888888', N'Hà Nội', 54890000, 40, NULL, CAST(N'2021-02-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200009, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926888888', N'Hà Nội', 34940000, 40, NULL, CAST(N'2021-02-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200010, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926888888', N'Hà Nội', 60680000, 40, NULL, CAST(N'2021-02-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200011, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926888888', N'Hà Nội', 81520000, 50, NULL, CAST(N'2021-02-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200012, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926888888', N'Hà Nội', 34940000, 40, NULL, CAST(N'2021-03-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200013, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926.888.888', N'Km5+200, Đ. Lê Trọng Tấn, An Khánh, Hoài Đức, Hà Nội, Việt Nam', 27490000, 40, NULL, CAST(N'2021-03-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200014, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926.888.888', N'Km5+200, Đ. Lê Trọng Tấn, An Khánh, Hoài Đức, Hà Nội, Việt Nam', 76670000, 40, NULL, CAST(N'2021-03-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200015, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926.888.888', N'Km5+200, Đ. Lê Trọng Tấn, An Khánh, Hoài Đức, Hà Nội, Việt Nam', 95620000, 40, NULL, CAST(N'2021-03-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200016, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926.888.888', N'Km5+200, Đ. Lê Trọng Tấn, An Khánh, Hoài Đức, Hà Nội, Việt Nam', 102210000, 30, NULL, CAST(N'2021-04-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200017, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926.888.888', N'Km5+200, Đ. Lê Trọng Tấn, An Khánh, Hoài Đức, Hà Nội, Việt Nam', 46440000, 40, NULL, CAST(N'2021-04-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200018, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926.888.888', N'Km5+200, Đ. Lê Trọng Tấn, An Khánh, Hoài Đức, Hà Nội, Việt Nam', 46440000, 40, NULL, CAST(N'2021-04-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200019, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926.888.888', N'Km5+200, Đ. Lê Trọng Tấn, An Khánh, Hoài Đức, Hà Nội, Việt Nam', 102210000, 40, NULL, CAST(N'2021-04-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200020, N'a0f8f150ef2c4710b9693e5dfdb08552', N'0926.888.888', N'Km5+200, Đ. Lê Trọng Tấn, An Khánh, Hoài Đức, Hà Nội, Việt Nam', 22580000, 40, NULL, CAST(N'2021-04-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200021, N'a0f8f150ef2c4710b96c3e5dfdb08552', N'0912.543.666', N'29A Ngõ 124 Phố Vĩnh Tuy, Thanh Long, Hai Bà Trưng, Hà Nội, Việt Nam', 41530000, 40, NULL, CAST(N'2021-04-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200022, N'a0f8f150ef2c4710b96c3e5dfdb08552', N'0912.543.666', N'29A Ngõ 124 Phố Vĩnh Tuy, Thanh Long, Hai Bà Trưng, Hà Nội, Việt Nam', 63630000, 10, NULL, CAST(N'2021-05-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200023, N'a0f8f150ef2c4710b9693r5dfdb08552', N'0359.345.554', N'ĐT199, Đông Tảo, Khoái Châu, Hưng Yên, Việt Nam', 15990000, 10, NULL, CAST(N'2021-05-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200024, N'a0f8f150ef2c4710b9693c5dfdb08552', N'0368.122.336', N'Ngọc Hồi, Thanh Trì, Hà Nội, Việt Nam', 27490000, 10, NULL, CAST(N'2021-05-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200025, N'a0f8f150ef2c4710b9693eddb08552', N'0942.246.809', N'Số 1 Phố Xốm, Phú Lâm, Hà Đông, Hà Nội, Việt Nam', 27490000, 10, NULL, CAST(N'2021-05-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200026, N'a0f8f150ef2c4710b9693e5dfdb02552', N'0983.126.824', N'Vinhomes Skylake Phạm Hùng, Phạm Hùng, Mỹ Đình 1, Nam Từ Liêm, Hà Nội', 60680000, 40, NULL, CAST(N'2021-06-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200027, N'a0f8f150ef2c4710b9693e5dfdb02552', N'0983.126.824', N'Vinhomes Skylake Phạm Hùng, Phạm Hùng, Mỹ Đình 1, Nam Từ Liêm, Hà Nội', 34940000, 40, NULL, CAST(N'2021-06-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200028, N'a0f8f150ef2c4710b9693e5dfdb02552', N'0983.126.824', N'Vinhomes Skylake Phạm Hùng, Phạm Hùng, Mỹ Đình 1, Nam Từ Liêm, Hà Nội', 18950000, 40, NULL, CAST(N'2021-06-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200029, N'a0f8f150ef2c4710b9693e5dfdb02552', N'0983.126.824', N'Vinhomes Skylake Phạm Hùng, Phạm Hùng, Mỹ Đình 1, Nam Từ Liêm, Hà Nội', 27490000, 10, NULL, CAST(N'2021-06-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200030, N'a0f8f150ef2c4710b9693e5dfdb02552', N'0983.126.824', N'Vinhomes Skylake Phạm Hùng, Phạm Hùng, Mỹ Đình 1, Nam Từ Liêm, Hà Nội', 46440000, 10, NULL, CAST(N'2021-03-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200031, N'a0f8f150ef2c4710b9693e5dfdb02552', N'0983.126.824', N'Vinhomes Skylake Phạm Hùng, Phạm Hùng, Mỹ Đình 1, Nam Từ Liêm, Hà Nội', 15990000, 40, NULL, CAST(N'2021-07-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200032, N'a0f8f150ef2c4710b9693e5dfdb02552', N'0983.126.824', N'Vinhomes Skylake Phạm Hùng, Phạm Hùng, Mỹ Đình 1, Nam Từ Liêm, Hà Nội', 18950000, 40, NULL, CAST(N'2021-07-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200033, N'a0f8f150ef2c4710b9693e5dfdb02552', N'0983.126.824', N'Vinhomes Skylake Phạm Hùng, Phạm Hùng, Mỹ Đình 1, Nam Từ Liêm, Hà Nội', 30440000, 40, NULL, CAST(N'2021-07-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200034, N'a0f8f150ef2c4710b9693e5dfdb02552', N'0983.126.824', N'Vinhomes Skylake Phạm Hùng, Phạm Hùng, Mỹ Đình 1, Nam Từ Liêm, Hà Nội', 39780000, 40, NULL, CAST(N'2021-07-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200035, N'a0f8f150ef2c4710b9693e5dfdb02552', N'0983.126.824', N'Vinhomes Skylake Phạm Hùng, Phạm Hùng, Mỹ Đình 1, Nam Từ Liêm, Hà Nội', 14990000, 40, NULL, CAST(N'2021-07-17 23:04:44.097' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200036, N'92f7419fba0d48feab5eb0b453d0bfa9', N'0359789950', N'374c đường Mỹ Đình', 86420000, 20, NULL, CAST(N'2021-08-18 10:50:22.987' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200037, N'92f7419fba0d48feab5eb0b453d0bfa9', N'0359789950', N'374c  Đường Mỹ Đình', 14990000, 40, NULL, CAST(N'2021-08-18 10:53:17.907' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200038, N'92f7419fba0d48feab5eb0b453d0bfa9', N'0359789950', N'374c  Đường Mỹ Đình', 27490000, 10, NULL, CAST(N'2021-08-18 11:17:37.663' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200039, N'a0f8f150ef2c4710b9293e5ffdb08552', N'0336.124.443', N'Ngọc Lâm, Long Biên, Hà Nội, Việt Nam', 46440000, 20, NULL, CAST(N'2021-08-19 23:23:11.693' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200040, N'a0f8f150ef2c4710b9293e5ffdb08552', N'0336.124.443', N'Ngọc Lâm, Long Biên, Hà Nội, Việt Nam', 79630000, 10, NULL, CAST(N'2021-08-19 23:23:32.187' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200041, N'a0f8f150ef2c4710b9293e5ffdb08552', N'0336.124.443', N'Ngọc Lâm, Long Biên, Hà Nội, Việt Nam', 34940000, 20, NULL, CAST(N'2021-08-19 23:23:45.817' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200042, N'a0f8f150ef2c4710b9293e5ffdb08552', N'0336.124.443', N'Ngọc Lâm, Long Biên, Hà Nội, Việt Nam', 111151000, 40, NULL, CAST(N'2021-08-19 23:24:06.163' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200043, N'a0f8f150ef2c4710b9293e5ffdb08552', N'0336.124.443', N'Ngọc Lâm, Long Biên, Hà Nội, Việt Nam', 27490000, 20, NULL, CAST(N'2021-08-19 23:24:18.873' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200044, N'a0f8f150ef2c4710b9293e5ffdb08552', N'0336.124.443', N'Ngọc Lâm, Long Biên, Hà Nội, Việt Nam', 16990000, 30, NULL, CAST(N'2021-08-19 23:24:51.713' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200045, N'39f6a03a8b1545f98c64a1e2dfcaeab1', N'0928.266.288', N'Hà Nội', 27490000, 20, NULL, CAST(N'2021-08-19 23:31:56.810' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200046, N'ad1b0767f77741ceb3fac1313105dfb8', N'0926.236.888', N'Hà Nội', 178210000, 40, NULL, CAST(N'2021-08-19 23:40:37.587' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200047, N'b1c1e417886c45dfa18ee322b4367f7e', N'0998777666', N'123 bi bi', 31990000, 50, NULL, CAST(N'2022-04-10 10:03:52.347' AS DateTime))
INSERT [dbo].[Order] ([Id], [CustomerCode], [PhoneNumber], [Address], [TotalAmount], [Status], [Note], [Created]) VALUES (200048, N'24a1860eb3564607851152e639a7b052', N'0987654321', N'nhà Tùng quận 7', 34940000, 10, NULL, CAST(N'2022-05-15 21:08:35.637' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (31, 200002, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 3, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (32, 200002, 179, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 1, N'<b>Loại</b>: SSD 512GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (33, 200003, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (34, 200003, 179, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 1, N'<b>Loại</b>: SSD 256GB Silver <br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (35, 200004, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (36, 200005, 237, N'Samsung Galaxy A51 (6GB/128GB)', N'a243be43d38e46dd91d295df68cd3233.png', 7990000, 6590000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (37, 200005, 226, N'iPhone 12 Pro Max', N'77548180bf11455493f38bbd8c8840be.png', 32990000, 31990000, 1, N'<b>Màu sắc</b>: Tím<br><b>Loại</b>: 128GB<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (38, 200005, 227, N'Điện thoại iPhone 12 Pro 128GB', N'f22b91667b784797a0daefcedc54dc40.png', 30990000, 2950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (39, 200005, 231, N'Samsung Galaxy S21 Ultra 5G 128GB', N'aaa36a6b8e0f401eaf9e83ddda6c7437.png', 30990000, 29590000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (40, 200005, 238, N'Apple Watch S3 GPS 38mm viền nhôm dây cao su đen', N'7cf7a27ad3304322a353be9b69f4d693.png', 5990000, 5091000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (41, 200006, 226, N'iPhone 12 Pro Max', N'77548180bf11455493f38bbd8c8840be.png', 32990000, 31990000, 4, N'<b>Màu sắc</b>: Hồng<br><b>Loại</b>: 236GB<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (42, 200007, 226, N'iPhone 12 Pro Max', N'77548180bf11455493f38bbd8c8840be.png', 32990000, 31990000, 3, N'<b>Màu sắc</b>: Xanh Dương<br><b>Loại</b>: 256GB<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (43, 200008, 181, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'6e4dc2f7bde6432a9cbeb912e45e2dcd.png', 16990000, 16990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (44, 200008, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 2, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (45, 200009, 176, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'f83fb15ccc6f442c940481a2211085fb.png', 17990000, 15990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (46, 200009, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (47, 200010, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (48, 200010, 179, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 1, N'<b>Loại</b>: SSD 256GB Silver <br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (49, 200011, 227, N'Điện thoại iPhone 12 Pro 128GB', N'f22b91667b784797a0daefcedc54dc40.png', 30990000, 2950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (50, 200011, 226, N'iPhone 12 Pro Max', N'77548180bf11455493f38bbd8c8840be.png', 32990000, 31990000, 1, N'<b>Màu sắc</b>: Tím<br><b>Loại</b>: 512GB<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (51, 200011, 181, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'6e4dc2f7bde6432a9cbeb912e45e2dcd.png', 16990000, 16990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (52, 200011, 231, N'Samsung Galaxy S21 Ultra 5G 128GB', N'aaa36a6b8e0f401eaf9e83ddda6c7437.png', 30990000, 29590000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (53, 200012, 226, N'iPhone 12 Pro Max', N'77548180bf11455493f38bbd8c8840be.png', 32990000, 31990000, 1, N'<b>Màu sắc</b>: Tím<br><b>Loại</b>: 512GB<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (54, 200012, 227, N'Điện thoại iPhone 12 Pro 128GB', N'f22b91667b784797a0daefcedc54dc40.png', 30990000, 2950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (55, 200013, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (56, 200014, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (57, 200014, 179, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 1, N'<b>Loại</b>: SSD 256GB Silver <br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (58, 200014, 176, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'f83fb15ccc6f442c940481a2211085fb.png', 17990000, 15990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (59, 200015, 176, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'f83fb15ccc6f442c940481a2211085fb.png', 17990000, 15990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (60, 200015, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (61, 200015, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (62, 200015, 179, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 1, N'<b>Loại</b>: SSD 256GB Silver <br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (63, 200016, 237, N'Samsung Galaxy A51 (6GB/128GB)', N'a243be43d38e46dd91d295df68cd3233.png', 7990000, 6590000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (64, 200016, 176, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'f83fb15ccc6f442c940481a2211085fb.png', 17990000, 15990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (65, 200016, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (66, 200016, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (67, 200016, 179, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 1, N'<b>Loại</b>: SSD 256GB Silver <br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (68, 200017, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (69, 200017, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (70, 200018, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (71, 200018, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (72, 200019, 237, N'Samsung Galaxy A51 (6GB/128GB)', N'a243be43d38e46dd91d295df68cd3233.png', 7990000, 6590000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (73, 200019, 176, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'f83fb15ccc6f442c940481a2211085fb.png', 17990000, 15990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (74, 200019, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (75, 200019, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (76, 200019, 179, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 1, N'<b>Loại</b>: SSD 256GB Silver <br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (77, 200020, 237, N'Samsung Galaxy A51 (6GB/128GB)', N'a243be43d38e46dd91d295df68cd3233.png', 7990000, 6590000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (78, 200020, 176, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'f83fb15ccc6f442c940481a2211085fb.png', 17990000, 15990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (79, 200021, 237, N'Samsung Galaxy A51 (6GB/128GB)', N'a243be43d38e46dd91d295df68cd3233.png', 7990000, 6590000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (80, 200021, 176, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'f83fb15ccc6f442c940481a2211085fb.png', 17990000, 15990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (81, 200021, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (82, 200022, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (83, 200022, 179, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 1, N'<b>Loại</b>: SSD 256GB Silver <br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (84, 200022, 227, N'Điện thoại iPhone 12 Pro 128GB', N'f22b91667b784797a0daefcedc54dc40.png', 30990000, 2950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (85, 200023, 176, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'f83fb15ccc6f442c940481a2211085fb.png', 17990000, 15990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (86, 200024, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (87, 200025, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (88, 200026, 179, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 1, N'<b>Loại</b>: SSD 256GB Silver <br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (89, 200026, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (90, 200027, 176, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'f83fb15ccc6f442c940481a2211085fb.png', 17990000, 15990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (91, 200027, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (92, 200028, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (93, 200029, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (94, 200030, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (95, 200030, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (96, 200031, 176, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'f83fb15ccc6f442c940481a2211085fb.png', 17990000, 15990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (97, 200032, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (98, 200033, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (99, 200033, 227, N'Điện thoại iPhone 12 Pro 128GB', N'f22b91667b784797a0daefcedc54dc40.png', 30990000, 2950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (100, 200034, 237, N'Samsung Galaxy A51 (6GB/128GB)', N'a243be43d38e46dd91d295df68cd3233.png', 7990000, 6590000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (101, 200034, 179, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 1, N'<b>Loại</b>: SSD 256GB Silver <br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (102, 200035, 234, N'Samsung Galaxy S20 FE (8GB/256GB)', N'e2b729b6b7294b7792cd71a1e855b655.png', 15490000, 14990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (103, 200036, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (104, 200036, 179, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 1, N'<b>Loại</b>: SSD 256GB Grey<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (105, 200036, 239, N'Samsung Galaxy Watch Active 2 44mm viền nhôm dây sillicone', N'caec4a1c193545b08d2b97ee8aa0b93d.png', 7990000, 4990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (106, 200036, 257, N'Laptop Dell Gaming G3 15 i7 10750H/16GB/512GB/6GB', N'6b1e41120f774bdfb6ac166e724e06ed.png', 29990000, 29290000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (107, 200037, 234, N'Samsung Galaxy S20 FE (8GB/256GB)', N'e2b729b6b7294b7792cd71a1e855b655.png', 15490000, 14990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (108, 200038, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: undefined<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (109, 200039, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (110, 200039, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (111, 200040, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (112, 200040, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (113, 200040, 179, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 1, N'<b>Loại</b>: SSD 256GB Silver <br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (114, 200041, 176, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'f83fb15ccc6f442c940481a2211085fb.png', 17990000, 15990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (115, 200041, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (116, 200042, 237, N'Samsung Galaxy A51 (6GB/128GB)', N'a243be43d38e46dd91d295df68cd3233.png', 7990000, 6590000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (117, 200042, 231, N'Samsung Galaxy S21 Ultra 5G 128GB', N'aaa36a6b8e0f401eaf9e83ddda6c7437.png', 30990000, 29590000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (118, 200042, 227, N'Điện thoại iPhone 12 Pro 128GB', N'f22b91667b784797a0daefcedc54dc40.png', 30990000, 2950000, 2, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (119, 200042, 226, N'iPhone 12 Pro Max', N'77548180bf11455493f38bbd8c8840be.png', 32990000, 31990000, 2, N'<b>Màu sắc</b>: Tím<br><b>Cấu hình</b>: 515GB <br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (120, 200042, 238, N'Apple Watch S3 GPS 38mm viền nhôm dây cao su đen', N'7cf7a27ad3304322a353be9b69f4d693.png', 5990000, 5091000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (121, 200043, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Silver<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (122, 200044, 181, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'6e4dc2f7bde6432a9cbeb912e45e2dcd.png', 16990000, 16990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (123, 200045, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 1, N'<b>Loại</b>: 256GB Grey<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (124, 200046, 249, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 3, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (125, 200046, 251, N'Laptop Apple MacBook Pro M1 2020 8GB/256GB/Silver (MYDA2SA/A)', N'a864f853136e4bfbacc06049e7c1fbd9.png', 34990000, 33190000, 2, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (126, 200046, 178, N'Laptop Apple MacBook Air M1 2020 8GB/256GB/Gold (MGND3SA/A)', N'2aea5e1aea5f458c8daad18902b1f55b.png', 28990000, 27490000, 2, N'<b>Loại</b>: 256GB Grey<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (127, 200047, 226, N'iPhone 12 Pro Max', N'77548180bf11455493f38bbd8c8840be.png', 32990000, 31990000, 1, N'<b>Màu sắc</b>: Đỏ<br><b>Cấu hình</b>: undefined<br>')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (128, 200048, 176, N'Laptop Lenovo IdeaPad 3 15ITL6 i5 1135G7/8GB/512GB/Win10', N'f83fb15ccc6f442c940481a2211085fb.png', 17990000, 15990000, 1, N'')
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [ProductName], [ProductImage], [ProductPrice], [ProductDiscountPrice], [Qty], [Attribute]) VALUES (129, 200048, 177, N'Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10', N'fe94d14c19b545deb5558b49d4df3a5e.png', 19900000, 18950000, 1, N'')
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (176, 2, N'Hũ thay thế cho cối xay Comandante – Trong Suốt', N'hu-thay-the-cho-coi-xay-comandante---trong-suot-176', N'28163b493a5c4727ad877250694f0cd4.png', 1000, 10, 290000, 250000, 1, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (177, 2, N'Hũ thay thế cho cối xay Comandante – Màu nâu', N'hu-thay-the-cho-coi-xay-comandante---mau-nau-177', N'9eb4d4a0647b47a0b41424a0dae6a8d4.png', 1010, 10, 290000, 250000, 1, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (178, 2, N'Cối Xay Cà Phê Bằng Tay KINGrinder K0 – Beginner Pour-Over', N'coi-xay-ca-phe-bang-tay-kingrinder-k0---beginner-pour-over-178', N'bf2091f2efa0493a833a618c1807436a.png', 1020, 10, 1200000, 1100000, 1, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (179, 2, N'Cối Xay Cà Phê Bằng Tay KINGrinder K1 – Beginner Espresso', N'coi-xay-ca-phe-bang-tay-kingrinder-k1---beginner-espresso-179', N'758e5799c94446b4bfe7b26416fe7525.png', 1030, 10, 2000000, 1600000, 1, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (180, 2, N'Cối Xay Cà Phê Bằng Tay KINGrinder K2 – Advanced', N'coi-xay-ca-phe-bang-tay-kingrinder-k2---advanced-180', N'fb3a203a0eb9418abcb95ce4544e69af.png', 1040, 10, 2500000, 2100000, 0, N'', NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (181, 2, N'Cối Xay Cà Phê Bằng Tay KINGrinder K4 – Expert Titanium', N'coi-xay-ca-phe-bang-tay-kingrinder-k4---expert-titanium-181', N'50d319996a6146499132812ac98a13a8.png', 1050, 10, 3500000, 3400000, 1, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (182, 2, N'Cối Xay Cà Phê Bằng Tay KINGrinder K6 – Ultimate', N'coi-xay-ca-phe-bang-tay-kingrinder-k6---ultimate-182', N'52d16a2e44574765a3ca592cebf499ce.png', 1060, 10, 4000000, 3600000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (183, 2, N'Ấm rót cà phê Kalita Tsubame Copper 700ml', N'am-rot-ca-phe-kalita-tsubame-copper-700ml-183', N'ac697524c000411ea54ab31fb08df868.png', 1070, 10, 5000000, 4800000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (184, 2, N'Dụng cụ ngâm Cold-brew Kitchen Aid KCM5912SX', N'dung-cu-ngam-cold-brew-kitchen-aid-kcm5912sx-184', N'9b468f33b6a24698bab865a6d1765ba5.png', 1080, 10, 4800000, 4650000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (185, 2, N'Cân điện tử Acaia Lunar 2021 – AL008', N'can-dien-tu-acaia-lunar-2021---al008-185', N'a4cfed4030724f21aff298d2e3a012c4.png', 1090, 10, 10000000, 8000000, 0, N'', NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (186, 2, N'Combo Nanopresso Grey (không case) + Small Case + NS Adapter + Nanovessel', N'combo-nanopresso-grey--khong-case----small-case---ns-adapter---nanovessel-186', N'97a42c67d88849abb7eeea2edb97fa08.png', 1100, 10, 4000000, 3500000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (187, 2, N'Combo Wacaco Nanopresso Grey kèm túi chống sốc size S và Nanopresso Ns Adapter', N'combo-wacaco-nanopresso-grey-kem-tui-chong-soc-size-s-va-nanopresso-ns-adapter-187', N'86982d3b59d8429c85ffe44e13687c44.png', 1110, 10, 3000000, 2600000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (188, 2, N'Máy xay cà phê Niche Zero – Niche Zero Grinder White – màu trắng', N'may-xay-ca-phe-niche-zero---niche-zero-grinder-white---mau-trang-188', N'cb109a79999b4d96bf06dbc995cabffe.png', 1120, 10, 30000000, 26000000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (189, 2, N'Bộ Ly Thử Nếm Cà Phê Avensi Starter Set: 2 x Vida', N'bo-ly-thu-nem-ca-phe-avensi-starter-set--2-x-vida-189', N'2be37134af1f4ee0b220c98eee7a0b35.png', 1130, 10, 1000000, 950000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (190, 2, N'Bộ ly thử nếm cà phê Avensi Complete Set: Vida, Senti, Alto', N'bo-ly-thu-nem-ca-phe-avensi-complete-set--vida--senti--alto-190', N'e05673cc6aec42f1a668baf79eb7b0c9.png', 1150, 10, 1500000, 1400000, 0, N'', NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (191, 2, N'Phin Việt Nam pha cà phê bằng đồng', N'phin-viet-nam-pha-ca-phe-bang-dong-191', N'61879c8f402d4b75929a55f87abfab9a.png', 1150, 10, 400000, 375000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (192, 2, N'Ấm rót nước cổ ngỗng tay gỗ Jimisi Gooseneck Kettle black – 600ml', N'am-rot-nuoc-co-ngong-tay-go-jimisi-gooseneck-kettle-black---600ml-192', N'51ae8cae4d1c46e4ba4066da70dcd162.png', 1160, 10, 900000, 800000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (193, 2, N'Bếp hồng ngoại Akirakoki Heating Halogen Black 1 Set Lighting', N'bep-hong-ngoai-akirakoki-heating-halogen-black-1-set-lighting-193', N'1c9940f850264e33a903450e871ee1b6.png', 1170, 10, 5000000, 4500000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (194, 2, N'Combo Dụng cụ ép cà phê bằng tay ROK espresso GC silver & Guru Pro grinder grey – winter break', N'combo-dung-cu-ep-ca-phe-bang-tay-rok-espresso-gc-silver---guru-pro-grinder-grey---winter-break-194', N'821dcb3eec9a4eb09632af09d35ec12c.png', 1180, 10, 8000000, 7100000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (195, 2, N'Bình pha cà phê lạnh Hario Filter – in coffee bottle Cherry ( Cranberry Red) FIC-70-CR-EX 5ly', N'binh-pha-ca-phe-lanh-hario-filter---in-coffee-bottle-cherry---cranberry-red--fic-70-cr-ex-5ly-195', N'2a1ed121ac274d0a969efd389c4e3b73.png', 1190, 10, 800000, 720000, 0, N'', NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (196, 2, N'Bình pha cà phê lạnh Hario Filter – in coffee bottle Green ( Deep Teal) FIC-70-DT-EX 5ly', N'binh-pha-ca-phe-lanh-hario-filter---in-coffee-bottle-green---deep-teal--fic-70-dt-ex-5ly-196', N'b2b7597498734d5a9cd851b97afe9a88.png', 1200, 10, 800000, 720000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (197, 2, N'BÌNH PHA CÀ PHÊ KIỂU PHÁP BODUM CAFFETTIERA FRENCH PRESS – MÀU NÂU – 3CUPS', N'binh-pha-ca-phe-kieu-phap-bodum-caffettiera-french-press---mau-nau---3cups-197', N'6090813cc0ec4650819c546a9b8c10a0.png', 1210, 10, 800000, 700000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (198, 2, N'Máy xay cà phê tự động mini bằng điện cầm tay Turbo – màu đen', N'may-xay-ca-phe-tu-dong-mini-bang-dien-cam-tay-turbo---mau-den-198', N'a5521118f9a7471a9ba5d8238406f310.png', 1220, 10, 4000000, 3500000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (199, 2, N'Bình pha cà phê Bodum french press Columbia 1L 1308-16', N'binh-pha-ca-phe-bodum-french-press-columbia-1l-1308-16-199', N'38d7d8b24dcc42ab84970292dac65280.png', 1230, 10, 2000000, 1950000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (200, 2, N'Dụng cụ ép Espresso bằng tay Wacaco Picopresso – Super Crema, màu đen', N'dung-cu-ep-espresso-bang-tay-wacaco-picopresso---super-crema--mau-den-200', N'3e39185037f9419a8a52a24826145c6f.png', 1240, 10, 4000000, 3300000, 0, N'', NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (201, 2, N'Dụng cụ nén cà phê Aeropress Kit coffee maker kèm túi đựng – made in USA', N'dung-cu-nen-ca-phe-aeropress-kit-coffee-maker-kem-tui-dung---made-in-usa-201', N'12956f637e28443cbccc22fbb38f6cb0.png', 1250, 10, 1500000, 1200000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (226, 1, N'Cà phê hạt Lavazza Espresso Top Class Coffee Beans', N'ca-phe-hat-lavazza-espresso-top-class-coffee-beans-226', N'4f83b646d00a463191c3994c08ea0259.png', 2000, 10, 1000000, 950000, 1, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (227, 1, N'Cà phê viên nén Illy Capsules Iperespresso Intenso Bold Roasted', N'ca-phe-vien-nen-illy-capsules-iperespresso-intenso-bold-roasted-227', N'cfc2c17f4b904ddea5828583778f8bde.png', 2000, 10, 500000, 400000, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (228, 1, N'Cà phê viên nén Illy Iperespresso Capsules Classico Roast', N'ca-phe-vien-nen-illy-iperespresso-capsules-classico-roast-228', N'b86363e497bc4482b0f3adf809a52720.png', 2001, 10, 500000, 400000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (229, 1, N'Cà phê hạt đã rang Blagu El Salvador Santa Ana La Joya Estate, medium roast', N'ca-phe-hat-da-rang-blagu-el-salvador-santa-ana-la-joya-estate--medium-roast-229', N'feea2dcab1ff42d1a8ab58952d5b8dcb.png', 6000, 10, 190000, 175000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (230, 1, N'Cà phê hạt Lavazza Gran Espresso Coffee Beans', N'ca-phe-hat-lavazza-gran-espresso-coffee-beans-230', N'82a499bfe8054cea80920de78d48b408.png', 1100, 10, 1000000, 950000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (231, 1, N'Cà phê hạt Illy Intenso Bold Roast Beans coffee', N'ca-phe-hat-illy-intenso-bold-roast-beans-coffee-231', N'a2447d0a326948d58f0b5fb9baf4d3e3.png', 4000, 10, 400000, 380000, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (232, 1, N'Cà phê Blagu hạt đã rang, Guatemala Huehuetenango', N'ca-phe-blagu-hat-da-rang--guatemala-huehuetenango-232', N'f511199671184ee38937f6206fdd1d22.png', 4010, 10, 80000, 70000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (233, 1, N'Cà phê hạ đã rang Blagu El Salvador Santa Ana La Joya Estate, Medium roast', N'ca-phe-ha-da-rang-blagu-el-salvador-santa-ana-la-joya-estate--medium-roast-233', N'b7c33fcc31f24e6d8f9fbf9cc57721a8.png', 6000, 10, 80000, 70000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (234, 1, N'Cà phê Blagu hạt đã rang, Guru 3 blend Cold brew – Strong Cold, medium dark roast', N'ca-phe-blagu-hat-da-rang--guru-3-blend-cold-brew---strong-cold--medium-dark-roast-234', N'b51a9c3e21bc4061b890e734b386690a.png', 6010, 10, 170000, 145000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (235, 1, N'Viên nén cà phê Nespresso Master Origin Ethiopia', N'vien-nen-ca-phe-nespresso-master-origin-ethiopia-235', N'544cd6175be94a0ea3a62fff6f66b6ff.png', 6020, 10, 300000, 205000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (236, 1, N'Combo 5 hộp Cà Phê Viên Nén Starbucks by Nespresso – Sumatra', N'combo-5-hop-ca-phe-vien-nen-starbucks-by-nespresso---sumatra-236', N'07b4dcfa1fa448ae995f486e2784a3be.png', 6050, 10, 1500000, 1250000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (237, 1, N'Cà phê bột Lavazza Ground Coffee Intenso', N'ca-phe-bot-lavazza-ground-coffee-intenso-237', N'b7e39f218618402f8d21a451fb2f338a.png', 6000, 10, 290000, 280000, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (238, 4, N'Ca đánh sữa Blagu milk Jug màu Magic 350ml', N'ca-danh-sua-blagu-milk-jug-mau-magic-350ml-238', N'84c3d8d793b443f1b76326c2e124884f.png', 8000, 10, 350000, 250000, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (239, 4, N'Bộ Sàng Lọc Kruve Sifter 5 tấm sàng- màu đen', N'bo-sang-loc-kruve-sifter-5-tam-sang--mau-den-239', N'358ce25c947942d991809934b64fe2cd.png', 9010, 10, 3000000, 2250000, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (240, 4, N'Apple Watch SE 40mm viền nhôm dây cao su', N'apple-watch-se-40mm-vien-nhom-day-cao-su-240', N'dc1929abdb734d38b0986e000d968d98.png', 9020, 10, 300000, 225000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (241, 4, N'Dụng cụ nén cà phê Espresso Tamper inox size 51 mm', N'dung-cu-nen-ca-phe-espresso-tamper-inox-size-51-mm-241', N'ed342bdb1d26449592286cded5cec070.png', 9040, 10, 500000, 425000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (242, 4, N'Bộ Sàng Lọc Kruve Sifter 5 tấm sàng – màu bạc', N'bo-sang-loc-kruve-sifter-5-tam-sang---mau-bac-242', N'706e5f0d7eb5468d8c566102de14f452.png', 8010, 10, 990000, 690000, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (243, 4, N'Đồng hồ bấm giờ Timer đen', N'dong-ho-bam-gio-timer-den-243', N'8fec2076aa7745f19cf432bf661ff68c.png', 9060, 10, 300000, 250000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (244, 4, N'Cân điện tử bấm thời gian Hario Scale V60 VSTM-2000 HSV Stainless Steel', N'can-dien-tu-bam-thoi-gian-hario-scale-v60-vstm-2000-hsv-stainless-steel-244', N'14971d1f5a774276a76d7354ed967467.png', 9070, 10, 3000000, 2600000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (245, 4, N'Cối trộn thức uống Hamilton Beach 727B Classic DrinkMaster – Trắng', N'coi-tron-thuc-uong-hamilton-beach-727b-classic-drinkmaster---trang-245', N'b59dac895f864fb4a8e10df36ff8d162.png', 9090, 10, 3000000, 2500000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (246, 4, N'Đồng hồ thông minh Garmin Forerunner 45 dây silicone đen', N'dong-ho-thong-minh-garmin-forerunner-45-day-silicone-den-246', N'528587080fc4471db136065acd70b51f.png', 9100, 10, 5090000, 4590000, 0, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (247, 4, N'Samsung Galaxy Watch Active 2 40mm viền nhôm dây silicone', N'samsung-galaxy-watch-active-2-40mm-vien-nhom-day-silicone-247', N'7df6595f9a54477abd62862f319d797b.png', 9110, 10, 5990000, 2990000, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (248, 25, N'Máy Làm Nguội Gene Café CBC-101', N'may-lam-nguoi-gene-cafe-cbc-101-248', N'b8755a91674f44afa6f2cc61df4a9bfa.png', 1000, 10, 3500000, 3000000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (249, 25, N'Máy xay cà phê Niche Zero – Niche Zero Grinder White – màu trắng', N'may-xay-ca-phe-niche-zero---niche-zero-grinder-white---mau-trang-249', N'2fcddb83e8fe40e4ac02c12c28040237.png', 1010, 10, 25000000, 24000000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (250, 25, N'Máy pha cà phê Franciss Franciss Espresso Machine – màu cam', N'may-pha-ca-phe-franciss-franciss-espresso-machine---mau-cam-250', N'a17ad3e26d134349a662fb34aefd0871.png', 1020, 10, 18000000, 16500000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (251, 25, N'Máy pha cà phê viên nén Nespresso Pixie Aluminium Silver Capsule Machine – Màu Bạc', N'may-pha-ca-phe-vien-nen-nespresso-pixie-aluminium-silver-capsule-machine---mau-bac-251', N'7c915124fb1246468ea11a8a5d37eac6.png', 1030, 10, 7000000, 6500000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (252, 25, N'Máy rang cà phê Gené Cafe CBR-101 – 220V – Màu Đỏ', N'may-rang-ca-phe-gene-cafe-cbr-101---220v---mau-do-252', N'7df6702562624869a2c1496906c7b7e2.png', 1040, 10, 15000000, 12100000, 0, N'', NULL)
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (253, 25, N'Máy Xay Cà Phê Fellow Ode Brew Grinder – Hand brew – 220 V', N'may-xay-ca-phe-fellow-ode-brew-grinder---hand-brew---220-v-253', N'4440f1fc352a4d44a69ea45013f10f8e.png', 1050, 10, 9500000, 7800000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (254, 25, N'MÁY XAY CÀ PHÊ AKIRAKOKI COFFEE GRINDER SUPER M-520A WHITE', N'may-xay-ca-phe-akirakoki-coffee-grinder-super-m-520a-white-254', N'c2f97f0ea59146fd875bfc8d7b0ecbdd.png', 1060, 10, 4500000, 3000000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (255, 25, N'MÁY XAY CÀ PHÊ FEIMA ELECTRIC GRINDER 601N – MÀU ĐEN – 220V', N'may-xay-ca-phe-feima-electric-grinder-601n---mau-den---220v-255', N'4dd09dcc51634a6f951df03f2bcb6d7e.png', 1070, 10, 7000000, 6300000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (256, 25, N'Máy Pha Cà Phê Viên Nén Nespresso Delonghi', N'may-pha-ca-phe-vien-nen-nespresso-delonghi-256', N'393af099131a4dfc944d8dd26dc50716.png', 1080, 10, 7000000, 6500000, 0, N'', N'<h3><br></h3>')
INSERT [dbo].[Product] ([Id], [MenuId], [Name], [Alias], [Image], [Index], [Status], [Price], [DiscountPrice], [Selling], [ShortDescription], [Description]) VALUES (257, 25, N'Máy rang cà phê mẫu Fresh Roast SR540 – 110V', N'may-rang-ca-phe-mau-fresh-roast-sr540---110v-257', N'23bfc8ff82ae4ca9aef4cdf18a0bad8d.png', 1090, 10, 8000000, 7500000, 0, N'', NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([Id], [OrderDetailId], [ProductId], [Star], [Content], [Status], [Created], [CreatedBy]) VALUES (3, 33, 178, 5, N'Rất hài lòng', 20, CAST(N'2021-08-17 22:41:26.947' AS DateTime), N'Ngô Xuân Duong')
INSERT [dbo].[Review] ([Id], [OrderDetailId], [ProductId], [Star], [Content], [Status], [Created], [CreatedBy]) VALUES (4, 34, 179, 3, N'Sản phẩm tốt', 10, CAST(N'2021-08-17 22:41:55.683' AS DateTime), N'Ngô Xuân Duong')
INSERT [dbo].[Review] ([Id], [OrderDetailId], [ProductId], [Star], [Content], [Status], [Created], [CreatedBy]) VALUES (5, 43, 181, 5, N'Sản phẩm đẹp, đóng gói giao hàng cẩn thận', 20, CAST(N'2021-08-17 23:42:28.507' AS DateTime), N'Ngô Xuân Duong')
INSERT [dbo].[Review] ([Id], [OrderDetailId], [ProductId], [Star], [Content], [Status], [Created], [CreatedBy]) VALUES (6, 44, 177, 5, N'Sản phẩm đẹp, đóng gói giao hàng cẩn thận', 20, CAST(N'2021-08-17 23:42:32.400' AS DateTime), N'Ngô Xuân Duong')
INSERT [dbo].[Review] ([Id], [OrderDetailId], [ProductId], [Star], [Content], [Status], [Created], [CreatedBy]) VALUES (7, 107, 234, 5, N'Đt đẹp mướt, sẽ mua thêm vài cái', 20, CAST(N'2021-08-18 10:56:54.377' AS DateTime), N'Hoàng Ánh Nguyệt')
INSERT [dbo].[Review] ([Id], [OrderDetailId], [ProductId], [Star], [Content], [Status], [Created], [CreatedBy]) VALUES (8, 124, 249, 5, N'Rất hài lòng sản phẩm. sẽ ủng hộ shop lần sau', 20, CAST(N'2021-08-19 23:43:51.837' AS DateTime), N'Ngô Hoàng Linh')
INSERT [dbo].[Review] ([Id], [OrderDetailId], [ProductId], [Star], [Content], [Status], [Created], [CreatedBy]) VALUES (9, 126, 178, 5, N'Rất hài lòng sản phẩm, sẽ ủng hộ shop lần sau', 20, CAST(N'2021-08-19 23:44:13.650' AS DateTime), N'Ngô Hoàng Linh')
SET IDENTITY_INSERT [dbo].[Review] OFF
INSERT [dbo].[User] ([UserName], [Password], [FullName], [Phone], [Email], [LastLogin], [Active]) VALUES (N'Admin', N'72b221014c5bb553560230a17a6a4b2209b303f5b93b913e2fef52988a36ed9d', N'Admin', N'09874321', N'email@gmail.com', CAST(N'2022-05-15 20:58:41.857' AS DateTime), 1)
INSERT [dbo].[User] ([UserName], [Password], [FullName], [Phone], [Email], [LastLogin], [Active]) VALUES (N'thang', N'b1b42c8b9169415ff778ebfc923767440f0c196cb4dd68f3ddd51b87251755be', N'Thắng Lê', N'09879654321', N'asd@gmail.com', CAST(N'2022-05-15 21:00:11.597' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Website] ON 

INSERT [dbo].[Website] ([Id], [Name], [Logo], [PhoneNumber], [Fax], [Email], [Address], [Location], [Facebook], [Youtube], [Copyright]) VALUES (1, N'Coffee Shop', N'03740390fb9e4defb767fba57e5f5266.png', N'0987.654.321', N'1900.1900', N'coffeeshop@gmail.com', N'828 Sư Vạn Hạnh, Phường 12, Quận 10, Thành phố Hồ Chí Minh', N'<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15677.84222605228!2d106.6673702!3d10.7759946!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x9a3519bdad5a85a3!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOZ2_huqFpIG5n4buvIC0gVGluIGjhu41jIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1650856721263!5m2!1svi!2s" width="90%" height="auto" style="border:0;" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>', N'http://www.facebook.com/', N'https://www.youtube.com/', N'Copyright © 2022 CoffeeShop')
SET IDENTITY_INSERT [dbo].[Website] OFF
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Menu]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Menu] FOREIGN KEY([ParentMenu])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Menu]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerCode])
REFERENCES [dbo].[Customer] ([Code])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Menu]
GO
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Attribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[Attribute] ([Id])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Attribute]
GO
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product]
GO
ALTER TABLE [dbo].[ProductRelated]  WITH CHECK ADD  CONSTRAINT [FK_ProductRelated_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductRelated] CHECK CONSTRAINT [FK_ProductRelated_Product]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Product]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: WAITING_FOR_REVIEW. 
2: WAITING_FOR_APPROVAL. 
3: READY_TO_SEND_TO_CUSTOMER. 
4: QUOTATION_IS_NEARLY_INVALID.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailTemplate', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'10: Chờ xác nhận
20: Đã xác nhận
30: Đang vận chuyển
40: Đã giao
50: Đã hủy' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'10: Đang bán
20: Dừng bán
30: Hết hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'10: Chờ duyệt
20: Đã duyệt
30: Cập nhật lại - Chờ duyệt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Review', @level2type=N'COLUMN',@level2name=N'Status'
GO
USE [master]
GO
ALTER DATABASE [Ecommerce] SET  READ_WRITE 
GO
