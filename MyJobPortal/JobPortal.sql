USE [master]
GO
/****** Object:  Database [MyJobPortal]    Script Date: 15/01/2019 11:46:26 AM ******/
CREATE DATABASE [MyJobPortal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyJobPortal', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MyJobPortal.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyJobPortal_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MyJobPortal_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyJobPortal] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyJobPortal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyJobPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyJobPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyJobPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyJobPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyJobPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyJobPortal] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyJobPortal] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MyJobPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyJobPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyJobPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyJobPortal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyJobPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyJobPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyJobPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyJobPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyJobPortal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyJobPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyJobPortal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyJobPortal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyJobPortal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyJobPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyJobPortal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyJobPortal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyJobPortal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyJobPortal] SET  MULTI_USER 
GO
ALTER DATABASE [MyJobPortal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyJobPortal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyJobPortal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyJobPortal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MyJobPortal]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 15/01/2019 11:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[BranchName] [varchar](100) NULL,
	[AddressLine1] [varchar](250) NULL,
	[AddressLine2] [varchar](250) NULL,
	[CityId] [int] NOT NULL,
	[Pincode] [varchar](50) NULL,
	[StateId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[PhoneNumber1] [varchar](50) NULL,
	[PhoneNumber2] [varchar](50) NULL,
	[EmailId1] [varchar](50) NULL,
	[EmailId2] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 15/01/2019 11:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](100) NOT NULL,
	[StateId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyDetails]    Script Date: 15/01/2019 11:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](100) NOT NULL,
	[WebsiteURL] [varchar](100) NULL,
	[IndustryID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 15/01/2019 11:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
	[Status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 15/01/2019 11:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](500) NOT NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 15/01/2019 11:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](500) NOT NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HiringManager]    Script Date: 15/01/2019 11:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HiringManager](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[HiringManagerName] [varchar](500) NOT NULL,
	[EmailId] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Industry]    Script Date: 15/01/2019 11:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Industry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IndustryName] [varchar](50) NOT NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 15/01/2019 11:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](100) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Title]    Script Date: 15/01/2019 11:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Title](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TitleName] [varchar](50) NOT NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([Id], [CompanyId], [BranchName], [AddressLine1], [AddressLine2], [CityId], [Pincode], [StateId], [CountryId], [PhoneNumber1], [PhoneNumber2], [EmailId1], [EmailId2]) VALUES (1, 1, N'Main', N'1, abc', N'', 5, N'400601', 3, 1, N'9876543210', N'', N'abc@gmail.com', N'')
INSERT [dbo].[Branch] ([Id], [CompanyId], [BranchName], [AddressLine1], [AddressLine2], [CityId], [Pincode], [StateId], [CountryId], [PhoneNumber1], [PhoneNumber2], [EmailId1], [EmailId2]) VALUES (2, 1, N'Branch2', N'cvbnm,', N'', 1, N'', 1, 1, N'9876543210', N'', N'kbc@gmail.com', N'')
INSERT [dbo].[Branch] ([Id], [CompanyId], [BranchName], [AddressLine1], [AddressLine2], [CityId], [Pincode], [StateId], [CountryId], [PhoneNumber1], [PhoneNumber2], [EmailId1], [EmailId2]) VALUES (3, 1, N'Branch 3', N'yesfcbdvnkvnb', N'', 3, N'', 3, 1, N'9876543210', N'', N'xyz@gmail.com', N'')
SET IDENTITY_INSERT [dbo].[Branch] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [CityName], [StateId], [CountryId], [Status]) VALUES (1, N'New Delhi', 1, 1, N'Active')
INSERT [dbo].[City] ([Id], [CityName], [StateId], [CountryId], [Status]) VALUES (2, N'Chandigadh', 5, 1, N'Active')
INSERT [dbo].[City] ([Id], [CityName], [StateId], [CountryId], [Status]) VALUES (3, N'Mumbai', 3, 1, N'Active')
INSERT [dbo].[City] ([Id], [CityName], [StateId], [CountryId], [Status]) VALUES (4, N'California', 2, 2, N'Active')
INSERT [dbo].[City] ([Id], [CityName], [StateId], [CountryId], [Status]) VALUES (5, N'Thane', 3, 1, N'Active')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[CompanyDetails] ON 

INSERT [dbo].[CompanyDetails] ([Id], [CompanyName], [WebsiteURL], [IndustryID], [Description], [Status]) VALUES (1, N'Demo Company', N'https://www.youtube.com/', 10, N'hfgtjngtvgn  dfhhfhf', N'Active')
SET IDENTITY_INSERT [dbo].[CompanyDetails] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [CountryName], [Status]) VALUES (1, N'India', N'Active')
INSERT [dbo].[Country] ([Id], [CountryName], [Status]) VALUES (2, N'United State Of America', N'Active')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [DepartmentName], [Status]) VALUES (1, N'IT', N'Active')
INSERT [dbo].[Department] ([Id], [DepartmentName], [Status]) VALUES (2, N'Sales', N'Active')
INSERT [dbo].[Department] ([Id], [DepartmentName], [Status]) VALUES (3, N'Marketing', N'Active')
INSERT [dbo].[Department] ([Id], [DepartmentName], [Status]) VALUES (4, N'HR', N'Active')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [DesignationName], [Status]) VALUES (1, N'Designation2', N'Active')
INSERT [dbo].[Designation] ([Id], [DesignationName], [Status]) VALUES (2, N'Designation', N'Active')
INSERT [dbo].[Designation] ([Id], [DesignationName], [Status]) VALUES (3, N'mANAGER', N'Active')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[HiringManager] ON 

INSERT [dbo].[HiringManager] ([Id], [CompanyId], [BranchId], [DepartmentId], [HiringManagerName], [EmailId]) VALUES (1, 1, 1, 2, N'Demo', N'abd@gmail.com')
SET IDENTITY_INSERT [dbo].[HiringManager] OFF
SET IDENTITY_INSERT [dbo].[Industry] ON 

INSERT [dbo].[Industry] ([Id], [IndustryName], [Status]) VALUES (1, N'Finance', N'Active')
INSERT [dbo].[Industry] ([Id], [IndustryName], [Status]) VALUES (2, N'Education', N'Active')
INSERT [dbo].[Industry] ([Id], [IndustryName], [Status]) VALUES (3, N'Pharma', N'Active')
INSERT [dbo].[Industry] ([Id], [IndustryName], [Status]) VALUES (4, N'Chemical', N'Active')
INSERT [dbo].[Industry] ([Id], [IndustryName], [Status]) VALUES (5, N'Media', N'Active')
INSERT [dbo].[Industry] ([Id], [IndustryName], [Status]) VALUES (6, N'Automobile', N'Active')
INSERT [dbo].[Industry] ([Id], [IndustryName], [Status]) VALUES (7, N'Insurance', N'Active')
INSERT [dbo].[Industry] ([Id], [IndustryName], [Status]) VALUES (8, N'Tourism', N'Active')
INSERT [dbo].[Industry] ([Id], [IndustryName], [Status]) VALUES (9, N'Textile', N'Active')
INSERT [dbo].[Industry] ([Id], [IndustryName], [Status]) VALUES (10, N'IT', N'Active')
SET IDENTITY_INSERT [dbo].[Industry] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([Id], [StateName], [CountryId], [Status]) VALUES (1, N'Delhi', 1, N'Active')
INSERT [dbo].[State] ([Id], [StateName], [CountryId], [Status]) VALUES (2, N'California', 2, N'Active')
INSERT [dbo].[State] ([Id], [StateName], [CountryId], [Status]) VALUES (3, N'Maharashtra', 1, N'Active')
INSERT [dbo].[State] ([Id], [StateName], [CountryId], [Status]) VALUES (4, N'Kerla', 1, N'Active')
INSERT [dbo].[State] ([Id], [StateName], [CountryId], [Status]) VALUES (5, N'Punjab', 1, N'Active')
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[Title] ON 

INSERT [dbo].[Title] ([Id], [TitleName], [Status]) VALUES (1, N'Mr.', N'Active')
INSERT [dbo].[Title] ([Id], [TitleName], [Status]) VALUES (2, N'Mrs.', N'Active')
INSERT [dbo].[Title] ([Id], [TitleName], [Status]) VALUES (3, N'Mr.', N'Inactive')
INSERT [dbo].[Title] ([Id], [TitleName], [Status]) VALUES (4, N'Mr', N'Active')
INSERT [dbo].[Title] ([Id], [TitleName], [Status]) VALUES (5, N'Mr', N'Inactive')
SET IDENTITY_INSERT [dbo].[Title] OFF
USE [master]
GO
ALTER DATABASE [MyJobPortal] SET  READ_WRITE 
GO
