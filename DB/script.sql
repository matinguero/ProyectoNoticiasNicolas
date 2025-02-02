USE [master]
GO
/****** Object:  Database [ProyectoNoticiasNicolas]    Script Date: 8/25/2023 7:18:20 PM ******/
CREATE DATABASE [ProyectoNoticiasNicolas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoNoticiasNicolas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProyectoNoticiasNicolas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoNoticiasNicolas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProyectoNoticiasNicolas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoNoticiasNicolas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET QUERY_STORE = OFF
GO
USE [ProyectoNoticiasNicolas]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [varchar](50) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Noticias]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Noticias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NULL,
	[Copete] [varchar](50) NULL,
	[Texto] [varchar](50) NULL,
	[activo] [int] NULL,
	[categoria_id] [int] NULL,
	[fecha] [datetime] NULL,
	[imagen] [varchar](500) NULL,
 CONSTRAINT [PK_Noticias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Perfil] [varchar](50) NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[perfil_id] [int] NULL,
	[FechaAlta] [datetime] NULL,
	[Clave] [varchar](50) NULL,
	[email] [varchar](150) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Noticias]  WITH CHECK ADD  CONSTRAINT [FK_Noticias_Categorias] FOREIGN KEY([categoria_id])
REFERENCES [dbo].[Categorias] ([id])
GO
ALTER TABLE [dbo].[Noticias] CHECK CONSTRAINT [FK_Noticias_Categorias]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Perfiles] FOREIGN KEY([perfil_id])
REFERENCES [dbo].[Perfiles] ([id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Perfiles]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarUsuario]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarUsuario]
	
    -- Insert statements for procedure here
	@id as int,
	@email as varchar(100),
    @clave as varchar(100),
    @nombre as varchar(100),
    @apellido as varchar(100),
   
    @perfil_id as int


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Usuarios]
	SET 
	[email] = @email
           ,[clave] = @clave
           ,[Nombre] = @nombre
           ,[Apellido] = @apellido
           ,[FechaAlta] = GETDATE()
           ,[perfil_id] = @perfil_id
     where
	 id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarusuariosinpass]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarusuariosinpass]
@id as int,
	@email as varchar(100),
    @nombre as varchar(100),
    @apellido as varchar(100),
    @perfil_id as int
AS
BEGIN
	
	SET NOCOUNT ON;
UPDATE [dbo].[Usuarios]
	SET 
	[email] = @email
           ,[Nombre] = @nombre
           ,[Apellido] = @apellido
           ,[FechaAlta] = getdate()
           ,[perfil_id] = @perfil_id
     where
	 id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarNoticia]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEliminarNoticia] 
	-- Add the parameters for the stored procedure here
	@id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Delete from Noticias 
	where id = @id

END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarUsuario]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEliminarUsuario] 
	-- Add the parameters for the stored procedure here
	@id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from usuarios where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarNoticia]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertarNoticia]
	-- Add the parameters for the stored procedure here
	@Titulo as varchar(100),
	@copete as varchar(200),
	@Texto as text,
	@activo as int,
	@categoria_id as int,
	@fecha as datetime,
	@imagen as varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert Into Noticias
	(titulo, copete, texto, imagen,activo, categoria_id, fecha)
	Values
	(@Titulo, @copete, @Texto, @imagen, @activo, @categoria_id, getdate())




END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarUsuario]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertarUsuario]
	-- Add the parameters for the stored procedure here
	  @email as varchar (50) , @clave as varchar (20), @nombre as varchar (30), @apellido as varchar (30) ,@fecha as datetime, @perfil_id as int


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Usuarios
    (email, clave, nombre,apellido,fechaAlta,perfil_id)
    values
    (@email, @clave, @nombre,@apellido,GETDATE(),@perfil_id)
END
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spLogin] 
	-- Add the parameters for the stored procedure here
	@usuario as varchar(50),
	@clave as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select Usuarios.*, perfiles.perfil from Usuarios
	inner join Perfiles
	on Usuarios.perfil_id = Perfiles.id

	Where

	(Usuarios.email = @usuario AND Usuarios.clave = @Clave)
END
GO
/****** Object:  StoredProcedure [dbo].[spModificarNoticia]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spModificarNoticia] 
	-- Add the parameters for the stored procedure here
	@Titulo as varchar(100),
	@copete as varchar(200),
	@Texto as text,
	@activo as int,
	@categoria_id as int,
	@fecha as datetime,
	@id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Update Noticias
	Set
	titulo = @Titulo,
	copete = @copete,
	texto = @texto,
	activo = @activo,
	categoria_id = @categoria_id,
	fecha = getdate()

	Where id = @id

END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerNoticia]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spObtenerNoticia]
	-- Add the parameters for the stored procedure here
	@id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select Noticias.[id] ,[Titulo] ,[Copete],[Texto],[Imagen] ,[Activo] ,[categoria_id],[fecha], Categorias.Categoria
	from Noticias 

	inner join Categorias 
	on Categorias.id = Noticias.categoria_id

	where
	 Noticias.id = @id

	


END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerNoticias]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spObtenerNoticias]
	-- Add the parameters for the stored procedure here
	@activo int,
	@categoria_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Select Noticias.[id] ,[Titulo] ,[Copete],[Texto],[Imagen] ,[Activo] ,[categoria_id],[fecha], Categorias.Categoria
	from Noticias 

	inner join Categorias 
	on Categorias.id = Noticias.categoria_id

	where
	(@activo = -1 or activo = @activo)
	AND
	(@categoria_id = -1 or categoria_id = @categoria_id)

	Order by id desc


END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPerfiles]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spObtenerPerfiles]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 SELECT id , Perfil
    from Perfiles
    order by Perfil
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerTodasLasCategorias]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spObtenerTodasLasCategorias] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  [id]
      ,[Categoria]
  FROM [dbo].[Categorias]
  Order by Categoria asc
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuario]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spObtenerUsuario] 
	-- Add the parameters for the stored procedure here
	@id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Usuarios.id ,email,nombre,apellido,clave,fechaAlta, perfil_id , Perfiles.Perfil from Usuarios
    inner join    Perfiles
    on Perfiles.id = Usuarios.perfil_id
    where Usuarios.id = @id
    order by id asc
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios]    Script Date: 8/25/2023 7:18:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerUsuarios] 
	-- Add the parameters for the stored procedure here
	@perfil_id as int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select Usuarios.*, Perfiles.Perfil from usuarios 
	inner join perfiles on usuarios.perfil_id = Perfiles.id
	
	where 
	
	
	(@perfil_id = -1 or perfil_id = @perfil_id)
	Order by id desc
END
GO
USE [master]
GO
ALTER DATABASE [ProyectoNoticiasNicolas] SET  READ_WRITE 
GO
