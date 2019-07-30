USE master;
GO

IF EXISTS
(
    SELECT name
      FROM sys.databases
     WHERE name = 'DFNB2'
)
    BEGIN
        ALTER DATABASE DFNB2 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
        DROP DATABASE DFNB2;
END;

CREATE DATABASE DFNB2;
GO



USE [master]
GO
/****** Object:  Database [DFNB2]    Script Date: 7/29/2019 3:09:43 PM ******/
CREATE DATABASE [DFNB2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DFNB2', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\DFNB2.mdf' , SIZE = 1324032KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DFNB2_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\DFNB2_log.ldf' , SIZE = 1437888KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DFNB2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DFNB2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DFNB2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DFNB2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DFNB2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DFNB2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DFNB2] SET ARITHABORT OFF 
GO
ALTER DATABASE [DFNB2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DFNB2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DFNB2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DFNB2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DFNB2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DFNB2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DFNB2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DFNB2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DFNB2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DFNB2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DFNB2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DFNB2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DFNB2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DFNB2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DFNB2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DFNB2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DFNB2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DFNB2] SET RECOVERY FULL 
GO
ALTER DATABASE [DFNB2] SET  MULTI_USER 
GO
ALTER DATABASE [DFNB2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DFNB2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DFNB2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DFNB2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DFNB2', N'ON'
GO
USE [DFNB2]
GO
/****** Object:  Table [dbo].[stg_p1]    Script Date: 7/29/2019 3:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_p1](
	[acct_id] [int] NOT NULL,
	[cust_id] [smallint] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL,
	[acct_id2] [int] NOT NULL,
	[prod_id] [smallint] NOT NULL,
	[open_date] [date] NOT NULL,
	[close_date] [date] NOT NULL,
	[open_close_code] [varchar](1) NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[acct_rel_id] [smallint] NOT NULL,
	[pri_cust_id] [smallint] NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
	[acct_branch_id] [smallint] NOT NULL,
	[acct_branch_code] [varchar](5) NOT NULL,
	[acct_branch_desc] [varchar](100) NOT NULL,
	[acct_region_id] [int] NOT NULL,
	[acct_area_id] [int] NOT NULL,
	[acct_branch_lat] [decimal](16, 12) NOT NULL,
	[acct_branch_lon] [decimal](16, 12) NOT NULL,
	[acct_branch_add_id] [int] NOT NULL,
	[acct_branch_add_lat] [decimal](16, 12) NOT NULL,
	[acct_branch_add_lon] [decimal](16, 12) NOT NULL,
	[acct_branch_add_type] [varchar](1) NOT NULL,
	[cust_id2] [smallint] NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[birth_date] [date] NOT NULL,
	[cust_since_date] [date] NOT NULL,
	[pri_branch_id] [smallint] NOT NULL,
	[cust_pri_branch_dist] [decimal](7, 2) NOT NULL,
	[cust_lat] [decimal](16, 12) NOT NULL,
	[cust_lon] [decimal](16, 12) NOT NULL,
	[cust_rel_id] [smallint] NOT NULL,
	[cust_add_id] [int] NOT NULL,
	[cust_add_lat] [decimal](16, 12) NOT NULL,
	[cust_add_lon] [decimal](16, 12) NOT NULL,
	[cust_add_type] [varchar](1) NOT NULL,
	[as_of_date] [date] NOT NULL,
	[acct_id3] [int] NOT NULL,
	[cur_bal] [decimal](20, 4) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_p2]    Script Date: 7/29/2019 3:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_p2](
	[branch_id] [smallint] NOT NULL,
	[acct_id] [int] NOT NULL,
	[tran_date] [date] NOT NULL,
	[tran_time] [time](7) NOT NULL,
	[tran_type_id] [smallint] NOT NULL,
	[tran_type_code] [varchar](5) NOT NULL,
	[tran_type_desc] [varchar](100) NOT NULL,
	[tran_fee_prct] [decimal](4, 3) NOT NULL,
	[cur_cust_req_ind] [varchar](1) NOT NULL,
	[tran_amt] [int] NOT NULL,
	[tran_fee_amt] [decimal](15, 3) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [DFNB2] SET  READ_WRITE 
GO
