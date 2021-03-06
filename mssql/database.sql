USE [master]
GO
/****** Object:  Database [todolist]    Script Date: 7/2/2022 2:44:04 PM ******/
CREATE DATABASE [todolist]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'todolist', FILENAME = N'/var/opt/mssql/data/todolist.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'todolist_log', FILENAME = N'/var/opt/mssql/data/todolist_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [todolist] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [todolist].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [todolist] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [todolist] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [todolist] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [todolist] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [todolist] SET ARITHABORT OFF 
GO
ALTER DATABASE [todolist] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [todolist] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [todolist] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [todolist] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [todolist] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [todolist] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [todolist] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [todolist] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [todolist] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [todolist] SET  DISABLE_BROKER 
GO
ALTER DATABASE [todolist] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [todolist] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [todolist] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [todolist] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [todolist] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [todolist] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [todolist] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [todolist] SET RECOVERY FULL 
GO
ALTER DATABASE [todolist] SET  MULTI_USER 
GO
ALTER DATABASE [todolist] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [todolist] SET DB_CHAINING OFF 
GO
ALTER DATABASE [todolist] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [todolist] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [todolist] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [todolist] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [todolist] SET QUERY_STORE = OFF
GO
USE [todolist]
GO
/****** Object:  Table [dbo].[tbl_category_list]    Script Date: 7/2/2022 2:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[fk_user] [int] NOT NULL,
 CONSTRAINT [PK_tbl_category_list] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_items]    Script Date: 7/2/2022 2:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[detail] [varchar](100) NOT NULL,
	[status] [char](1) NOT NULL,
	[fk_category_list] [int] NOT NULL,
 CONSTRAINT [PK_tbl_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_profile]    Script Date: 7/2/2022 2:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_profile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[fk_user] [int] NOT NULL,
 CONSTRAINT [PK_tbl_profile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 7/2/2022 2:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](80) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[token] [varchar](15) NOT NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_profile] ON 

INSERT [dbo].[tbl_profile] ([id], [firstName], [lastName], [dateOfBirth], [fk_user]) VALUES (2, N'var_firstName', N'var_lastName', CAST(N'2022-06-08' AS Date), 2)
SET IDENTITY_INSERT [dbo].[tbl_profile] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_user] ON 

INSERT [dbo].[tbl_user] ([id], [email], [password], [token]) VALUES (2, N'var_email', N'var_password', N'var_token')
SET IDENTITY_INSERT [dbo].[tbl_user] OFF
GO
ALTER TABLE [dbo].[tbl_category_list]  WITH CHECK ADD  CONSTRAINT [FK_tbl_category_list_tbl_user] FOREIGN KEY([fk_user])
REFERENCES [dbo].[tbl_user] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_category_list] CHECK CONSTRAINT [FK_tbl_category_list_tbl_user]
GO
ALTER TABLE [dbo].[tbl_items]  WITH CHECK ADD  CONSTRAINT [FK_tbl_items_tbl_category_list] FOREIGN KEY([fk_category_list])
REFERENCES [dbo].[tbl_category_list] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_items] CHECK CONSTRAINT [FK_tbl_items_tbl_category_list]
GO
ALTER TABLE [dbo].[tbl_profile]  WITH CHECK ADD  CONSTRAINT [FK_tbl_profile_tbl_user] FOREIGN KEY([fk_user])
REFERENCES [dbo].[tbl_user] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_profile] CHECK CONSTRAINT [FK_tbl_profile_tbl_user]
GO
/****** Object:  StoredProcedure [dbo].[proc_category_create]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_category_create](
        @id int,
        @name varchar(50)
    )
    AS
        INSERT INTO tbl_category_list (name, fk_user)
        VALUES (@name, @id)
GO
/****** Object:  StoredProcedure [dbo].[proc_category_delete]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_category_delete](
        @id int
    )
    AS
        DELETE FROM tbl_category_list
        WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[proc_category_select_by_id]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_category_select_by_id](
        @id int
    )
    AS
        SELECT * FROM tbl_category_list
        WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[proc_category_select_by_user_id]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_category_select_by_user_id](
        @id int
    )
    AS
        SELECT * FROM tbl_category_list
        WHERE fk_user = @id;
GO
/****** Object:  StoredProcedure [dbo].[proc_category_update]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_category_update](
        @id int,
        @name varchar(50)
    )
    AS
        UPDATE tbl_category_list SET 
            name = @name
        WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[proc_item_create]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_item_create](
        @id int,
        @title varchar(50),
        @detail varchar(100)
    )
    AS
        INSERT INTO tbl_items (title, detail, status, fk_category_list)
        VALUES (@title, @detail, 0, @id)
GO
/****** Object:  StoredProcedure [dbo].[proc_item_delete]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


    CREATE PROCEDURE [dbo].[proc_item_delete](
        @id int
    )
    AS
        DELETE FROM tbl_items 
        WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[proc_item_select_by_category_id]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_item_select_by_category_id](
        @id int
    )
    AS
        SELECT * FROM tbl_items 
        WHERE fk_category_list = @id;
GO
/****** Object:  StoredProcedure [dbo].[proc_item_select_by_id]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_item_select_by_id](
        @id INT
    )
    AS
        SELECT * FROM tbl_items 
        WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[proc_item_update]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_item_update](
        @id int,
        @title varchar(50),
        @detail varchar(100),
        @status char(1)
    )
    AS
        UPDATE tbl_items SET 
            title  = @title,
            detail = @detail,
            status = @status
        WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[proc_profile_by_id]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_profile_by_id](
        @id int
    )
    AS
        SELECT * FROM tbl_profile
        WHERE fk_user = @id;
GO
/****** Object:  StoredProcedure [dbo].[proc_user_by_email]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


    CREATE PROCEDURE [dbo].[proc_user_by_email](
        @email varchar(80)
    )
    AS
        SELECT * FROM tbl_user
        WHERE email = @email;
GO
/****** Object:  StoredProcedure [dbo].[proc_user_create]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_user_create](
        @email varchar(80),
        @password varchar(50),
        @token varchar(15),

        @firstName varchar(50),
        @lastName varchar(50),
        @dateOfBirth date
    )
    AS
        INSERT INTO tbl_user(email, password, token)
        VALUES (@email, @password, @token);

        INSERT INTO tbl_profile(firstName, lastName, dateOfBirth, fk_user)
        VALUES (@firstName, @lastName, @dateOfBirth, ( SELECT SCOPE_IDENTITY() ));
GO
/****** Object:  StoredProcedure [dbo].[proc_user_delete]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_user_delete](
        @id int
    )
    AS
        DELETE FROM tbl_user
        WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[proc_user_update]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_user_update](
        @id int,
        @firstName varchar(50),
        @lastName varchar(50),
        @dateOfBirth date
    )
    AS
        UPDATE tbl_profile SET 
            firstName   = @firstName,
            lastName    = @lastName,
            dateOfBirth = @dateOfBirth
        WHERE fk_user=@id;
GO
/****** Object:  StoredProcedure [dbo].[proc_user_update_pass]    Script Date: 7/2/2022 2:44:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[proc_user_update_pass](
        @id int,
        @password varchar(50),
        @token varchar(15)
    )
    AS
        UPDATE tbl_user SET 
            password = @password,
            token    = @token
        WHERE id = @id;
GO
USE [master]
GO
ALTER DATABASE [todolist] SET  READ_WRITE 
GO
