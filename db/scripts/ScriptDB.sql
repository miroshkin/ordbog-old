USE [master]
GO
/****** Object:  Database [ordbog]    Script Date: 15.10.2018 16:59:18 ******/
CREATE DATABASE [ordbog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ordbog', FILENAME = N'c:\databases\ordbog\ordbog.mdf' , SIZE = 3584KB , MAXSIZE = 20971520KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'ordbog_log', FILENAME = N'c:\databases\ordbog\ordbog_log.ldf' , SIZE = 112384KB , MAXSIZE = 1048576KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ordbog] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ordbog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ordbog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ordbog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ordbog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ordbog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ordbog] SET ARITHABORT OFF 
GO
ALTER DATABASE [ordbog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ordbog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ordbog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ordbog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ordbog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ordbog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ordbog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ordbog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ordbog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ordbog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ordbog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ordbog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ordbog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ordbog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ordbog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ordbog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ordbog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ordbog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ordbog] SET  MULTI_USER 
GO
ALTER DATABASE [ordbog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ordbog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ordbog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ordbog] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ordbog] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ordbog', N'ON'
GO
ALTER DATABASE [ordbog] SET QUERY_STORE = OFF
GO
USE [ordbog]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ordbog]
GO
/****** Object:  User [GEAR\Domain Admins]    Script Date: 15.10.2018 16:59:23 ******/
CREATE USER [GEAR\Domain Admins] FOR LOGIN [GEAR\Domain Admins]
GO
/****** Object:  Table [dbo].[Translations]    Script Date: 15.10.2018 16:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translations](
	[TranslationId] [int] IDENTITY(1,1) NOT NULL,
	[Translation] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Translations] PRIMARY KEY CLUSTERED 
(
	[TranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Words]    Script Date: 15.10.2018 16:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[WordId] [int] IDENTITY(1,1) NOT NULL,
	[Word] [nvarchar](100) NOT NULL,
	[Transcription] [nvarchar](100) NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WordTranslationLinks]    Script Date: 15.10.2018 16:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordTranslationLinks](
	[WordTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[WordId] [int] NOT NULL,
	[TranslationId] [int] NOT NULL,
 CONSTRAINT [PK_WordTranslationLinks] PRIMARY KEY CLUSTERED 
(
	[WordTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Translations] ON 

INSERT [dbo].[Translations] ([TranslationId], [Translation]) VALUES (1, N'книга')
INSERT [dbo].[Translations] ([TranslationId], [Translation]) VALUES (2, N'словарь')
INSERT [dbo].[Translations] ([TranslationId], [Translation]) VALUES (3, N'мальчик')
INSERT [dbo].[Translations] ([TranslationId], [Translation]) VALUES (4, N'drenge')
INSERT [dbo].[Translations] ([TranslationId], [Translation]) VALUES (5, N'синий')
INSERT [dbo].[Translations] ([TranslationId], [Translation]) VALUES (6, N'blu')
SET IDENTITY_INSERT [dbo].[Translations] OFF
SET IDENTITY_INSERT [dbo].[Words] ON 

INSERT [dbo].[Words] ([WordId], [Word], [Transcription]) VALUES (1, N'ordbog', N'')
INSERT [dbo].[Words] ([WordId], [Word], [Transcription]) VALUES (3, N'bog', N'bɔˀw')
INSERT [dbo].[Words] ([WordId], [Word], [Transcription]) VALUES (4, N'drenge', N'ˈdʁaŋˀ')
INSERT [dbo].[Words] ([WordId], [Word], [Transcription]) VALUES (5, N'мальчик', NULL)
INSERT [dbo].[Words] ([WordId], [Word], [Transcription]) VALUES (6, N'blå', N'ˈblɔˀ')
INSERT [dbo].[Words] ([WordId], [Word], [Transcription]) VALUES (7, N'синий', NULL)
SET IDENTITY_INSERT [dbo].[Words] OFF
SET IDENTITY_INSERT [dbo].[WordTranslationLinks] ON 

INSERT [dbo].[WordTranslationLinks] ([WordTranslationId], [WordId], [TranslationId]) VALUES (1, 1, 2)
INSERT [dbo].[WordTranslationLinks] ([WordTranslationId], [WordId], [TranslationId]) VALUES (2, 3, 1)
INSERT [dbo].[WordTranslationLinks] ([WordTranslationId], [WordId], [TranslationId]) VALUES (3, 4, 3)
INSERT [dbo].[WordTranslationLinks] ([WordTranslationId], [WordId], [TranslationId]) VALUES (4, 5, 4)
INSERT [dbo].[WordTranslationLinks] ([WordTranslationId], [WordId], [TranslationId]) VALUES (5, 6, 5)
INSERT [dbo].[WordTranslationLinks] ([WordTranslationId], [WordId], [TranslationId]) VALUES (6, 7, 6)
SET IDENTITY_INSERT [dbo].[WordTranslationLinks] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [WordIndex]    Script Date: 15.10.2018 16:59:27 ******/
CREATE NONCLUSTERED INDEX [WordIndex] ON [dbo].[Words]
(
	[Word] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[pWords_Insert]    Script Date: 15.10.2018 16:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		anton.miroshkin@gmail.com
-- Create date: 20180606
-- Description:	Inserts a new word to dictionary
-- =============================================
CREATE PROCEDURE [dbo].[pWords_Insert]
	@Word NVARCHAR(100),
	@Translation NVARCHAR(200),
	@Transcription NVARCHAR(100) = NULL
AS
BEGIN
	--===========================================================
	-- EXEC pWord_Insert N'blu', N'синий', N'ˈbluˀ'
	--===========================================================

	SET NOCOUNT ON;

	DECLARE @WordId INT
	DECLARE @TranslationId INT

	INSERT INTO Words (Word, Transcription) VALUES (@Word, @Transcription)
	SET @WordId = SCOPE_IDENTITY()

	INSERT INTO Translations (Translation) VALUES (@Translation)
	SET @TranslationId = SCOPE_IDENTITY()

	INSERT INTO WordTranslationLinks (WordId, TranslationId) VALUES (@WordId, @TranslationId)

END
GO
/****** Object:  StoredProcedure [dbo].[pWords_Search]    Script Date: 15.10.2018 16:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		anton.miroshkin@gmail.com
-- Create date: 20180606
-- Description:	Searches a word in the dictionary
-- =============================================
CREATE PROCEDURE [dbo].[pWords_Search] 
	-- Add the parameters for the stored procedure here
	@Word NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

	--=====================================================
	-- EXEC pWords_Search N'bog'
	--=====================================================


    SELECT w.Word,w.Transcription,t.Translation 
	FROM Words w 
	INNER JOIN WordTranslationLinks wtl WITH(NOLOCK) 
		ON wtl.WordId = w.WordId
	INNER JOIN Translations t WITH(NOLOCK) 
		ON t.TranslationId = wtl.TranslationId
	WHERE w.Word like '%' + @Word + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[pWords_SelectAll]    Script Date: 15.10.2018 16:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		anton.miroshkin@gmail.com
-- Create date: 20180606
-- Description:	Selects all words in dictionary
-- =============================================
CREATE PROCEDURE [dbo].[pWords_SelectAll]
	
AS
BEGIN
	SET NOCOUNT ON;
	--==========================================================
	-- EXEC pWords_SelectAll
	--==========================================================

	SELECT w.Word,w.Transcription,t.Translation 
	FROM Words w 
	INNER JOIN WordTranslationLinks wtl WITH(NOLOCK) 
		ON wtl.WordId = w.WordId
	INNER JOIN Translations t WITH(NOLOCK) 
		ON t.TranslationId = wtl.TranslationId
END
GO
USE [master]
GO
ALTER DATABASE [ordbog] SET  READ_WRITE 
GO
