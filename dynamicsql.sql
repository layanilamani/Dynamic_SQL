USE [master]
GO
/****** Object:  Database [mytemp]    Script Date: 7/17/2018 10:15:58 AM ******/
CREATE DATABASE [mytemp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mytemp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\mytemp.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mytemp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\mytemp_log.ldf' , SIZE = 528KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mytemp] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mytemp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mytemp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mytemp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mytemp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mytemp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mytemp] SET ARITHABORT OFF 
GO
ALTER DATABASE [mytemp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mytemp] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [mytemp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mytemp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mytemp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mytemp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mytemp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mytemp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mytemp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mytemp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mytemp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mytemp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mytemp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mytemp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mytemp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mytemp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mytemp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mytemp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mytemp] SET RECOVERY FULL 
GO
ALTER DATABASE [mytemp] SET  MULTI_USER 
GO
ALTER DATABASE [mytemp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mytemp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mytemp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mytemp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'mytemp', N'ON'
GO
USE [mytemp]
GO
/****** Object:  StoredProcedure [dbo].[SearchProperties]    Script Date: 7/17/2018 10:15:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--create database mytemp
--go

--use mytemp
--go


--create table MyProperty
--(
--	Name varchar(50),
--	Bed int,
--	Bath int
--)

--insert into MyProperty values('saima tower', 1,1)
--insert into MyProperty values('White Twin Towers', 1,2)
--insert into MyProperty values('Casablanka', 2,2)
--insert into MyProperty values('Supreme', 3,4)
--insert into MyProperty values('Hill tower', 3,6)

create proc [dbo].[SearchProperties] (@keyword as varchar(50),@bath as int,@bed as int) 

As
Begin

	Declare @query as nvarchar(max) = 'select * from MyProperty where '

	if @keyword != ''
		set @query += ' Name like ''%' + @keyword + '%'' and' 

	if @bed > 0
		set @query += ' bed=' + str(@bed)+' and'

	if @bath > 0
		set @query += ' bath=' + str(@bath)+' and'

	set @query += ' 1=1'

	print @query
	execute sp_executesql @query
End

GO
/****** Object:  Table [dbo].[MyProperty]    Script Date: 7/17/2018 10:15:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MyProperty](
	[Name] [varchar](50) NULL,
	[Bed] [int] NULL,
	[Bath] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MyProperty] ([Name], [Bed], [Bath]) VALUES (N'saima tower', 1, 1)
INSERT [dbo].[MyProperty] ([Name], [Bed], [Bath]) VALUES (N'White Twin Towers', 1, 2)
INSERT [dbo].[MyProperty] ([Name], [Bed], [Bath]) VALUES (N'Casablanka', 2, 2)
INSERT [dbo].[MyProperty] ([Name], [Bed], [Bath]) VALUES (N'Supreme', 3, 4)
INSERT [dbo].[MyProperty] ([Name], [Bed], [Bath]) VALUES (N'Hill tower', 3, 6)
USE [master]
GO
ALTER DATABASE [mytemp] SET  READ_WRITE 
GO
