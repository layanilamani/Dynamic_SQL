﻿USE [master]
GO
/****** Object:  Database [mytemp]    Script Date: 7/17/2018 10:15:58 AM ******/
CREATE DATABASE [mytemp]
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
