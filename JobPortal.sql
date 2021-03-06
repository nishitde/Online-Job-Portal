USE [master]
GO
/****** Object:  Database [MyJobPortal]    Script Date: 27/03/2019 11:45:50 AM ******/
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
ALTER DATABASE [MyJobPortal] SET  DISABLE_BROKER 
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
/****** Object:  Table [dbo].[Answer]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AnswerName] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Applied_Jobs]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applied_Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobSeekerId] [int] NOT NULL,
	[JobPostId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Branch]    Script Date: 27/03/2019 11:45:50 AM ******/
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
/****** Object:  Table [dbo].[City]    Script Date: 27/03/2019 11:45:50 AM ******/
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
/****** Object:  Table [dbo].[CompanyDetails]    Script Date: 27/03/2019 11:45:50 AM ******/
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
/****** Object:  Table [dbo].[Country]    Script Date: 27/03/2019 11:45:50 AM ******/
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
/****** Object:  Table [dbo].[Degree]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Degree](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DegreeName] [varchar](500) NOT NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 27/03/2019 11:45:50 AM ******/
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
/****** Object:  Table [dbo].[Designation]    Script Date: 27/03/2019 11:45:50 AM ******/
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
/****** Object:  Table [dbo].[HiringManager]    Script Date: 27/03/2019 11:45:50 AM ******/
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
/****** Object:  Table [dbo].[Industry]    Script Date: 27/03/2019 11:45:50 AM ******/
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
/****** Object:  Table [dbo].[JobPost]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobPost](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterId] [int] NOT NULL,
	[JobTitle] [varchar](500) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[DesignationId] [int] NOT NULL,
	[JobType] [varchar](50) NOT NULL,
	[ApplicableToSex] [varchar](50) NOT NULL,
	[MinSalary] [decimal](16, 2) NOT NULL,
	[MaxSalary] [decimal](16, 2) NOT NULL,
	[JobDescription] [nvarchar](max) NOT NULL,
	[Status] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobPost_Answer]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobPost_Answer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Answer] [varchar](max) NOT NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobPost_Branches]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobPost_Branches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobPostId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobPost_InterviewProcess]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobPost_InterviewProcess](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobPostId] [int] NULL,
	[AptitudeTest] [varchar](10) NOT NULL,
	[NumberOfAptitudeTests] [int] NULL,
	[GroupDiscussion] [varchar](10) NOT NULL,
	[NumberOfGDs] [int] NULL,
	[TechnicalRound] [varchar](10) NOT NULL,
	[NumberOfTechnicalRounds] [int] NULL,
	[PersonalInterview] [varchar](10) NOT NULL,
	[NumberOfPersonalInterviews] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobPost_Question]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobPost_Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobPostId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[QuestionName] [varchar](max) NOT NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobPost_Requirement]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobPost_Requirement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobPostId] [int] NOT NULL,
	[RequiredEducationId] [int] NOT NULL,
	[RequiredExperience] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobPost_Save]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobPost_Save](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobSeekerId] [int] NOT NULL,
	[JobPostId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobPost_Skills]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobPost_Skills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobPostId] [int] NOT NULL,
	[SkillId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TitleId] [int] NOT NULL,
	[FirstName] [varchar](500) NOT NULL,
	[LastName] [varchar](500) NOT NULL,
	[EmailId] [varchar](500) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [varchar](25) NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[EnableEmail] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[QuestionName] [varchar](max) NOT NULL,
	[RelatedTo] [varchar](50) NOT NULL,
	[CompanyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question_Answer]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question_Answer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Answer] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recruiter_Company]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiter_Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skills]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Skills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SkillTypeId] [int] NOT NULL,
	[SkillName] [varchar](500) NOT NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SkillType]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SkillType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SkillTypeName] [varchar](500) NOT NULL,
	[Status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 27/03/2019 11:45:50 AM ******/
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
/****** Object:  Table [dbo].[Title]    Script Date: 27/03/2019 11:45:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Title](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TitleName] [varchar](50) NOT NULL,
	[ApplicableToGender] [varchar](15) NOT NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Applied_Jobs] ON 

INSERT [dbo].[Applied_Jobs] ([Id], [JobSeekerId], [JobPostId]) VALUES (6, 1, 3)
INSERT [dbo].[Applied_Jobs] ([Id], [JobSeekerId], [JobPostId]) VALUES (7, 1, 6)
SET IDENTITY_INSERT [dbo].[Applied_Jobs] OFF
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

INSERT [dbo].[CompanyDetails] ([Id], [CompanyName], [WebsiteURL], [IndustryID], [Description], [Status]) VALUES (1, N'Demo Company', N'https://www.youtube.com/', 5, N'hfgtjngtvgn  dfhhfhf', N'Active')
SET IDENTITY_INSERT [dbo].[CompanyDetails] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [CountryName], [Status]) VALUES (1, N'India', N'Active')
INSERT [dbo].[Country] ([Id], [CountryName], [Status]) VALUES (2, N'United State Of America', N'Active')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Degree] ON 

INSERT [dbo].[Degree] ([Id], [DegreeName], [Status]) VALUES (1, N'Diploma in Computer Science', N'Active')
INSERT [dbo].[Degree] ([Id], [DegreeName], [Status]) VALUES (2, N'Diploma in Mechanical Engineering', N'Active')
INSERT [dbo].[Degree] ([Id], [DegreeName], [Status]) VALUES (3, N'Diploma in Electrical and Electronics Engineering', N'Active')
INSERT [dbo].[Degree] ([Id], [DegreeName], [Status]) VALUES (4, N'Business Management Studies', N'Active')
INSERT [dbo].[Degree] ([Id], [DegreeName], [Status]) VALUES (5, N'Architect Demo', N'Active')
INSERT [dbo].[Degree] ([Id], [DegreeName], [Status]) VALUES (6, N'B Pharm', N'Active')
SET IDENTITY_INSERT [dbo].[Degree] OFF
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
INSERT [dbo].[HiringManager] ([Id], [CompanyId], [BranchId], [DepartmentId], [HiringManagerName], [EmailId]) VALUES (2, 1, 2, 2, N'fhbfghf', N'gfhng@gmail.com')
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
SET IDENTITY_INSERT [dbo].[JobPost] ON 

INSERT [dbo].[JobPost] ([Id], [RecruiterId], [JobTitle], [CompanyId], [DepartmentId], [DesignationId], [JobType], [ApplicableToSex], [MinSalary], [MaxSalary], [JobDescription], [Status]) VALUES (1, 1, N'Demo', 1, 1, 2, N'FullTime', N'Male', CAST(25000.00 AS Decimal(16, 2)), CAST(30000.00 AS Decimal(16, 2)), N'fhtghjntyg', N'Active')
INSERT [dbo].[JobPost] ([Id], [RecruiterId], [JobTitle], [CompanyId], [DepartmentId], [DesignationId], [JobType], [ApplicableToSex], [MinSalary], [MaxSalary], [JobDescription], [Status]) VALUES (2, 1, N'Demo tfghgtju', 1, 1, 2, N'FullTime', N'Male', CAST(25000.00 AS Decimal(16, 2)), CAST(30000.00 AS Decimal(16, 2)), N'fhtghjntyg', N'Active')
INSERT [dbo].[JobPost] ([Id], [RecruiterId], [JobTitle], [CompanyId], [DepartmentId], [DesignationId], [JobType], [ApplicableToSex], [MinSalary], [MaxSalary], [JobDescription], [Status]) VALUES (3, 1, N'Demo tfghgtju jgjbhnju', 1, 1, 2, N'FullTime', N'Male', CAST(25000.00 AS Decimal(16, 2)), CAST(30000.00 AS Decimal(16, 2)), N'fhtghjntyg', N'Active')
INSERT [dbo].[JobPost] ([Id], [RecruiterId], [JobTitle], [CompanyId], [DepartmentId], [DesignationId], [JobType], [ApplicableToSex], [MinSalary], [MaxSalary], [JobDescription], [Status]) VALUES (4, 1, N'nhjubn', 1, 1, 2, N'FullTime', N'Male', CAST(2000.00 AS Decimal(16, 2)), CAST(3000.00 AS Decimal(16, 2)), N'yjnyuh,lkjil', N'Active')
INSERT [dbo].[JobPost] ([Id], [RecruiterId], [JobTitle], [CompanyId], [DepartmentId], [DesignationId], [JobType], [ApplicableToSex], [MinSalary], [MaxSalary], [JobDescription], [Status]) VALUES (5, 1, N'nhjubnjhujkyh', 1, 1, 2, N'FullTime', N'Male', CAST(2000.00 AS Decimal(16, 2)), CAST(3000.00 AS Decimal(16, 2)), N'yjnyuh,lkjil', N'Active')
INSERT [dbo].[JobPost] ([Id], [RecruiterId], [JobTitle], [CompanyId], [DepartmentId], [DesignationId], [JobType], [ApplicableToSex], [MinSalary], [MaxSalary], [JobDescription], [Status]) VALUES (6, 1, N'nhjubnjhujkyhjuk,ujlikijo', 1, 1, 2, N'FullTime', N'Male', CAST(2000.00 AS Decimal(16, 2)), CAST(3000.00 AS Decimal(16, 2)), N'yjnyuh,lkjil', N'Active')
INSERT [dbo].[JobPost] ([Id], [RecruiterId], [JobTitle], [CompanyId], [DepartmentId], [DesignationId], [JobType], [ApplicableToSex], [MinSalary], [MaxSalary], [JobDescription], [Status]) VALUES (7, 1, N'nhjubnjhujkyhjuk,ujlikijohjuikhju', 1, 1, 2, N'FullTime', N'Male', CAST(2000.00 AS Decimal(16, 2)), CAST(3000.00 AS Decimal(16, 2)), N'yjnyuh,lkjil', N'Active')
SET IDENTITY_INSERT [dbo].[JobPost] OFF
SET IDENTITY_INSERT [dbo].[JobPost_Branches] ON 

INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (1, 1, 1)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (2, 1, 2)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (3, 2, 1)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (4, 2, 2)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (5, 3, 1)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (6, 3, 2)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (7, 4, 1)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (8, 4, 2)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (9, 5, 1)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (10, 5, 2)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (11, 6, 1)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (12, 6, 2)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (13, 7, 1)
INSERT [dbo].[JobPost_Branches] ([Id], [JobPostId], [BranchId]) VALUES (14, 7, 2)
SET IDENTITY_INSERT [dbo].[JobPost_Branches] OFF
SET IDENTITY_INSERT [dbo].[JobPost_InterviewProcess] ON 

INSERT [dbo].[JobPost_InterviewProcess] ([Id], [JobPostId], [AptitudeTest], [NumberOfAptitudeTests], [GroupDiscussion], [NumberOfGDs], [TechnicalRound], [NumberOfTechnicalRounds], [PersonalInterview], [NumberOfPersonalInterviews]) VALUES (1, 7, N'Yes', 2, N'No', 2, N'No', 1, N'No', 2)
SET IDENTITY_INSERT [dbo].[JobPost_InterviewProcess] OFF
SET IDENTITY_INSERT [dbo].[JobPost_Question] ON 

INSERT [dbo].[JobPost_Question] ([Id], [JobPostId], [Date], [QuestionName], [Status]) VALUES (1, 7, CAST(0x0000AA1200A688D0 AS DateTime), N'demo', N'Active')
INSERT [dbo].[JobPost_Question] ([Id], [JobPostId], [Date], [QuestionName], [Status]) VALUES (2, 7, CAST(0x0000AA140097818C AS DateTime), N'new question', N'Active')
INSERT [dbo].[JobPost_Question] ([Id], [JobPostId], [Date], [QuestionName], [Status]) VALUES (3, 7, CAST(0x0000AA140097D970 AS DateTime), N'cfbhghgvnj', N'Active')
SET IDENTITY_INSERT [dbo].[JobPost_Question] OFF
SET IDENTITY_INSERT [dbo].[JobPost_Requirement] ON 

INSERT [dbo].[JobPost_Requirement] ([Id], [JobPostId], [RequiredEducationId], [RequiredExperience]) VALUES (1, 1, 1, 2)
INSERT [dbo].[JobPost_Requirement] ([Id], [JobPostId], [RequiredEducationId], [RequiredExperience]) VALUES (2, 2, 1, 2)
INSERT [dbo].[JobPost_Requirement] ([Id], [JobPostId], [RequiredEducationId], [RequiredExperience]) VALUES (3, 3, 1, 2)
INSERT [dbo].[JobPost_Requirement] ([Id], [JobPostId], [RequiredEducationId], [RequiredExperience]) VALUES (4, 4, 1, 1)
INSERT [dbo].[JobPost_Requirement] ([Id], [JobPostId], [RequiredEducationId], [RequiredExperience]) VALUES (5, 5, 1, 1)
INSERT [dbo].[JobPost_Requirement] ([Id], [JobPostId], [RequiredEducationId], [RequiredExperience]) VALUES (6, 6, 1, 1)
INSERT [dbo].[JobPost_Requirement] ([Id], [JobPostId], [RequiredEducationId], [RequiredExperience]) VALUES (7, 7, 1, 1)
SET IDENTITY_INSERT [dbo].[JobPost_Requirement] OFF
SET IDENTITY_INSERT [dbo].[JobPost_Save] ON 

INSERT [dbo].[JobPost_Save] ([Id], [JobSeekerId], [JobPostId]) VALUES (2, 1, 1)
INSERT [dbo].[JobPost_Save] ([Id], [JobSeekerId], [JobPostId]) VALUES (3, 1, 3)
SET IDENTITY_INSERT [dbo].[JobPost_Save] OFF
SET IDENTITY_INSERT [dbo].[JobPost_Skills] ON 

INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (1, 1, 2)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (2, 1, 3)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (3, 1, 4)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (4, 1, 7)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (5, 2, 2)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (6, 2, 3)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (7, 2, 4)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (8, 2, 7)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (9, 3, 2)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (10, 3, 3)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (11, 3, 4)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (12, 3, 7)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (13, 4, 2)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (14, 4, 3)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (15, 4, 4)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (16, 5, 2)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (17, 5, 3)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (18, 5, 4)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (19, 6, 2)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (20, 6, 3)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (21, 6, 4)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (22, 7, 2)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (26, 7, 4)
INSERT [dbo].[JobPost_Skills] ([Id], [JobPostId], [SkillId]) VALUES (28, 7, 6)
SET IDENTITY_INSERT [dbo].[JobPost_Skills] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [TitleId], [FirstName], [LastName], [EmailId], [Password], [Role], [Status], [EnableEmail]) VALUES (1, 1, N'Mustafa', N'Pinjari', N'pinjari@gmail.com', N'123', N'JobSeeker', N'Active', 1)
INSERT [dbo].[Person] ([Id], [TitleId], [FirstName], [LastName], [EmailId], [Password], [Role], [Status], [EnableEmail]) VALUES (2, 1, N'Mustafa', N'Pinjari', N'pinjarimustafa27@gmail.com', N'456', N'Recruiter', N'Active', 1)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [Date], [QuestionName], [RelatedTo], [CompanyId]) VALUES (1, CAST(0x0000AA1D0092C4A8 AS DateTime), N'Demo Question', N'Company', 1)
INSERT [dbo].[Question] ([Id], [Date], [QuestionName], [RelatedTo], [CompanyId]) VALUES (2, CAST(0x0000AA1D00AA0BA4 AS DateTime), N'fjnghkmhju,kj', N'Company', 1)
INSERT [dbo].[Question] ([Id], [Date], [QuestionName], [RelatedTo], [CompanyId]) VALUES (3, CAST(0x0000AA1D00AB4DE8 AS DateTime), N'my new Question', N'Company', 1)
INSERT [dbo].[Question] ([Id], [Date], [QuestionName], [RelatedTo], [CompanyId]) VALUES (4, CAST(0x0000AA1D00AB9C6C AS DateTime), N'dhfgjnyhgfmghm', N'Company', 1)
INSERT [dbo].[Question] ([Id], [Date], [QuestionName], [RelatedTo], [CompanyId]) VALUES (5, CAST(0x0000AA1D00ABFDB0 AS DateTime), N'hnj,khj,kjm', N'Company', 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[Question_Answer] ON 

INSERT [dbo].[Question_Answer] ([Id], [QuestionId], [Answer]) VALUES (1, 1, N'bvghvkjjkjnjjnjkljl')
INSERT [dbo].[Question_Answer] ([Id], [QuestionId], [Answer]) VALUES (2, 2, N'm,nj,nmj?')
SET IDENTITY_INSERT [dbo].[Question_Answer] OFF
SET IDENTITY_INSERT [dbo].[Recruiter_Company] ON 

INSERT [dbo].[Recruiter_Company] ([Id], [PersonId], [CompanyId]) VALUES (1, 2, 1)
INSERT [dbo].[Recruiter_Company] ([Id], [PersonId], [CompanyId]) VALUES (2, 2, 1)
SET IDENTITY_INSERT [dbo].[Recruiter_Company] OFF
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([Id], [SkillTypeId], [SkillName], [Status]) VALUES (1, 1, N'Presentation', N'Active')
INSERT [dbo].[Skills] ([Id], [SkillTypeId], [SkillName], [Status]) VALUES (2, 2, N'Java', N'Active')
INSERT [dbo].[Skills] ([Id], [SkillTypeId], [SkillName], [Status]) VALUES (3, 2, N'Asp .net', N'Active')
INSERT [dbo].[Skills] ([Id], [SkillTypeId], [SkillName], [Status]) VALUES (4, 2, N'C', N'Active')
INSERT [dbo].[Skills] ([Id], [SkillTypeId], [SkillName], [Status]) VALUES (5, 2, N'C++', N'Active')
INSERT [dbo].[Skills] ([Id], [SkillTypeId], [SkillName], [Status]) VALUES (6, 2, N'Python', N'Active')
INSERT [dbo].[Skills] ([Id], [SkillTypeId], [SkillName], [Status]) VALUES (7, 2, N'Java Script', N'Active')
SET IDENTITY_INSERT [dbo].[Skills] OFF
SET IDENTITY_INSERT [dbo].[SkillType] ON 

INSERT [dbo].[SkillType] ([Id], [SkillTypeName], [Status]) VALUES (1, N'Soft Skill', N'Active')
INSERT [dbo].[SkillType] ([Id], [SkillTypeName], [Status]) VALUES (2, N'Programming Skills', N'Active')
INSERT [dbo].[SkillType] ([Id], [SkillTypeName], [Status]) VALUES (3, N'Leadership', N'Active')
INSERT [dbo].[SkillType] ([Id], [SkillTypeName], [Status]) VALUES (4, N'Communication Skills', N'Active')
INSERT [dbo].[SkillType] ([Id], [SkillTypeName], [Status]) VALUES (5, N'Demo', N'Active')
SET IDENTITY_INSERT [dbo].[SkillType] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([Id], [StateName], [CountryId], [Status]) VALUES (1, N'Delhi', 1, N'Active')
INSERT [dbo].[State] ([Id], [StateName], [CountryId], [Status]) VALUES (2, N'California', 2, N'Active')
INSERT [dbo].[State] ([Id], [StateName], [CountryId], [Status]) VALUES (3, N'Maharashtra', 1, N'Active')
INSERT [dbo].[State] ([Id], [StateName], [CountryId], [Status]) VALUES (4, N'Kerla', 1, N'Active')
INSERT [dbo].[State] ([Id], [StateName], [CountryId], [Status]) VALUES (5, N'Punjab', 1, N'Active')
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[Title] ON 

INSERT [dbo].[Title] ([Id], [TitleName], [ApplicableToGender], [Status]) VALUES (1, N'Mr.', N'Male', N'Active')
INSERT [dbo].[Title] ([Id], [TitleName], [ApplicableToGender], [Status]) VALUES (2, N'Mrs.', N'Female', N'Active')
INSERT [dbo].[Title] ([Id], [TitleName], [ApplicableToGender], [Status]) VALUES (4, N'Mx.', N'Other', N'Active')
SET IDENTITY_INSERT [dbo].[Title] OFF
USE [master]
GO
ALTER DATABASE [MyJobPortal] SET  READ_WRITE 
GO
