USE [empleados]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 15/10/2016 03:32:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Areas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Areas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AreasEmpleado]    Script Date: 15/10/2016 03:32:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AreasEmpleado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AreasEmpleado](
	[AreaId] [int] NOT NULL,
	[EmpleadoId] [int] NOT NULL,
 CONSTRAINT [PK_AreasEmpleado] PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC,
	[EmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 15/10/2016 03:32:47 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleados]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](32) NOT NULL,
	[SegundoNombre] [nvarchar](32) NULL,
	[ApellidoPaterno] [nvarchar](32) NOT NULL,
	[ApellidoMaterno] [nvarchar](32) NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Genero] [bit] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AreasEmpleado_Areas]') AND parent_object_id = OBJECT_ID(N'[dbo].[AreasEmpleado]'))
ALTER TABLE [dbo].[AreasEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_AreasEmpleado_Areas] FOREIGN KEY([AreaId])
REFERENCES [dbo].[Areas] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AreasEmpleado_Areas]') AND parent_object_id = OBJECT_ID(N'[dbo].[AreasEmpleado]'))
ALTER TABLE [dbo].[AreasEmpleado] CHECK CONSTRAINT [FK_AreasEmpleado_Areas]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AreasEmpleado_Empleados]') AND parent_object_id = OBJECT_ID(N'[dbo].[AreasEmpleado]'))
ALTER TABLE [dbo].[AreasEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_AreasEmpleado_Empleados] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[Empleados] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AreasEmpleado_Empleados]') AND parent_object_id = OBJECT_ID(N'[dbo].[AreasEmpleado]'))
ALTER TABLE [dbo].[AreasEmpleado] CHECK CONSTRAINT [FK_AreasEmpleado_Empleados]
GO
