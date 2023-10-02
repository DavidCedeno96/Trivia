USE [TriviaCMI_db]
GO
/****** Object:  Table [dbo].[ModoJuego]    Script Date: 29/09/2023 18:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModoJuego](
	[idModoJuego] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](15) NOT NULL,
	[imagen] [varchar](50) NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idModoJuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opcion]    Script Date: 29/09/2023 18:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opcion](
	[idOpcion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[correcta] [int] NOT NULL,
	[idPregunta] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idOpcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 29/09/2023 18:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[idSala] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 29/09/2023 18:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sala]    Script Date: 29/09/2023 18:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sala](
	[idSala] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[imagen] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
	[idModoJuego] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idSala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 29/09/2023 18:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](15) NOT NULL,
	[apellido] [varchar](15) NULL,
	[correo] [varchar](40) NOT NULL,
	[clave] [varchar](30) NOT NULL,
	[foto] [varchar](50) NULL,
	[idRol] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Sala]    Script Date: 29/09/2023 18:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Sala](
	[idUsuario] [int] NOT NULL,
	[idSala] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([idRol], [nombre], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'Administrador', 1, CAST(N'2023-09-28T12:27:31.850' AS DateTime), CAST(N'2023-09-28T12:27:31.850' AS DateTime))
GO
INSERT [dbo].[Rol] ([idRol], [nombre], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (2, N'Jugador', 1, CAST(N'2023-09-28T12:27:31.850' AS DateTime), CAST(N'2023-09-28T12:27:31.850' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'Byron', N'Cedeño', N'david@gmail.com', N'admin', N'mifoto.jpg', 1, 1, CAST(N'2023-09-28T12:39:47.910' AS DateTime), CAST(N'2023-09-28T12:39:47.910' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (5, N'Byron', N'Cedeño', N'david1@gmail.com', N'admin', NULL, 1, 1, CAST(N'2023-09-28T12:55:06.670' AS DateTime), CAST(N'2023-09-28T12:55:06.670' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (8, N'Byron', N'Cedeño', N'david3@gmail.com', N'admin', NULL, 1, 1, CAST(N'2023-09-28T13:06:11.933' AS DateTime), CAST(N'2023-09-28T13:06:11.933' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (9, N'David', N'Cedeño', N'david@correo.com', N'123', NULL, 2, 1, CAST(N'2023-09-28T14:16:10.590' AS DateTime), CAST(N'2023-09-28T14:16:10.590' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (23, N'juan_editsdawea', NULL, N'juan@edit.com', N'123450', NULL, 2, 1, CAST(N'2023-09-28T15:06:23.413' AS DateTime), CAST(N'2023-09-28T17:36:44.527' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (31, N'cc', N'dd', N'qwew', N'd', NULL, 2, 1, CAST(N'2023-09-28T15:39:10.457' AS DateTime), CAST(N'2023-09-28T15:39:10.457' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (33, N'Paulina', NULL, N'Gomez', N'123', NULL, 2, 1, CAST(N'2023-09-28T17:34:34.730' AS DateTime), CAST(N'2023-09-28T17:34:34.730' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (34, N'Benito', NULL, N'benito@correo.com', N'12345', NULL, 2, 1, CAST(N'2023-09-29T11:50:57.703' AS DateTime), CAST(N'2023-09-29T11:50:57.703' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (35, N'otro', NULL, N'ptor@correo.com', N'123456', NULL, 2, 1, CAST(N'2023-09-29T17:36:18.647' AS DateTime), CAST(N'2023-09-29T17:36:18.647' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuario__2A586E0B87670F85]    Script Date: 29/09/2023 18:11:22 ******/
ALTER TABLE [dbo].[Usuario] ADD UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModoJuego] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[ModoJuego] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[ModoJuego] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Opcion] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Opcion] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Opcion] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Pregunta] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Pregunta] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Pregunta] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Sala] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Sala] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Sala] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Usuario_Sala] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Usuario_Sala] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Usuario_Sala] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Opcion]  WITH CHECK ADD FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Pregunta] ([idPregunta])
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD FOREIGN KEY([idSala])
REFERENCES [dbo].[Sala] ([idSala])
GO
ALTER TABLE [dbo].[Sala]  WITH CHECK ADD FOREIGN KEY([idModoJuego])
REFERENCES [dbo].[ModoJuego] ([idModoJuego])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuario_Sala]  WITH CHECK ADD FOREIGN KEY([idSala])
REFERENCES [dbo].[Sala] ([idSala])
GO
ALTER TABLE [dbo].[Usuario_Sala]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
/****** Object:  StoredProcedure [dbo].[sp_B_Rol]    Script Date: 29/09/2023 18:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_Rol] 
	
	@estados int,
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	if(@estados > 0)
	begin 		
		Select * from Rol where estado > 0		
	end
	else
	begin
		Select * from Rol
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_Usuario]    Script Date: 29/09/2023 18:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_Usuario]	
	
	@estados int,
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	if(@estados > 0)
	begin
		Select 
		u.idUsuario,
		u.nombre,
		u.correo,
		u.clave,
		r.nombre as 'rol',
		u.estado,
		u.fecha_creacion,
		u.fecha_modificacion
		from Usuario u inner join Rol r
		on u.idRol = r.idRol
		where u.estado > 0
	end
	else
	begin 
		Select 
		u.idUsuario,
		u.nombre,
		u.correo,
		u.clave,
		r.nombre as 'rol',
		u.estado,
		u.fecha_creacion,
		u.fecha_modificacion
		from Usuario u inner join Rol r
		on u.idRol = r.idRol		
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_UsuarioLogin]    Script Date: 29/09/2023 18:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_UsuarioLogin]	
	
	@correo varchar(40),
	@clave varchar(30),

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	declare @contUsuario int = 0

	select @contUsuario = COUNT(*) from Usuario where correo = @correo and clave = @clave and estado > 0

	if(@contUsuario > 0)
	begin
		select u.idUsuario, u.nombre, u.correo, u.clave, r.nombre as 'rol'
		from Usuario u
		inner join Rol r
		on u.idRol = r.idRol
		where u.correo = @correo and u.clave = @clave and u.estado > 0	

		set @info = 'Usuario encontrado'
		set @error = 0
	end
	else
	begin
		set @info = 'Correo y contraseña incorreectos'
		set @error = 1
	end

	print @info
END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Usuario]    Script Date: 29/09/2023 18:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Usuario] 
	
	@nombre varchar(15),
	@apellido varchar(15) = null,
	@correo varchar(40),
	@clave varchar(30),
	@foto varchar(50) = null,
	@idRol int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;

	Declare @contCorreo int = 0
	Select @contCorreo = COUNT(*) from Usuario where correo = @correo

	if(@contCorreo > 0)
	begin 
		set @info = 'El correo electornico ya esta registrado'
		set @error = 1
	end	
	else
	begin
		
		BEGIN TRY  
			Insert into Usuario (nombre, apellido, correo, clave, foto, idRol) values
			(NULLIF(@nombre, ''),
			NULLIF(@apellido, ''),
			NULLIF(@correo, ''),
			NULLIF(@clave, ''),
			NULLIF(@foto, ''),
			@idRol);

			set @info = 'Registro creado satisfactoriamente'
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;				

	end

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_Usuario]    Script Date: 29/09/2023 18:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_Usuario] 
	
	@idUsuario int, 
	@nombre varchar(15),
	@apellido varchar(15) = null,
	@correo varchar(40),
	@clave varchar(30),
	@foto varchar(50) = null,
	@idRol int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;

	Declare @contCorreo int = 0
	Select @contCorreo = COUNT(*) from Usuario where correo = @correo and idUsuario <> @idUsuario

	if(@contCorreo > 0)
	begin 
		set @info = 'El correo electornico ya esta registrado'
		set @error = 1
	end	
	else
	begin
		
		BEGIN TRY  
			Update Usuario set 
			nombre = NULLIF(@nombre, ''),
			apellido = NULLIF(@apellido, ''),
			correo = NULLIF(@correo, ''),
			clave = NULLIF(@clave, ''),
			foto = NULLIF(@foto, ''),
			idRol = @idRol,
			fecha_modificacion = GETDATE()
			where idUsuario = @idUsuario

			set @info = 'Registro editado satisfactoriamente'
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;				

	end

	print @info

END
GO
