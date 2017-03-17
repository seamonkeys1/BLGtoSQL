USE [master]
GO
CREATE DATABASE [PerfmonImport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PerfmonImport', FILENAME = N'G:\Data\PerfmonImport.mdf' , SIZE = 655360KB , MAXSIZE = UNLIMITED, FILEGROWTH = 131072KB )
 LOG ON 
( NAME = N'PerfmonImport_log', FILENAME = N'L:\Log\PerfmonImport_log.ldf' , SIZE = 65536KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PerfmonImport] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [PerfmonImport] SET READ_COMMITTED_SNAPSHOT ON 
GO
USE [PerfmonImport]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfmonImport](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ServerName] [varchar](50) NULL,
	[DateTimeStamp] [datetime] NULL,
	[CounterInstance] [nvarchar](200) NULL,
	[CounterValue] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfmonImportStage](
	[ServerName] [varchar](50) NULL,
	[DateTimeStamp] [datetime] NULL,
	[CounterInstance] [nvarchar](200) NULL,
	[CounterValue] [float] NULL
) ON [PRIMARY]

GO
CREATE CLUSTERED COLUMNSTORE INDEX [cci_PerfmonImport] ON [dbo].[PerfmonImport] WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [PerfmonImport] SET READ_WRITE 
GO
