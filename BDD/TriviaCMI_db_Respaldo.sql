USE [TriviaCMI_db]
GO
/****** Object:  Table [dbo].[ModoJuego]    Script Date: 17/11/2023 10:29:03 ******/
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
/****** Object:  Table [dbo].[Opcion]    Script Date: 17/11/2023 10:29:03 ******/
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
/****** Object:  Table [dbo].[Pregunta]    Script Date: 17/11/2023 10:29:03 ******/
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
/****** Object:  Table [dbo].[pruebas]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pruebas](
	[id] [int] NULL,
	[texto] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 17/11/2023 10:29:03 ******/
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
/****** Object:  Table [dbo].[Sala]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sala](
	[idSala] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NULL,
	[imagen] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
	[idModoJuego] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[fecha_activacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idSala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaJuego]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaJuego](
	[idSala] [int] NULL,
	[idJugador] [int] NULL,
	[iniciales] [varchar](5) NULL,
	[posicion] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[estadoJuego] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaReciente]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaReciente](
	[idSala] [int] NULL,
	[idJugador] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[apellido] [varchar](15) NULL,
	[correo] [varchar](40) NULL,
	[clave] [varchar](20) NULL,
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
/****** Object:  Table [dbo].[Usuario_Sala]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Sala](
	[idUsuario] [int] NOT NULL,
	[idSala] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[puntaje] [int] NULL,
	[tiempo] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ModoJuego] ON 
GO
INSERT [dbo].[ModoJuego] ([idModoJuego], [nombre], [imagen], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'Challenger', N'img1.jpg', 1, CAST(N'2023-10-02T10:51:44.600' AS DateTime), CAST(N'2023-10-02T10:51:44.600' AS DateTime))
GO
INSERT [dbo].[ModoJuego] ([idModoJuego], [nombre], [imagen], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (2, N'Supervivencia', N'img2.jpg', 1, CAST(N'2023-10-02T10:51:44.600' AS DateTime), CAST(N'2023-10-02T10:51:44.600' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ModoJuego] OFF
GO
SET IDENTITY_INSERT [dbo].[Opcion] ON 
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (4, N'23 años', 0, 7, 1, CAST(N'2023-10-10T14:47:37.737' AS DateTime), CAST(N'2023-10-10T14:47:37.737' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (5, N'24 años', 0, 7, 1, CAST(N'2023-10-10T14:47:37.737' AS DateTime), CAST(N'2023-10-10T14:47:37.737' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (6, N'25 años', 0, 7, 1, CAST(N'2023-10-10T14:47:37.740' AS DateTime), CAST(N'2023-10-10T14:47:37.740' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (7, N'26 años', 1, 7, 1, CAST(N'2023-10-10T14:47:37.740' AS DateTime), CAST(N'2023-10-10T14:47:37.740' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (10, N'opcion1', 0, 8, 1, CAST(N'2023-10-10T17:05:59.860' AS DateTime), CAST(N'2023-10-10T17:05:59.860' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (11, N'opcion2', 1, 8, 1, CAST(N'2023-10-10T17:05:59.860' AS DateTime), CAST(N'2023-10-10T17:05:59.860' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (12, N'opcion3', 0, 8, 1, CAST(N'2023-10-10T17:05:59.860' AS DateTime), CAST(N'2023-10-10T17:05:59.860' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (13, N'no', 0, 9, 1, CAST(N'2023-10-10T17:47:08.270' AS DateTime), CAST(N'2023-10-10T17:47:08.270' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (14, N'si', 1, 9, 1, CAST(N'2023-10-10T17:47:08.270' AS DateTime), CAST(N'2023-10-10T17:47:08.270' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (15, N'talvez', 0, 9, 1, CAST(N'2023-10-10T17:47:08.270' AS DateTime), CAST(N'2023-10-10T17:47:08.270' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (31, N'es un framework', 1, 11, 1, CAST(N'2023-10-11T11:19:56.040' AS DateTime), CAST(N'2023-10-11T11:19:56.040' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (32, N'libreria', 0, 11, 1, CAST(N'2023-10-11T11:19:56.040' AS DateTime), CAST(N'2023-10-11T11:19:56.040' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (33, N'paquete', 0, 11, 1, CAST(N'2023-10-11T11:19:56.040' AS DateTime), CAST(N'2023-10-11T11:19:56.040' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (34, N'lenguaje', 0, 11, 1, CAST(N'2023-10-11T11:19:56.040' AS DateTime), CAST(N'2023-10-11T11:19:56.040' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (39, N'Viena', 0, 13, 1, CAST(N'2023-10-11T11:50:46.780' AS DateTime), CAST(N'2023-10-11T11:51:01.280' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (40, N'Praga', 1, 13, 1, CAST(N'2023-10-11T11:50:46.780' AS DateTime), CAST(N'2023-10-11T11:51:01.280' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (41, N'Budapest', 0, 13, 1, CAST(N'2023-10-11T11:50:46.780' AS DateTime), CAST(N'2023-10-11T11:51:01.280' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (42, N'Estambul', 0, 13, 1, CAST(N'2023-10-11T11:50:46.780' AS DateTime), CAST(N'2023-10-11T11:51:01.280' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (47, N'a', 1, 15, 1, CAST(N'2023-10-11T12:23:04.310' AS DateTime), CAST(N'2023-10-11T12:24:16.560' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (48, N'b', 0, 15, 1, CAST(N'2023-10-11T12:23:04.310' AS DateTime), CAST(N'2023-10-11T12:24:16.563' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (49, N'c', 0, 15, 1, CAST(N'2023-10-11T12:23:04.310' AS DateTime), CAST(N'2023-10-11T12:24:16.563' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (58, N'mi primera opcion edit', 1, 16, 1, CAST(N'2023-10-11T16:42:11.750' AS DateTime), CAST(N'2023-10-11T17:14:20.063' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (59, N'mi segunda opcion edit', 0, 16, 1, CAST(N'2023-10-11T16:42:11.750' AS DateTime), CAST(N'2023-10-11T17:14:20.063' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (63, N'mi tercera nueva opcion edit', 0, 16, 1, CAST(N'2023-10-11T17:12:51.887' AS DateTime), CAST(N'2023-10-11T17:14:20.063' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (74, N'hola1', 0, 21, 1, CAST(N'2023-10-12T11:19:14.220' AS DateTime), CAST(N'2023-10-12T11:19:14.220' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (75, N'hola2', 1, 21, 1, CAST(N'2023-10-12T11:19:14.220' AS DateTime), CAST(N'2023-10-12T11:19:14.220' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (76, N's', 0, 22, 1, CAST(N'2023-10-12T11:21:39.693' AS DateTime), CAST(N'2023-10-12T11:21:39.693' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (77, N'q', 1, 22, 1, CAST(N'2023-10-12T11:21:39.693' AS DateTime), CAST(N'2023-10-12T11:21:39.693' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (84, N'Es una libreria', 0, 26, 1, CAST(N'2023-10-12T16:24:35.553' AS DateTime), CAST(N'2023-10-12T16:24:35.553' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (85, N'Es un framework', 1, 26, 1, CAST(N'2023-10-12T16:24:35.553' AS DateTime), CAST(N'2023-10-12T16:24:35.553' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (86, N'Es un archivo', 0, 26, 1, CAST(N'2023-10-12T16:24:35.553' AS DateTime), CAST(N'2023-10-12T16:24:35.553' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (89, N'Primera  Opción', 1, 29, 1, CAST(N'2023-10-13T12:14:42.560' AS DateTime), CAST(N'2023-10-13T12:14:42.560' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (90, N'Segunda  Opción', 0, 29, 1, CAST(N'2023-10-13T12:14:42.560' AS DateTime), CAST(N'2023-10-13T12:14:42.560' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (91, N'Tercera Opción', 0, 29, 1, CAST(N'2023-10-13T12:14:42.563' AS DateTime), CAST(N'2023-10-13T12:14:42.563' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (92, N'Primera  Opción', 0, 30, 1, CAST(N'2023-10-13T12:15:07.670' AS DateTime), CAST(N'2023-10-13T12:15:07.670' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (93, N'Segunda Opción', 0, 30, 1, CAST(N'2023-10-13T12:15:07.670' AS DateTime), CAST(N'2023-10-13T12:15:07.670' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (94, N'Tercera Opción', 1, 30, 1, CAST(N'2023-10-13T12:15:07.670' AS DateTime), CAST(N'2023-10-13T12:15:07.670' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (95, N'Primera  Opción', 0, 31, 1, CAST(N'2023-10-13T12:15:47.283' AS DateTime), CAST(N'2023-10-13T12:15:47.283' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (96, N'Segunda Opción', 0, 31, 1, CAST(N'2023-10-13T12:15:47.283' AS DateTime), CAST(N'2023-10-13T12:15:47.283' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (97, N'Tercera Opción', 0, 31, 1, CAST(N'2023-10-13T12:15:47.283' AS DateTime), CAST(N'2023-10-13T12:15:47.283' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (98, N'Cuarta Opción', 1, 31, 1, CAST(N'2023-10-13T12:15:47.283' AS DateTime), CAST(N'2023-10-13T12:15:47.283' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (99, N'Primera  Opción', 1, 32, 1, CAST(N'2023-10-13T12:16:13.813' AS DateTime), CAST(N'2023-10-13T12:16:13.813' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (100, N'Segunda Opción', 0, 32, 1, CAST(N'2023-10-13T12:16:13.817' AS DateTime), CAST(N'2023-10-13T12:16:13.817' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (101, N'Tercera Opción', 0, 32, 1, CAST(N'2023-10-13T12:16:13.817' AS DateTime), CAST(N'2023-10-13T12:16:13.817' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (102, N'Primera  Opción', 0, 33, 1, CAST(N'2023-10-13T12:16:51.353' AS DateTime), CAST(N'2023-10-13T12:16:51.353' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (103, N'Segunda Opción', 1, 33, 1, CAST(N'2023-10-13T12:16:51.353' AS DateTime), CAST(N'2023-10-13T12:16:51.353' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (104, N'Primera  Opción', 1, 34, 1, CAST(N'2023-10-13T12:17:12.450' AS DateTime), CAST(N'2023-10-13T12:17:12.450' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (105, N'Segunda Opción', 0, 34, 1, CAST(N'2023-10-13T12:17:12.453' AS DateTime), CAST(N'2023-10-13T12:17:12.453' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (106, N'Primera  Opción - Lorem Ipsum has been the industry''s standard dummy', 0, 35, 1, CAST(N'2023-10-13T12:17:52.043' AS DateTime), CAST(N'2023-10-13T15:25:39.630' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (107, N'Segunda Opción - Lorem Ipsum has been the industry''s standard dummy', 1, 35, 1, CAST(N'2023-10-13T12:17:52.043' AS DateTime), CAST(N'2023-10-13T15:25:39.630' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (108, N'Tercera  Opción', 0, 35, 1, CAST(N'2023-10-13T12:17:52.043' AS DateTime), CAST(N'2023-10-13T15:25:39.630' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (109, N'Primera  Opción - Lorem Ipsum has been the industry''s standard dummy', 1, 36, 1, CAST(N'2023-10-13T12:18:11.350' AS DateTime), CAST(N'2023-10-13T15:25:52.220' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (110, N'Segunda Opción - Lorem Ipsum has been the industry''s standard dummy', 0, 36, 1, CAST(N'2023-10-13T12:18:11.350' AS DateTime), CAST(N'2023-10-13T15:25:52.220' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (111, N'op a', 0, 37, 1, CAST(N'2023-10-13T12:47:06.613' AS DateTime), CAST(N'2023-10-13T12:47:27.857' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (112, N'op b', 1, 37, 1, CAST(N'2023-10-13T12:47:06.613' AS DateTime), CAST(N'2023-10-13T12:47:27.857' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (113, N'op c', 0, 37, 1, CAST(N'2023-10-13T12:47:27.857' AS DateTime), CAST(N'2023-10-13T12:47:27.857' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (114, N'Respuesta 1', 1, 38, 1, CAST(N'2023-10-13T16:10:51.033' AS DateTime), CAST(N'2023-10-13T16:11:17.440' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (115, N'Respuesta 2', 0, 38, 1, CAST(N'2023-10-13T16:10:51.033' AS DateTime), CAST(N'2023-10-13T16:11:17.440' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (116, N'Respuesta 3', 0, 38, 1, CAST(N'2023-10-13T16:10:51.037' AS DateTime), CAST(N'2023-10-13T16:11:17.443' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (117, N'Respuesta 4', 0, 38, 1, CAST(N'2023-10-13T16:11:17.443' AS DateTime), CAST(N'2023-10-13T16:11:17.443' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (134, N'23 de octubre', 0, 43, 1, CAST(N'2023-10-16T18:06:06.397' AS DateTime), CAST(N'2023-10-16T18:06:06.397' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (135, N'28 de octubre', 0, 43, 1, CAST(N'2023-10-16T18:06:06.397' AS DateTime), CAST(N'2023-10-16T18:06:06.397' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (136, N'29 de octubre', 1, 43, 1, CAST(N'2023-10-16T18:06:06.397' AS DateTime), CAST(N'2023-10-16T18:06:06.397' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (137, N'31 de octubre', 0, 43, 1, CAST(N'2023-10-16T18:06:06.400' AS DateTime), CAST(N'2023-10-16T18:06:06.400' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (138, N'1', 0, 44, 1, CAST(N'2023-10-16T18:06:06.400' AS DateTime), CAST(N'2023-10-16T18:06:06.400' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (139, N'2', 1, 44, 1, CAST(N'2023-10-16T18:06:06.400' AS DateTime), CAST(N'2023-10-16T18:06:06.400' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (140, N'4', 0, 44, 1, CAST(N'2023-10-16T18:06:06.400' AS DateTime), CAST(N'2023-10-16T18:06:06.400' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (141, N'5', 0, 44, 1, CAST(N'2023-10-16T18:06:06.400' AS DateTime), CAST(N'2023-10-16T18:06:06.400' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (142, N'23 de octubre', 0, 45, 1, CAST(N'2023-10-17T10:58:13.617' AS DateTime), CAST(N'2023-10-17T10:58:13.617' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (143, N'28 de octubre', 0, 45, 1, CAST(N'2023-10-17T10:58:13.617' AS DateTime), CAST(N'2023-10-17T10:58:13.617' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (144, N'29 de octubre', 1, 45, 1, CAST(N'2023-10-17T10:58:13.617' AS DateTime), CAST(N'2023-10-17T10:58:13.617' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (145, N'31 de octubre', 0, 45, 1, CAST(N'2023-10-17T10:58:13.617' AS DateTime), CAST(N'2023-10-17T10:58:13.617' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (146, N'1', 0, 46, 1, CAST(N'2023-10-17T10:58:13.617' AS DateTime), CAST(N'2023-10-17T10:58:13.617' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (147, N'2', 1, 46, 1, CAST(N'2023-10-17T10:58:13.617' AS DateTime), CAST(N'2023-10-17T10:58:13.617' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (148, N'4', 0, 46, 1, CAST(N'2023-10-17T10:58:13.617' AS DateTime), CAST(N'2023-10-17T10:58:13.617' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (149, N'5', 0, 46, 1, CAST(N'2023-10-17T10:58:13.617' AS DateTime), CAST(N'2023-10-17T10:58:13.617' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (150, N'23 de octubre', 0, 47, 1, CAST(N'2023-10-17T11:12:07.537' AS DateTime), CAST(N'2023-10-17T11:12:07.537' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (151, N'28 de octubre', 0, 47, 1, CAST(N'2023-10-17T11:12:07.537' AS DateTime), CAST(N'2023-10-17T11:12:07.537' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (152, N'29 de octubre', 1, 47, 1, CAST(N'2023-10-17T11:12:07.537' AS DateTime), CAST(N'2023-10-17T11:12:07.537' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (153, N'31 de octubre', 0, 47, 1, CAST(N'2023-10-17T11:12:07.537' AS DateTime), CAST(N'2023-10-17T11:12:07.537' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (154, N'1', 0, 48, 1, CAST(N'2023-10-17T11:12:07.537' AS DateTime), CAST(N'2023-10-17T11:12:07.537' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (155, N'2', 1, 48, 1, CAST(N'2023-10-17T11:12:07.537' AS DateTime), CAST(N'2023-10-17T11:12:07.537' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (156, N'4', 0, 48, 1, CAST(N'2023-10-17T11:12:07.537' AS DateTime), CAST(N'2023-10-17T11:12:07.537' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (157, N'5', 0, 48, 1, CAST(N'2023-10-17T11:12:07.540' AS DateTime), CAST(N'2023-10-17T11:12:07.540' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (158, N'23 de octubre', 0, 49, 1, CAST(N'2023-10-17T11:15:42.283' AS DateTime), CAST(N'2023-10-17T11:15:42.283' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (159, N'28 de octubre', 0, 49, 1, CAST(N'2023-10-17T11:15:42.283' AS DateTime), CAST(N'2023-10-17T11:15:42.283' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (160, N'29 de octubre', 1, 49, 1, CAST(N'2023-10-17T11:15:42.283' AS DateTime), CAST(N'2023-10-17T11:15:42.283' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (161, N'31 de octubre', 0, 49, 1, CAST(N'2023-10-17T11:15:42.283' AS DateTime), CAST(N'2023-10-17T11:15:42.283' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (162, N'1', 0, 50, 1, CAST(N'2023-10-17T11:15:42.283' AS DateTime), CAST(N'2023-10-17T11:15:42.283' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (163, N'2', 1, 50, 1, CAST(N'2023-10-17T11:15:42.283' AS DateTime), CAST(N'2023-10-17T11:15:42.283' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (164, N'4', 0, 50, 1, CAST(N'2023-10-17T11:15:42.283' AS DateTime), CAST(N'2023-10-17T11:15:42.283' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (165, N'5', 0, 50, 1, CAST(N'2023-10-17T11:15:42.283' AS DateTime), CAST(N'2023-10-17T11:15:42.283' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (166, N'23 de octubre', 0, 51, 1, CAST(N'2023-10-17T11:15:56.747' AS DateTime), CAST(N'2023-10-17T11:15:56.747' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (167, N'28 de octubre', 0, 51, 1, CAST(N'2023-10-17T11:15:56.750' AS DateTime), CAST(N'2023-10-17T11:15:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (168, N'29 de octubre', 1, 51, 1, CAST(N'2023-10-17T11:15:56.750' AS DateTime), CAST(N'2023-10-17T11:15:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (169, N'31 de octubre', 0, 51, 1, CAST(N'2023-10-17T11:15:56.750' AS DateTime), CAST(N'2023-10-17T11:15:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (170, N'1', 0, 52, 1, CAST(N'2023-10-17T11:15:56.750' AS DateTime), CAST(N'2023-10-17T11:15:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (171, N'2', 1, 52, 1, CAST(N'2023-10-17T11:15:56.750' AS DateTime), CAST(N'2023-10-17T11:15:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (172, N'4', 0, 52, 1, CAST(N'2023-10-17T11:15:56.750' AS DateTime), CAST(N'2023-10-17T11:15:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (173, N'5', 0, 52, 1, CAST(N'2023-10-17T11:15:56.750' AS DateTime), CAST(N'2023-10-17T11:15:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (174, N'Otra opción', 0, 53, 1, CAST(N'2023-10-17T12:06:27.250' AS DateTime), CAST(N'2023-10-17T12:06:27.250' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (175, N'Otra opción', 1, 53, 1, CAST(N'2023-10-17T12:06:27.250' AS DateTime), CAST(N'2023-10-17T12:06:27.250' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (176, N'Otra opción', 0, 54, 1, CAST(N'2023-10-17T12:06:44.877' AS DateTime), CAST(N'2023-10-17T12:06:44.877' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (177, N'Otra opción', 1, 54, 1, CAST(N'2023-10-17T12:06:44.877' AS DateTime), CAST(N'2023-10-17T12:06:44.877' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (178, N'Otra opción', 0, 54, 1, CAST(N'2023-10-17T12:06:44.877' AS DateTime), CAST(N'2023-10-17T12:06:44.877' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (179, N'23 de octubre', 0, 55, 1, CAST(N'2023-10-17T12:39:37.453' AS DateTime), CAST(N'2023-10-17T12:39:37.453' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (180, N'28 de octubre', 0, 55, 1, CAST(N'2023-10-17T12:39:37.453' AS DateTime), CAST(N'2023-10-17T12:39:37.453' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (181, N'29 de octubre', 1, 55, 1, CAST(N'2023-10-17T12:39:37.453' AS DateTime), CAST(N'2023-10-17T12:39:37.453' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (182, N'31 de octubre', 0, 55, 1, CAST(N'2023-10-17T12:39:37.453' AS DateTime), CAST(N'2023-10-17T12:39:37.453' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (183, N'1', 0, 56, 1, CAST(N'2023-10-17T12:39:37.453' AS DateTime), CAST(N'2023-10-17T12:39:37.453' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (184, N'2', 1, 56, 1, CAST(N'2023-10-17T12:39:37.457' AS DateTime), CAST(N'2023-10-17T12:39:37.457' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (185, N'4', 0, 56, 1, CAST(N'2023-10-17T12:39:37.457' AS DateTime), CAST(N'2023-10-17T12:39:37.457' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (186, N'5', 0, 56, 1, CAST(N'2023-10-17T12:39:37.457' AS DateTime), CAST(N'2023-10-17T12:39:37.457' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (187, N'1', 0, 57, 1, CAST(N'2023-10-17T12:40:30.073' AS DateTime), CAST(N'2023-10-17T12:40:30.073' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (188, N'2', 1, 57, 1, CAST(N'2023-10-17T12:40:30.077' AS DateTime), CAST(N'2023-10-17T12:40:30.077' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (189, N'4', 0, 57, 1, CAST(N'2023-10-17T12:40:30.077' AS DateTime), CAST(N'2023-10-17T12:40:30.077' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (190, N'5', 0, 57, 1, CAST(N'2023-10-17T12:40:30.077' AS DateTime), CAST(N'2023-10-17T12:40:30.077' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (191, N'1', 0, 58, 1, CAST(N'2023-10-17T12:40:30.077' AS DateTime), CAST(N'2023-10-17T12:40:30.077' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (192, N'2', 1, 58, 1, CAST(N'2023-10-17T12:40:30.077' AS DateTime), CAST(N'2023-10-17T12:40:30.077' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (193, N'4', 0, 58, 1, CAST(N'2023-10-17T12:40:30.077' AS DateTime), CAST(N'2023-10-17T12:40:30.077' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (194, N'5', 0, 58, 1, CAST(N'2023-10-17T12:40:30.077' AS DateTime), CAST(N'2023-10-17T12:40:30.077' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (195, N'1', 0, 59, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (196, N'2', 1, 59, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (197, N'4', 0, 59, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (198, N'5', 0, 59, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (199, N'1', 0, 60, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (200, N'2', 1, 60, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (201, N'4', 0, 60, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (202, N'5', 0, 60, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (203, N'1', 0, 61, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (204, N'2', 1, 61, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (205, N'4', 0, 61, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (206, N'5', 0, 61, 1, CAST(N'2023-10-17T12:40:30.083' AS DateTime), CAST(N'2023-10-17T12:40:30.083' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (207, N'1', 0, 62, 1, CAST(N'2023-10-17T12:40:30.083' AS DateTime), CAST(N'2023-10-17T12:40:30.083' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (208, N'2', 1, 62, 1, CAST(N'2023-10-17T12:40:30.083' AS DateTime), CAST(N'2023-10-17T12:40:30.083' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (209, N'4', 0, 62, 1, CAST(N'2023-10-17T12:40:30.083' AS DateTime), CAST(N'2023-10-17T12:40:30.083' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (210, N'5', 0, 62, 1, CAST(N'2023-10-17T12:40:30.083' AS DateTime), CAST(N'2023-10-17T12:40:30.083' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (211, N'1', 0, 63, 1, CAST(N'2023-10-17T12:40:30.083' AS DateTime), CAST(N'2023-10-17T12:40:30.083' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (212, N'2', 1, 63, 1, CAST(N'2023-10-17T12:40:30.083' AS DateTime), CAST(N'2023-10-17T12:40:30.083' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (213, N'4', 0, 63, 1, CAST(N'2023-10-17T12:40:30.083' AS DateTime), CAST(N'2023-10-17T12:40:30.083' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (214, N'5', 0, 63, 1, CAST(N'2023-10-17T12:40:30.083' AS DateTime), CAST(N'2023-10-17T12:40:30.083' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (215, N'1', 0, 64, 1, CAST(N'2023-10-17T12:40:30.087' AS DateTime), CAST(N'2023-10-17T12:40:30.087' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (216, N'2', 1, 64, 1, CAST(N'2023-10-17T12:40:30.087' AS DateTime), CAST(N'2023-10-17T12:40:30.087' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (217, N'4', 0, 64, 1, CAST(N'2023-10-17T12:40:30.087' AS DateTime), CAST(N'2023-10-17T12:40:30.087' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (218, N'5', 0, 64, 1, CAST(N'2023-10-17T12:40:30.087' AS DateTime), CAST(N'2023-10-17T12:40:30.087' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (219, N'1', 0, 65, 1, CAST(N'2023-10-17T12:40:30.087' AS DateTime), CAST(N'2023-10-17T12:40:30.087' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (220, N'2', 1, 65, 1, CAST(N'2023-10-17T12:40:30.087' AS DateTime), CAST(N'2023-10-17T12:40:30.087' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (221, N'4', 0, 65, 1, CAST(N'2023-10-17T12:40:30.087' AS DateTime), CAST(N'2023-10-17T12:40:30.087' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (222, N'5', 0, 65, 1, CAST(N'2023-10-17T12:40:30.087' AS DateTime), CAST(N'2023-10-17T12:40:30.087' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (223, N'1', 0, 66, 1, CAST(N'2023-10-17T12:40:30.090' AS DateTime), CAST(N'2023-10-17T12:40:30.090' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (224, N'2', 1, 66, 1, CAST(N'2023-10-17T12:40:30.090' AS DateTime), CAST(N'2023-10-17T12:40:30.090' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (225, N'4', 0, 66, 1, CAST(N'2023-10-17T12:40:30.090' AS DateTime), CAST(N'2023-10-17T12:40:30.090' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (226, N'5', 0, 66, 1, CAST(N'2023-10-17T12:40:30.090' AS DateTime), CAST(N'2023-10-17T12:40:30.090' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (227, N'1', 0, 67, 1, CAST(N'2023-10-17T12:40:30.090' AS DateTime), CAST(N'2023-10-17T12:40:30.090' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (228, N'2', 1, 67, 1, CAST(N'2023-10-17T12:40:30.090' AS DateTime), CAST(N'2023-10-17T12:40:30.090' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (229, N'4', 0, 67, 1, CAST(N'2023-10-17T12:40:30.090' AS DateTime), CAST(N'2023-10-17T12:40:30.090' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (230, N'5', 0, 67, 1, CAST(N'2023-10-17T12:40:30.090' AS DateTime), CAST(N'2023-10-17T12:40:30.090' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (231, N'1', 0, 68, 1, CAST(N'2023-10-17T12:40:30.090' AS DateTime), CAST(N'2023-10-17T12:40:30.090' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (232, N'2', 1, 68, 1, CAST(N'2023-10-17T12:40:30.093' AS DateTime), CAST(N'2023-10-17T12:40:30.093' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (233, N'4', 0, 68, 1, CAST(N'2023-10-17T12:40:30.093' AS DateTime), CAST(N'2023-10-17T12:40:30.093' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (234, N'5', 0, 68, 1, CAST(N'2023-10-17T12:40:30.093' AS DateTime), CAST(N'2023-10-17T12:40:30.093' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (235, N'1', 0, 69, 1, CAST(N'2023-10-17T12:40:30.093' AS DateTime), CAST(N'2023-10-17T12:40:30.093' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (236, N'2', 1, 69, 1, CAST(N'2023-10-17T12:40:30.093' AS DateTime), CAST(N'2023-10-17T12:40:30.093' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (237, N'4', 0, 69, 1, CAST(N'2023-10-17T12:40:30.093' AS DateTime), CAST(N'2023-10-17T12:40:30.093' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (238, N'5', 0, 69, 1, CAST(N'2023-10-17T12:40:30.093' AS DateTime), CAST(N'2023-10-17T12:40:30.093' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (239, N'1', 0, 70, 1, CAST(N'2023-10-17T12:40:30.093' AS DateTime), CAST(N'2023-10-17T12:40:30.093' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (240, N'2', 1, 70, 1, CAST(N'2023-10-17T12:40:30.097' AS DateTime), CAST(N'2023-10-17T12:40:30.097' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (241, N'4', 0, 70, 1, CAST(N'2023-10-17T12:40:30.097' AS DateTime), CAST(N'2023-10-17T12:40:30.097' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (242, N'5', 0, 70, 1, CAST(N'2023-10-17T12:40:30.097' AS DateTime), CAST(N'2023-10-17T12:40:30.097' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (243, N'1', 0, 71, 1, CAST(N'2023-10-17T12:40:30.097' AS DateTime), CAST(N'2023-10-17T12:40:30.097' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (244, N'2', 1, 71, 1, CAST(N'2023-10-17T12:40:30.097' AS DateTime), CAST(N'2023-10-17T12:40:30.097' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (245, N'4', 0, 71, 1, CAST(N'2023-10-17T12:40:30.097' AS DateTime), CAST(N'2023-10-17T12:40:30.097' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (246, N'5', 0, 71, 1, CAST(N'2023-10-17T12:40:30.097' AS DateTime), CAST(N'2023-10-17T12:40:30.097' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (247, N'1', 0, 72, 1, CAST(N'2023-10-17T12:40:30.097' AS DateTime), CAST(N'2023-10-17T12:40:30.097' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (248, N'2', 1, 72, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (249, N'4', 0, 72, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (250, N'5', 0, 72, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (251, N'1', 0, 73, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (252, N'2', 1, 73, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (253, N'4', 0, 73, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (254, N'5', 0, 73, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (255, N'1', 0, 74, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (256, N'2', 1, 74, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (257, N'4', 0, 74, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (258, N'5', 0, 74, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (259, N'1', 0, 75, 1, CAST(N'2023-10-17T12:40:30.103' AS DateTime), CAST(N'2023-10-17T12:40:30.103' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (260, N'2', 1, 75, 1, CAST(N'2023-10-17T12:40:30.103' AS DateTime), CAST(N'2023-10-17T12:40:30.103' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (261, N'4', 0, 75, 1, CAST(N'2023-10-17T12:40:30.103' AS DateTime), CAST(N'2023-10-17T12:40:30.103' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (262, N'5', 0, 75, 1, CAST(N'2023-10-17T12:40:30.103' AS DateTime), CAST(N'2023-10-17T12:40:30.103' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (263, N'1', 0, 76, 1, CAST(N'2023-10-17T12:40:30.103' AS DateTime), CAST(N'2023-10-17T12:40:30.103' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (264, N'2', 1, 76, 1, CAST(N'2023-10-17T12:40:30.103' AS DateTime), CAST(N'2023-10-17T12:40:30.103' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (265, N'4', 0, 76, 1, CAST(N'2023-10-17T12:40:30.103' AS DateTime), CAST(N'2023-10-17T12:40:30.103' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (266, N'5', 0, 76, 1, CAST(N'2023-10-17T12:40:30.103' AS DateTime), CAST(N'2023-10-17T12:40:30.103' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (267, N'1', 0, 77, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (268, N'2', 1, 77, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (269, N'4', 0, 77, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (270, N'5', 0, 77, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (271, N'1', 0, 78, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (272, N'2', 1, 78, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (273, N'4', 0, 78, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (274, N'5', 0, 78, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (275, N'1', 0, 79, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (276, N'2', 1, 79, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (277, N'4', 0, 79, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (278, N'5', 0, 79, 1, CAST(N'2023-10-17T12:40:30.110' AS DateTime), CAST(N'2023-10-17T12:40:30.110' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (279, N'1', 0, 80, 1, CAST(N'2023-10-17T12:40:30.110' AS DateTime), CAST(N'2023-10-17T12:40:30.110' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (280, N'2', 1, 80, 1, CAST(N'2023-10-17T12:40:30.110' AS DateTime), CAST(N'2023-10-17T12:40:30.110' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (281, N'4', 0, 80, 1, CAST(N'2023-10-17T12:40:30.110' AS DateTime), CAST(N'2023-10-17T12:40:30.110' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (282, N'5', 0, 80, 1, CAST(N'2023-10-17T12:40:30.110' AS DateTime), CAST(N'2023-10-17T12:40:30.110' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (283, N'1', 0, 81, 1, CAST(N'2023-10-17T12:40:30.110' AS DateTime), CAST(N'2023-10-17T12:40:30.110' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (284, N'2', 1, 81, 1, CAST(N'2023-10-17T12:40:30.110' AS DateTime), CAST(N'2023-10-17T12:40:30.110' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (285, N'4', 0, 81, 1, CAST(N'2023-10-17T12:40:30.110' AS DateTime), CAST(N'2023-10-17T12:40:30.110' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (286, N'5', 0, 81, 1, CAST(N'2023-10-17T12:40:30.110' AS DateTime), CAST(N'2023-10-17T12:40:30.110' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (287, N'1', 0, 82, 1, CAST(N'2023-10-17T12:40:30.113' AS DateTime), CAST(N'2023-10-17T12:40:30.113' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (288, N'2', 1, 82, 1, CAST(N'2023-10-17T12:40:30.113' AS DateTime), CAST(N'2023-10-17T12:40:30.113' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (289, N'4', 0, 82, 1, CAST(N'2023-10-17T12:40:30.113' AS DateTime), CAST(N'2023-10-17T12:40:30.113' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (290, N'5', 0, 82, 1, CAST(N'2023-10-17T12:40:30.113' AS DateTime), CAST(N'2023-10-17T12:40:30.113' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (291, N'1', 0, 83, 1, CAST(N'2023-10-17T12:40:30.113' AS DateTime), CAST(N'2023-10-17T12:40:30.113' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (292, N'2', 1, 83, 1, CAST(N'2023-10-17T12:40:30.113' AS DateTime), CAST(N'2023-10-17T12:40:30.113' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (293, N'4', 0, 83, 1, CAST(N'2023-10-17T12:40:30.113' AS DateTime), CAST(N'2023-10-17T12:40:30.113' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (294, N'5', 0, 83, 1, CAST(N'2023-10-17T12:40:30.113' AS DateTime), CAST(N'2023-10-17T12:40:30.113' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (295, N'1', 0, 84, 1, CAST(N'2023-10-17T12:40:30.117' AS DateTime), CAST(N'2023-10-17T12:40:30.117' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (296, N'2', 1, 84, 1, CAST(N'2023-10-17T12:40:30.117' AS DateTime), CAST(N'2023-10-17T12:40:30.117' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (297, N'4', 0, 84, 1, CAST(N'2023-10-17T12:40:30.117' AS DateTime), CAST(N'2023-10-17T12:40:30.117' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (298, N'5', 0, 84, 1, CAST(N'2023-10-17T12:40:30.117' AS DateTime), CAST(N'2023-10-17T12:40:30.117' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (299, N'1', 0, 85, 1, CAST(N'2023-10-17T12:40:30.117' AS DateTime), CAST(N'2023-10-17T12:40:30.117' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (300, N'2', 1, 85, 1, CAST(N'2023-10-17T12:40:30.117' AS DateTime), CAST(N'2023-10-17T12:40:30.117' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (301, N'4', 0, 85, 1, CAST(N'2023-10-17T12:40:30.117' AS DateTime), CAST(N'2023-10-17T12:40:30.117' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (302, N'5', 0, 85, 1, CAST(N'2023-10-17T12:40:30.117' AS DateTime), CAST(N'2023-10-17T12:40:30.117' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (303, N'1', 0, 86, 1, CAST(N'2023-10-17T12:40:30.120' AS DateTime), CAST(N'2023-10-17T12:40:30.120' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (304, N'2', 1, 86, 1, CAST(N'2023-10-17T12:40:30.120' AS DateTime), CAST(N'2023-10-17T12:40:30.120' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (305, N'4', 0, 86, 1, CAST(N'2023-10-17T12:40:30.120' AS DateTime), CAST(N'2023-10-17T12:40:30.120' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (306, N'5', 0, 86, 1, CAST(N'2023-10-17T12:40:30.120' AS DateTime), CAST(N'2023-10-17T12:40:30.120' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (307, N'1', 0, 87, 1, CAST(N'2023-10-17T12:40:30.120' AS DateTime), CAST(N'2023-10-17T12:40:30.120' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (308, N'2', 1, 87, 1, CAST(N'2023-10-17T12:40:30.120' AS DateTime), CAST(N'2023-10-17T12:40:30.120' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (309, N'4', 0, 87, 1, CAST(N'2023-10-17T12:40:30.120' AS DateTime), CAST(N'2023-10-17T12:40:30.120' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (310, N'5', 0, 87, 1, CAST(N'2023-10-17T12:40:30.120' AS DateTime), CAST(N'2023-10-17T12:40:30.120' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (311, N'23 de octubre', 0, 88, 1, CAST(N'2023-10-17T16:23:13.550' AS DateTime), CAST(N'2023-10-17T16:23:13.550' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (312, N'28 de octubre', 0, 88, 1, CAST(N'2023-10-17T16:23:13.550' AS DateTime), CAST(N'2023-10-17T16:23:13.550' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (313, N'29 de octubre', 1, 88, 1, CAST(N'2023-10-17T16:23:13.550' AS DateTime), CAST(N'2023-10-17T16:23:13.550' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (314, N'31 de octubre', 0, 88, 1, CAST(N'2023-10-17T16:23:13.550' AS DateTime), CAST(N'2023-10-17T16:23:13.550' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (315, N'1', 0, 89, 1, CAST(N'2023-10-17T16:23:13.550' AS DateTime), CAST(N'2023-10-17T16:23:13.550' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (316, N'2', 1, 89, 1, CAST(N'2023-10-17T16:23:13.550' AS DateTime), CAST(N'2023-10-17T16:23:13.550' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (317, N'TRUE', 1, 90, 1, CAST(N'2023-10-17T16:28:50.560' AS DateTime), CAST(N'2023-10-17T16:28:50.560' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (318, N'FALSE', 0, 90, 1, CAST(N'2023-10-17T16:28:50.560' AS DateTime), CAST(N'2023-10-17T16:28:50.560' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (319, N'verdadero', 1, 90, 1, CAST(N'2023-10-17T16:30:29.510' AS DateTime), CAST(N'2023-10-17T16:30:29.510' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (320, N'falso', 0, 90, 1, CAST(N'2023-10-17T16:30:29.510' AS DateTime), CAST(N'2023-10-17T16:30:29.510' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (322, N'verdadero', 1, 91, 1, CAST(N'2023-10-17T16:41:48.367' AS DateTime), CAST(N'2023-10-17T16:41:48.367' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (323, N'falso', 0, 91, 1, CAST(N'2023-10-17T16:41:48.367' AS DateTime), CAST(N'2023-10-17T16:41:48.367' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (324, N'bueno', 0, 91, 1, CAST(N'2023-10-17T16:41:48.367' AS DateTime), CAST(N'2023-10-17T16:41:48.367' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (325, N'tercera', 0, 91, 1, CAST(N'2023-10-17T16:43:11.180' AS DateTime), CAST(N'2023-10-17T16:43:11.180' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (336, N'Viena', 0, 95, 1, CAST(N'2023-10-17T17:01:42.640' AS DateTime), CAST(N'2023-10-17T17:01:42.640' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (337, N'Praga', 1, 95, 1, CAST(N'2023-10-17T17:01:42.640' AS DateTime), CAST(N'2023-10-17T17:01:42.640' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (338, N'Budapest', 0, 95, 1, CAST(N'2023-10-17T17:01:42.640' AS DateTime), CAST(N'2023-10-17T17:01:42.640' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (339, N'Estambul', 0, 95, 1, CAST(N'2023-10-17T17:01:42.640' AS DateTime), CAST(N'2023-10-17T17:01:42.640' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (340, N'40', 0, 96, 1, CAST(N'2023-10-17T17:01:42.640' AS DateTime), CAST(N'2023-10-17T17:01:42.640' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (341, N'390', 0, 96, 1, CAST(N'2023-10-17T17:01:42.640' AS DateTime), CAST(N'2023-10-17T17:01:42.640' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (342, N'208', 1, 96, 1, CAST(N'2023-10-17T17:01:42.640' AS DateTime), CAST(N'2023-10-17T17:01:42.640' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (343, N'Cada 3 meses', 0, 97, 1, CAST(N'2023-10-17T17:01:42.643' AS DateTime), CAST(N'2023-10-17T17:01:42.643' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (344, N'Cada 6 meses', 1, 97, 1, CAST(N'2023-10-17T17:01:42.643' AS DateTime), CAST(N'2023-10-17T17:01:42.643' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (345, N'23 de octubre', 0, 98, 1, CAST(N'2023-10-17T17:01:42.643' AS DateTime), CAST(N'2023-10-17T17:01:42.643' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (346, N'29 de octubre', 1, 98, 1, CAST(N'2023-10-17T17:01:42.643' AS DateTime), CAST(N'2023-10-17T17:01:42.643' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (347, N'28 de octubre', 0, 98, 1, CAST(N'2023-10-17T17:01:42.643' AS DateTime), CAST(N'2023-10-17T17:01:42.643' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (348, N'31 de octubre', 0, 98, 1, CAST(N'2023-10-17T17:01:42.643' AS DateTime), CAST(N'2023-10-17T17:01:42.643' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (349, N'Muy delicioso', 0, 99, 1, CAST(N'2023-10-17T17:01:42.647' AS DateTime), CAST(N'2023-10-17T17:02:00.040' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (350, N'No está mal', 0, 99, 1, CAST(N'2023-10-17T17:01:42.647' AS DateTime), CAST(N'2023-10-17T17:02:00.040' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (351, N'También normal', 0, 99, 1, CAST(N'2023-10-17T17:01:42.647' AS DateTime), CAST(N'2023-10-17T17:02:00.040' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (352, N'No es de mi gusto', 1, 99, 1, CAST(N'2023-10-17T17:01:42.647' AS DateTime), CAST(N'2023-10-17T17:02:00.040' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (353, N'Pizza', 1, 100, 1, CAST(N'2023-10-17T17:01:42.647' AS DateTime), CAST(N'2023-10-17T17:01:42.647' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (354, N'Pasta', 0, 100, 1, CAST(N'2023-10-17T17:01:42.647' AS DateTime), CAST(N'2023-10-17T17:01:42.647' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (355, N'Sushi', 0, 100, 1, CAST(N'2023-10-17T17:01:42.647' AS DateTime), CAST(N'2023-10-17T17:01:42.647' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (356, N'verdadero', 1, 101, 1, CAST(N'2023-10-17T17:01:42.650' AS DateTime), CAST(N'2023-10-17T17:01:42.650' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (357, N'falso', 0, 101, 1, CAST(N'2023-10-17T17:01:42.650' AS DateTime), CAST(N'2023-10-17T17:01:42.650' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (358, N'Viena', 0, 102, 1, CAST(N'2023-10-17T17:11:55.527' AS DateTime), CAST(N'2023-10-17T17:11:55.527' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (359, N'Praga', 1, 102, 1, CAST(N'2023-10-17T17:11:55.527' AS DateTime), CAST(N'2023-10-17T17:11:55.527' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (360, N'Budapest', 0, 102, 1, CAST(N'2023-10-17T17:11:55.527' AS DateTime), CAST(N'2023-10-17T17:11:55.527' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (361, N'Estambul', 0, 102, 1, CAST(N'2023-10-17T17:11:55.527' AS DateTime), CAST(N'2023-10-17T17:11:55.527' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (362, N'40', 0, 103, 1, CAST(N'2023-10-17T17:11:55.527' AS DateTime), CAST(N'2023-10-17T17:11:55.527' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (363, N'390', 0, 103, 1, CAST(N'2023-10-17T17:11:55.530' AS DateTime), CAST(N'2023-10-17T17:11:55.530' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (364, N'208', 1, 103, 1, CAST(N'2023-10-17T17:11:55.530' AS DateTime), CAST(N'2023-10-17T17:11:55.530' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (365, N'Cada 3 meses', 0, 104, 1, CAST(N'2023-10-17T17:11:55.530' AS DateTime), CAST(N'2023-10-17T17:11:55.530' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (366, N'Cada 6 meses', 1, 104, 1, CAST(N'2023-10-17T17:11:55.530' AS DateTime), CAST(N'2023-10-17T17:11:55.530' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (367, N'23 de octubre', 0, 105, 1, CAST(N'2023-10-17T17:11:55.530' AS DateTime), CAST(N'2023-10-17T17:11:55.530' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (368, N'29 de octubre', 1, 105, 1, CAST(N'2023-10-17T17:11:55.530' AS DateTime), CAST(N'2023-10-17T17:11:55.530' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (369, N'28 de octubre', 0, 105, 1, CAST(N'2023-10-17T17:11:55.530' AS DateTime), CAST(N'2023-10-17T17:11:55.530' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (370, N'31 de octubre', 0, 105, 1, CAST(N'2023-10-17T17:11:55.530' AS DateTime), CAST(N'2023-10-17T17:11:55.530' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (371, N'Muy delicioso', 0, 106, 1, CAST(N'2023-10-17T17:11:55.533' AS DateTime), CAST(N'2023-10-17T17:11:55.533' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (372, N'No está mal', 0, 106, 1, CAST(N'2023-10-17T17:11:55.533' AS DateTime), CAST(N'2023-10-17T17:11:55.533' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (373, N'También normal', 0, 106, 1, CAST(N'2023-10-17T17:11:55.533' AS DateTime), CAST(N'2023-10-17T17:11:55.533' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (374, N'No es de mi gusto', 1, 106, 1, CAST(N'2023-10-17T17:11:55.533' AS DateTime), CAST(N'2023-10-17T17:11:55.533' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (375, N'Pizza', 1, 107, 1, CAST(N'2023-10-17T17:11:55.533' AS DateTime), CAST(N'2023-10-17T17:11:55.533' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (376, N'Pasta', 0, 107, 1, CAST(N'2023-10-17T17:11:55.533' AS DateTime), CAST(N'2023-10-17T17:11:55.533' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (377, N'Sushi', 0, 107, 1, CAST(N'2023-10-17T17:11:55.533' AS DateTime), CAST(N'2023-10-17T17:11:55.533' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (378, N'verdadero', 1, 108, 1, CAST(N'2023-10-17T17:11:55.537' AS DateTime), CAST(N'2023-10-17T17:11:55.537' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (379, N'falso', 0, 108, 1, CAST(N'2023-10-17T17:11:55.537' AS DateTime), CAST(N'2023-10-17T17:11:55.537' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (380, N'Viena', 0, 109, 1, CAST(N'2023-10-17T17:27:15.183' AS DateTime), CAST(N'2023-10-17T17:27:15.183' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (381, N'Praga', 1, 109, 1, CAST(N'2023-10-17T17:27:15.183' AS DateTime), CAST(N'2023-10-17T17:27:15.183' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (382, N'Budapest', 0, 109, 1, CAST(N'2023-10-17T17:27:15.187' AS DateTime), CAST(N'2023-10-17T17:27:15.187' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (383, N'Estambul', 0, 109, 1, CAST(N'2023-10-17T17:27:15.187' AS DateTime), CAST(N'2023-10-17T17:27:15.187' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (384, N'40', 0, 110, 1, CAST(N'2023-10-17T17:27:15.187' AS DateTime), CAST(N'2023-10-17T17:27:15.187' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (385, N'390', 0, 110, 1, CAST(N'2023-10-17T17:27:15.187' AS DateTime), CAST(N'2023-10-17T17:27:15.187' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (386, N'208', 1, 110, 1, CAST(N'2023-10-17T17:27:15.187' AS DateTime), CAST(N'2023-10-17T17:27:15.187' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (387, N'Cada 3 meses', 0, 111, 1, CAST(N'2023-10-17T17:27:15.190' AS DateTime), CAST(N'2023-10-17T17:27:15.190' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (388, N'Cada 6 meses', 1, 111, 1, CAST(N'2023-10-17T17:27:15.190' AS DateTime), CAST(N'2023-10-17T17:27:15.190' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (389, N'23 de octubre', 0, 112, 1, CAST(N'2023-10-17T17:27:15.190' AS DateTime), CAST(N'2023-10-17T17:27:15.190' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (390, N'29 de octubre', 1, 112, 1, CAST(N'2023-10-17T17:27:15.190' AS DateTime), CAST(N'2023-10-17T17:27:15.190' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (391, N'28 de octubre', 0, 112, 1, CAST(N'2023-10-17T17:27:15.190' AS DateTime), CAST(N'2023-10-17T17:27:15.190' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (392, N'31 de octubre', 0, 112, 1, CAST(N'2023-10-17T17:27:15.190' AS DateTime), CAST(N'2023-10-17T17:27:15.190' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (393, N'Muy delicioso', 0, 113, 1, CAST(N'2023-10-17T17:27:15.190' AS DateTime), CAST(N'2023-10-17T17:27:15.190' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (394, N'No está mal', 0, 113, 1, CAST(N'2023-10-17T17:27:15.190' AS DateTime), CAST(N'2023-10-17T17:27:15.190' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (395, N'También normal', 0, 113, 1, CAST(N'2023-10-17T17:27:15.190' AS DateTime), CAST(N'2023-10-17T17:27:15.190' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (396, N'No es de mi gusto', 1, 113, 1, CAST(N'2023-10-17T17:27:15.193' AS DateTime), CAST(N'2023-10-17T17:27:15.193' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (397, N'Pizza', 1, 114, 1, CAST(N'2023-10-17T17:27:15.193' AS DateTime), CAST(N'2023-10-17T17:27:15.193' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (398, N'Pasta', 0, 114, 1, CAST(N'2023-10-17T17:27:15.193' AS DateTime), CAST(N'2023-10-17T17:27:15.193' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (399, N'Sushi', 0, 114, 1, CAST(N'2023-10-17T17:27:15.193' AS DateTime), CAST(N'2023-10-17T17:27:15.193' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (400, N'verdadero', 1, 115, 1, CAST(N'2023-10-17T17:27:15.193' AS DateTime), CAST(N'2023-10-17T17:27:15.193' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (401, N'falso', 0, 115, 1, CAST(N'2023-10-17T17:27:15.193' AS DateTime), CAST(N'2023-10-17T17:27:15.193' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (402, N'Viena', 0, 116, 1, CAST(N'2023-10-17T17:46:29.140' AS DateTime), CAST(N'2023-10-17T17:46:29.140' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (403, N'Praga', 1, 116, 1, CAST(N'2023-10-17T17:46:29.140' AS DateTime), CAST(N'2023-10-17T17:46:29.140' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (404, N'Budapest', 0, 116, 1, CAST(N'2023-10-17T17:46:29.140' AS DateTime), CAST(N'2023-10-17T17:46:29.140' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (405, N'Estambul', 0, 116, 1, CAST(N'2023-10-17T17:46:29.140' AS DateTime), CAST(N'2023-10-17T17:46:29.140' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (406, N'40', 0, 117, 1, CAST(N'2023-10-17T17:46:29.143' AS DateTime), CAST(N'2023-10-17T17:46:29.143' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (407, N'390', 0, 117, 1, CAST(N'2023-10-17T17:46:29.143' AS DateTime), CAST(N'2023-10-17T17:46:29.143' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (408, N'208', 1, 117, 1, CAST(N'2023-10-17T17:46:29.143' AS DateTime), CAST(N'2023-10-17T17:46:29.143' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (409, N'Cada 3 meses', 0, 118, 1, CAST(N'2023-10-17T17:46:29.143' AS DateTime), CAST(N'2023-10-17T17:46:29.143' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (410, N'Cada 6 meses', 1, 118, 1, CAST(N'2023-10-17T17:46:29.143' AS DateTime), CAST(N'2023-10-17T17:46:29.143' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (411, N'23 de octubre', 0, 119, 1, CAST(N'2023-10-17T17:46:29.143' AS DateTime), CAST(N'2023-10-17T17:46:29.143' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (412, N'29 de octubre', 1, 119, 1, CAST(N'2023-10-17T17:46:29.147' AS DateTime), CAST(N'2023-10-17T17:46:29.147' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (413, N'28 de octubre', 0, 119, 1, CAST(N'2023-10-17T17:46:29.147' AS DateTime), CAST(N'2023-10-17T17:46:29.147' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (414, N'31 de octubre', 0, 119, 1, CAST(N'2023-10-17T17:46:29.147' AS DateTime), CAST(N'2023-10-17T17:46:29.147' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (415, N'Muy delicioso', 0, 120, 1, CAST(N'2023-10-17T17:46:29.147' AS DateTime), CAST(N'2023-10-17T17:46:29.147' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (416, N'No está mal', 0, 120, 1, CAST(N'2023-10-17T17:46:29.147' AS DateTime), CAST(N'2023-10-17T17:46:29.147' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (417, N'También normal', 0, 120, 1, CAST(N'2023-10-17T17:46:29.147' AS DateTime), CAST(N'2023-10-17T17:46:29.147' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (418, N'No es de mi gusto', 1, 120, 1, CAST(N'2023-10-17T17:46:29.147' AS DateTime), CAST(N'2023-10-17T17:46:29.147' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (419, N'Pizza', 1, 121, 1, CAST(N'2023-10-17T17:46:29.147' AS DateTime), CAST(N'2023-10-17T17:46:29.147' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (420, N'Pasta', 0, 121, 1, CAST(N'2023-10-17T17:46:29.150' AS DateTime), CAST(N'2023-10-17T17:46:29.150' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (421, N'Sushi', 0, 121, 1, CAST(N'2023-10-17T17:46:29.150' AS DateTime), CAST(N'2023-10-17T17:46:29.150' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (422, N'verdadero', 1, 122, 1, CAST(N'2023-10-17T17:46:29.150' AS DateTime), CAST(N'2023-10-17T17:46:29.150' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (423, N'falso', 0, 122, 1, CAST(N'2023-10-17T17:46:29.150' AS DateTime), CAST(N'2023-10-17T17:46:29.150' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (424, N'Viena', 0, 123, 1, CAST(N'2023-10-19T15:09:17.900' AS DateTime), CAST(N'2023-10-19T15:09:17.900' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (425, N'Praga', 1, 123, 1, CAST(N'2023-10-19T15:09:17.900' AS DateTime), CAST(N'2023-10-19T15:09:17.900' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (426, N'Budapest', 0, 123, 1, CAST(N'2023-10-19T15:09:17.900' AS DateTime), CAST(N'2023-10-19T15:09:17.900' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (427, N'Estambul', 0, 123, 1, CAST(N'2023-10-19T15:09:17.900' AS DateTime), CAST(N'2023-10-19T15:09:17.900' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (428, N'40', 0, 124, 1, CAST(N'2023-10-19T15:09:17.900' AS DateTime), CAST(N'2023-10-19T15:09:17.900' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (429, N'390', 0, 124, 1, CAST(N'2023-10-19T15:09:17.900' AS DateTime), CAST(N'2023-10-19T15:09:17.900' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (430, N'208', 1, 124, 1, CAST(N'2023-10-19T15:09:17.903' AS DateTime), CAST(N'2023-10-19T15:09:17.903' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (431, N'Cada 3 meses', 0, 125, 1, CAST(N'2023-10-19T15:09:17.903' AS DateTime), CAST(N'2023-10-19T15:09:17.903' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (432, N'Cada 6 meses', 1, 125, 1, CAST(N'2023-10-19T15:09:17.903' AS DateTime), CAST(N'2023-10-19T15:09:17.903' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (433, N'Muy delicioso', 0, 126, 1, CAST(N'2023-10-19T15:09:17.907' AS DateTime), CAST(N'2023-10-19T15:09:17.907' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (434, N'No está mal', 0, 126, 1, CAST(N'2023-10-19T15:09:17.907' AS DateTime), CAST(N'2023-10-19T15:09:17.907' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (435, N'También normal', 0, 126, 1, CAST(N'2023-10-19T15:09:17.907' AS DateTime), CAST(N'2023-10-19T15:09:17.907' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (436, N'No es de mi gusto', 1, 126, 1, CAST(N'2023-10-19T15:09:17.907' AS DateTime), CAST(N'2023-10-19T15:09:17.907' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (437, N'Pizza', 1, 127, 1, CAST(N'2023-10-19T15:09:17.907' AS DateTime), CAST(N'2023-10-19T15:09:17.907' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (438, N'Pasta', 0, 127, 1, CAST(N'2023-10-19T15:09:17.910' AS DateTime), CAST(N'2023-10-19T15:09:17.910' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (439, N'Sushi', 0, 127, 1, CAST(N'2023-10-19T15:09:17.910' AS DateTime), CAST(N'2023-10-19T15:09:17.910' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (440, N'verdadero', 1, 128, 1, CAST(N'2023-10-19T15:09:17.910' AS DateTime), CAST(N'2023-10-19T15:09:17.910' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (441, N'falso', 0, 128, 1, CAST(N'2023-10-19T15:09:17.910' AS DateTime), CAST(N'2023-10-19T15:09:17.910' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (442, N'verdadero', 1, 129, 1, CAST(N'2023-10-20T17:18:36.233' AS DateTime), CAST(N'2023-10-20T17:18:36.233' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (443, N'falso', 0, 129, 1, CAST(N'2023-10-20T17:18:36.233' AS DateTime), CAST(N'2023-10-20T17:18:36.233' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (444, N'23', 0, 130, 1, CAST(N'2023-10-20T17:19:40.707' AS DateTime), CAST(N'2023-10-20T17:19:40.707' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (445, N'24', 0, 130, 1, CAST(N'2023-10-20T17:19:40.707' AS DateTime), CAST(N'2023-10-20T17:19:40.707' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (446, N'25', 0, 130, 1, CAST(N'2023-10-20T17:19:40.707' AS DateTime), CAST(N'2023-10-20T17:19:40.707' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (447, N'26', 1, 130, 1, CAST(N'2023-10-20T17:19:40.710' AS DateTime), CAST(N'2023-10-20T17:19:40.710' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (448, N'op a', 1, 28, 1, CAST(N'2023-10-23T09:38:03.693' AS DateTime), CAST(N'2023-10-23T09:38:03.693' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (449, N'op b', 0, 28, 1, CAST(N'2023-10-23T09:38:03.693' AS DateTime), CAST(N'2023-10-23T09:38:03.693' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (450, N'op 1', 1, 131, 1, CAST(N'2023-10-23T09:43:00.320' AS DateTime), CAST(N'2023-10-23T09:43:00.320' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (451, N'op 2', 0, 131, 1, CAST(N'2023-10-23T09:43:00.320' AS DateTime), CAST(N'2023-10-23T09:43:00.320' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (452, N'op 1', 0, 132, 1, CAST(N'2023-10-23T09:43:22.633' AS DateTime), CAST(N'2023-10-23T09:43:22.633' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (453, N'op 2', 1, 132, 1, CAST(N'2023-10-23T09:43:22.633' AS DateTime), CAST(N'2023-10-23T09:43:22.633' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (454, N'Ejemplo Opcion 1', 1, 133, 1, CAST(N'2023-11-17T10:18:46.800' AS DateTime), CAST(N'2023-11-17T10:18:46.800' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (455, N'Ejemplo Opcion 2', 0, 133, 1, CAST(N'2023-11-17T10:18:46.800' AS DateTime), CAST(N'2023-11-17T10:18:46.800' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (456, N'Ejemplo Opcion 3', 0, 133, 1, CAST(N'2023-11-17T10:18:46.803' AS DateTime), CAST(N'2023-11-17T10:18:46.803' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Opcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Pregunta] ON 
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'¿Cuántos litros de sangre tiene una persona adulta?', 75, 1, CAST(N'2023-10-10T11:17:40.090' AS DateTime), CAST(N'2023-10-10T11:17:40.090' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (2, N'¿Quién es el autor de la frase "Pienso, luego existo"?', 75, 1, CAST(N'2023-10-10T11:17:40.090' AS DateTime), CAST(N'2023-10-10T11:17:40.090' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (3, N'¿Cuál es el país más grande y el más pequeño del mundo?', 75, 1, CAST(N'2023-10-10T11:17:40.090' AS DateTime), CAST(N'2023-10-10T11:17:40.090' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (4, N'¿Cuál es el grupo de palabras escritas correctamente?', 75, 1, CAST(N'2023-10-10T11:17:40.090' AS DateTime), CAST(N'2023-10-10T11:17:40.090' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (5, N'¿Cuál es el libro más vendido en el mundo después de la Biblia?', 75, 1, CAST(N'2023-10-10T11:17:40.090' AS DateTime), CAST(N'2023-10-10T11:17:40.090' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (7, N'¿Cuantos años tengo?', 76, 1, CAST(N'2023-10-10T14:47:37.737' AS DateTime), CAST(N'2023-10-10T14:47:37.737' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (8, N'¿otra nueva pregunta?', 73, 1, CAST(N'2023-10-10T17:05:59.857' AS DateTime), CAST(N'2023-10-10T17:05:59.857' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (9, N'esto es angular???', 71, 1, CAST(N'2023-10-10T17:47:08.267' AS DateTime), CAST(N'2023-10-10T17:47:08.267' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (11, N'¿Que es angular?', 76, 1, CAST(N'2023-10-11T11:19:56.037' AS DateTime), CAST(N'2023-10-11T11:19:56.037' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (13, N'¿Cuál es la capital de Hungría?', 70, 1, CAST(N'2023-10-11T11:50:46.777' AS DateTime), CAST(N'2023-10-11T11:51:01.273' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (15, N'pregunta 1', 74, 1, CAST(N'2023-10-11T12:23:04.307' AS DateTime), CAST(N'2023-10-11T12:24:16.560' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (16, N'mi nueva pregunta edit ?¿', 76, 1, CAST(N'2023-10-11T16:42:11.747' AS DateTime), CAST(N'2023-10-11T17:14:20.060' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (21, N'hola', 76, 1, CAST(N'2023-10-12T11:19:14.217' AS DateTime), CAST(N'2023-10-12T11:19:14.217' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (22, N'hola', 76, 1, CAST(N'2023-10-12T11:21:39.690' AS DateTime), CAST(N'2023-10-12T11:21:39.690' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (26, N'¿Que es Angular?', 77, 1, CAST(N'2023-10-12T16:24:35.553' AS DateTime), CAST(N'2023-10-12T16:24:35.553' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (28, N'¿preg sin opciones?', 77, 1, CAST(N'2023-10-13T11:05:40.143' AS DateTime), CAST(N'2023-10-23T09:38:03.687' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (29, N'Primera Pregunta', 78, 1, CAST(N'2023-10-13T12:14:42.557' AS DateTime), CAST(N'2023-10-13T12:14:42.557' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (30, N'Segunda Pregunta', 78, 1, CAST(N'2023-10-13T12:15:07.670' AS DateTime), CAST(N'2023-10-13T12:15:07.670' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (31, N'Tercera Pregunta', 78, 1, CAST(N'2023-10-13T12:15:47.280' AS DateTime), CAST(N'2023-10-13T12:15:47.280' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (32, N'Cuarta pregunta', 78, 1, CAST(N'2023-10-13T12:16:13.813' AS DateTime), CAST(N'2023-10-13T12:16:13.813' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (33, N'Quinta pregunta', 78, 1, CAST(N'2023-10-13T12:16:51.350' AS DateTime), CAST(N'2023-10-13T12:16:51.350' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (34, N'Sexta pregunta', 78, 1, CAST(N'2023-10-13T12:17:12.450' AS DateTime), CAST(N'2023-10-13T12:17:12.450' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (35, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy', 78, 1, CAST(N'2023-10-13T12:17:52.040' AS DateTime), CAST(N'2023-10-13T15:25:39.627' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (36, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy', 78, 1, CAST(N'2023-10-13T12:18:11.347' AS DateTime), CAST(N'2023-10-13T15:25:52.217' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (37, N'nueva', 75, 1, CAST(N'2023-10-13T12:47:06.613' AS DateTime), CAST(N'2023-10-13T12:47:27.853' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (38, N'Primera Pregunta', 79, 1, CAST(N'2023-10-13T16:10:51.033' AS DateTime), CAST(N'2023-10-13T16:11:17.440' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (43, N'¿Cuándo es mi cumpleaños?', 80, 1, CAST(N'2023-10-16T18:06:06.377' AS DateTime), CAST(N'2023-10-16T18:06:06.377' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (44, N'¿Cuántas preguntas debe tener?', 80, 1, CAST(N'2023-10-16T18:06:06.400' AS DateTime), CAST(N'2023-10-16T18:06:06.400' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (45, N'¿Cuándo es mi cumpleaños?', 66, 1, CAST(N'2023-10-17T10:58:13.613' AS DateTime), CAST(N'2023-10-17T10:58:13.613' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (46, N'¿Cuántas preguntas debe tener?', 66, 1, CAST(N'2023-10-17T10:58:13.617' AS DateTime), CAST(N'2023-10-17T10:58:13.617' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (47, N'¿Cuándo es mi cumpleaños?', 67, 1, CAST(N'2023-10-17T11:12:07.533' AS DateTime), CAST(N'2023-10-17T11:12:07.533' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (48, N'¿Cuántas preguntas debe tener?', 67, 1, CAST(N'2023-10-17T11:12:07.537' AS DateTime), CAST(N'2023-10-17T11:12:07.537' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (49, N'¿Cuándo es mi cumpleaños?', 61, 1, CAST(N'2023-10-17T11:15:42.280' AS DateTime), CAST(N'2023-10-17T11:15:42.280' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (50, N'¿Cuántas preguntas debe tener?', 61, 1, CAST(N'2023-10-17T11:15:42.283' AS DateTime), CAST(N'2023-10-17T11:15:42.283' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (51, N'¿Cuándo es mi cumpleaños?', 61, 1, CAST(N'2023-10-17T11:15:56.743' AS DateTime), CAST(N'2023-10-17T11:15:56.743' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (52, N'¿Cuántas preguntas debe tener?', 61, 1, CAST(N'2023-10-17T11:15:56.750' AS DateTime), CAST(N'2023-10-17T11:15:56.750' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (53, N'Nueva pregunta', 78, 1, CAST(N'2023-10-17T12:06:27.247' AS DateTime), CAST(N'2023-10-17T12:06:27.247' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (54, N'Otra pregunta', 78, 1, CAST(N'2023-10-17T12:06:44.873' AS DateTime), CAST(N'2023-10-17T12:06:44.873' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (55, N'¿Cuándo es mi cumpleaños?', 79, 1, CAST(N'2023-10-17T12:39:37.450' AS DateTime), CAST(N'2023-10-17T12:39:37.450' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (56, N'¿Cuántas preguntas debe tener?', 79, 1, CAST(N'2023-10-17T12:39:37.453' AS DateTime), CAST(N'2023-10-17T12:39:37.453' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (57, N'¿Cuántas preguntas debe tener?2', 79, 1, CAST(N'2023-10-17T12:40:30.073' AS DateTime), CAST(N'2023-10-17T12:40:30.073' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (58, N'¿Cuántas preguntas debe tener?3', 79, 1, CAST(N'2023-10-17T12:40:30.077' AS DateTime), CAST(N'2023-10-17T12:40:30.077' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (59, N'¿Cuántas preguntas debe tener?4', 79, 1, CAST(N'2023-10-17T12:40:30.077' AS DateTime), CAST(N'2023-10-17T12:40:30.077' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (60, N'¿Cuántas preguntas debe tener?5', 79, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (61, N'¿Cuántas preguntas debe tener?6', 79, 1, CAST(N'2023-10-17T12:40:30.080' AS DateTime), CAST(N'2023-10-17T12:40:30.080' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (62, N'¿Cuántas preguntas debe tener?7', 79, 1, CAST(N'2023-10-17T12:40:30.083' AS DateTime), CAST(N'2023-10-17T12:40:30.083' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (63, N'¿Cuántas preguntas debe tener?8', 79, 1, CAST(N'2023-10-17T12:40:30.083' AS DateTime), CAST(N'2023-10-17T12:40:30.083' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (64, N'¿Cuántas preguntas debe tener?9', 79, 1, CAST(N'2023-10-17T12:40:30.087' AS DateTime), CAST(N'2023-10-17T12:40:30.087' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (65, N'¿Cuántas preguntas debe tener?10', 79, 1, CAST(N'2023-10-17T12:40:30.087' AS DateTime), CAST(N'2023-10-17T12:40:30.087' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (66, N'¿Cuántas preguntas debe tener?11', 79, 1, CAST(N'2023-10-17T12:40:30.090' AS DateTime), CAST(N'2023-10-17T12:40:30.090' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (67, N'¿Cuántas preguntas debe tener?12', 79, 1, CAST(N'2023-10-17T12:40:30.090' AS DateTime), CAST(N'2023-10-17T12:40:30.090' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (68, N'¿Cuántas preguntas debe tener?13', 79, 1, CAST(N'2023-10-17T12:40:30.090' AS DateTime), CAST(N'2023-10-17T12:40:30.090' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (69, N'¿Cuántas preguntas debe tener?14', 79, 1, CAST(N'2023-10-17T12:40:30.093' AS DateTime), CAST(N'2023-10-17T12:40:30.093' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (70, N'¿Cuántas preguntas debe tener?15', 79, 1, CAST(N'2023-10-17T12:40:30.093' AS DateTime), CAST(N'2023-10-17T12:40:30.093' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (71, N'¿Cuántas preguntas debe tener?16', 79, 1, CAST(N'2023-10-17T12:40:30.097' AS DateTime), CAST(N'2023-10-17T12:40:30.097' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (72, N'¿Cuántas preguntas debe tener?17', 79, 1, CAST(N'2023-10-17T12:40:30.097' AS DateTime), CAST(N'2023-10-17T12:40:30.097' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (73, N'¿Cuántas preguntas debe tener?18', 79, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (74, N'¿Cuántas preguntas debe tener?19', 79, 1, CAST(N'2023-10-17T12:40:30.100' AS DateTime), CAST(N'2023-10-17T12:40:30.100' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (75, N'¿Cuántas preguntas debe tener?20', 79, 1, CAST(N'2023-10-17T12:40:30.103' AS DateTime), CAST(N'2023-10-17T12:40:30.103' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (76, N'¿Cuántas preguntas debe tener?21', 79, 1, CAST(N'2023-10-17T12:40:30.103' AS DateTime), CAST(N'2023-10-17T12:40:30.103' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (77, N'¿Cuántas preguntas debe tener?22', 79, 1, CAST(N'2023-10-17T12:40:30.103' AS DateTime), CAST(N'2023-10-17T12:40:30.103' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (78, N'¿Cuántas preguntas debe tener?23', 79, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (79, N'¿Cuántas preguntas debe tener?24', 79, 1, CAST(N'2023-10-17T12:40:30.107' AS DateTime), CAST(N'2023-10-17T12:40:30.107' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (80, N'¿Cuántas preguntas debe tener?25', 79, 1, CAST(N'2023-10-17T12:40:30.110' AS DateTime), CAST(N'2023-10-17T12:40:30.110' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (81, N'¿Cuántas preguntas debe tener?26', 79, 1, CAST(N'2023-10-17T12:40:30.110' AS DateTime), CAST(N'2023-10-17T12:40:30.110' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (82, N'¿Cuántas preguntas debe tener?27', 79, 1, CAST(N'2023-10-17T12:40:30.110' AS DateTime), CAST(N'2023-10-17T12:40:30.110' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (83, N'¿Cuántas preguntas debe tener?28', 79, 1, CAST(N'2023-10-17T12:40:30.113' AS DateTime), CAST(N'2023-10-17T12:40:30.113' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (84, N'¿Cuántas preguntas debe tener?29', 79, 1, CAST(N'2023-10-17T12:40:30.117' AS DateTime), CAST(N'2023-10-17T12:40:30.117' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (85, N'¿Cuántas preguntas debe tener?30', 79, 1, CAST(N'2023-10-17T12:40:30.117' AS DateTime), CAST(N'2023-10-17T12:40:30.117' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (86, N'¿Cuántas preguntas debe tener?31', 79, 1, CAST(N'2023-10-17T12:40:30.117' AS DateTime), CAST(N'2023-10-17T12:40:30.117' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (87, N'¿Cuántas preguntas debe tener?32', 79, 1, CAST(N'2023-10-17T12:40:30.120' AS DateTime), CAST(N'2023-10-17T12:40:30.120' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (88, N'¿Cuándo es mi cumpleaños?', 48, 1, CAST(N'2023-10-17T16:23:13.543' AS DateTime), CAST(N'2023-10-17T16:23:13.543' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (89, N'¿Cuántas preguntas debe tener?', 48, 1, CAST(N'2023-10-17T16:23:13.550' AS DateTime), CAST(N'2023-10-17T16:23:13.550' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (90, N'¿Esta es la pregunta de prueba?', 48, 1, CAST(N'2023-10-17T16:28:50.560' AS DateTime), CAST(N'2023-10-17T16:28:50.560' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (91, N'¿Esta es la pregunta de prueba?', 80, 1, CAST(N'2023-10-17T16:41:48.363' AS DateTime), CAST(N'2023-10-17T16:41:48.363' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (95, N'¿Cuál es la capital de Hungría?', 63, 1, CAST(N'2023-10-17T17:01:42.640' AS DateTime), CAST(N'2023-10-17T17:01:42.640' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (96, N'Aproximadamente, ¿cuántos huesos tiene el cuerpo humano?', 63, 1, CAST(N'2023-10-17T17:01:42.640' AS DateTime), CAST(N'2023-10-17T17:01:42.640' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (97, N'¿Cuál es su frecuencia de chequeos médicos?', 63, 1, CAST(N'2023-10-17T17:01:42.640' AS DateTime), CAST(N'2023-10-17T17:01:42.640' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (98, N'¿Cuándo es mi cumpleaños?', 63, 1, CAST(N'2023-10-17T17:01:42.643' AS DateTime), CAST(N'2023-10-17T17:01:42.643' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (99, N'¿Qué piensas sobre el plato especial del restaurante hoy?', 63, 1, CAST(N'2023-10-17T17:01:42.643' AS DateTime), CAST(N'2023-10-17T17:02:00.037' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (100, N'¿Cuál de los siguientes alimentos te gusta comer?', 63, 1, CAST(N'2023-10-17T17:01:42.647' AS DateTime), CAST(N'2023-10-17T17:01:42.647' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (101, N'¿Existen animales autótrofos.?', 63, 1, CAST(N'2023-10-17T17:01:42.650' AS DateTime), CAST(N'2023-10-17T17:01:42.650' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (102, N'¿Cuál es la capital de Hungría?', 58, 1, CAST(N'2023-10-17T17:11:55.523' AS DateTime), CAST(N'2023-10-17T17:11:55.523' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (103, N'Aproximadamente, ¿cuántos huesos tiene el cuerpo humano?', 58, 1, CAST(N'2023-10-17T17:11:55.527' AS DateTime), CAST(N'2023-10-17T17:11:55.527' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (104, N'¿Cuál es su frecuencia de chequeos médicos?', 58, 1, CAST(N'2023-10-17T17:11:55.530' AS DateTime), CAST(N'2023-10-17T17:11:55.530' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (105, N'¿Cuándo es mi cumpleaños?', 58, 1, CAST(N'2023-10-17T17:11:55.530' AS DateTime), CAST(N'2023-10-17T17:11:55.530' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (106, N'¿qué piensas sobre el plato especial del restaurante hoy?', 58, 1, CAST(N'2023-10-17T17:11:55.533' AS DateTime), CAST(N'2023-10-17T17:11:55.533' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (107, N'¿Cuál de los siguientes alimentos te gusta comer?', 58, 1, CAST(N'2023-10-17T17:11:55.533' AS DateTime), CAST(N'2023-10-17T17:11:55.533' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (108, N'¿Existen animales autótrofos.?', 58, 1, CAST(N'2023-10-17T17:11:55.533' AS DateTime), CAST(N'2023-10-17T17:11:55.533' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (109, N'¿Cuál es la capital de Hungría?', 71, 1, CAST(N'2023-10-17T17:27:15.180' AS DateTime), CAST(N'2023-10-17T17:27:15.180' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (110, N'Aproximadamente, ¿cuántos huesos tiene el cuerpo humano?', 71, 1, CAST(N'2023-10-17T17:27:15.187' AS DateTime), CAST(N'2023-10-17T17:27:15.187' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (111, N'¿Cuál es su frecuencia de chequeos médicos?', 71, 1, CAST(N'2023-10-17T17:27:15.187' AS DateTime), CAST(N'2023-10-17T17:27:15.187' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (112, N'¿Cuándo es mi cumpleaños?', 71, 1, CAST(N'2023-10-17T17:27:15.190' AS DateTime), CAST(N'2023-10-17T17:27:15.190' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (113, N'¿qué piensas sobre el plato especial del restaurante hoy?', 71, 1, CAST(N'2023-10-17T17:27:15.190' AS DateTime), CAST(N'2023-10-17T17:27:15.190' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (114, N'¿Cuál de los siguientes alimentos te gusta comer?', 71, 1, CAST(N'2023-10-17T17:27:15.193' AS DateTime), CAST(N'2023-10-17T17:27:15.193' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (115, N'¿Existen animales autótrofos.?', 71, 1, CAST(N'2023-10-17T17:27:15.193' AS DateTime), CAST(N'2023-10-17T17:27:15.193' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (116, N'¿Cuál es la capital de Hungría?', 55, 1, CAST(N'2023-10-17T17:46:29.137' AS DateTime), CAST(N'2023-10-17T17:46:29.137' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (117, N'Aproximadamente, ¿cuántos huesos tiene el cuerpo humano?', 55, 1, CAST(N'2023-10-17T17:46:29.143' AS DateTime), CAST(N'2023-10-17T17:46:29.143' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (118, N'¿Cuál es su frecuencia de chequeos médicos?', 55, 1, CAST(N'2023-10-17T17:46:29.143' AS DateTime), CAST(N'2023-10-17T17:46:29.143' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (119, N'¿Cuándo es mi cumpleaños?', 55, 1, CAST(N'2023-10-17T17:46:29.143' AS DateTime), CAST(N'2023-10-17T17:46:29.143' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (120, N'¿qué piensas sobre el plato especial del restaurante hoy?', 55, 1, CAST(N'2023-10-17T17:46:29.147' AS DateTime), CAST(N'2023-10-17T17:46:29.147' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (121, N'¿Cuál de los siguientes alimentos te gusta comer?', 55, 1, CAST(N'2023-10-17T17:46:29.147' AS DateTime), CAST(N'2023-10-17T17:46:29.147' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (122, N'¿Existen animales autótrofos.?', 55, 1, CAST(N'2023-10-17T17:46:29.150' AS DateTime), CAST(N'2023-10-17T17:46:29.150' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (123, N'¿Cuál es la capital de Hungría?', 80, 1, CAST(N'2023-10-19T15:09:17.893' AS DateTime), CAST(N'2023-10-19T15:09:17.893' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (124, N'Aproximadamente, ¿cuántos huesos tiene el cuerpo humano?', 80, 1, CAST(N'2023-10-19T15:09:17.900' AS DateTime), CAST(N'2023-10-19T15:09:17.900' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (125, N'¿Cuál es su frecuencia de chequeos médicos?', 80, 1, CAST(N'2023-10-19T15:09:17.903' AS DateTime), CAST(N'2023-10-19T15:09:17.903' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (126, N'¿qué piensas sobre el plato especial del restaurante hoy?', 80, 1, CAST(N'2023-10-19T15:09:17.907' AS DateTime), CAST(N'2023-10-19T15:09:17.907' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (127, N'¿Cuál de los siguientes alimentos te gusta comer?', 80, 1, CAST(N'2023-10-19T15:09:17.907' AS DateTime), CAST(N'2023-10-19T15:09:17.907' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (128, N'¿Existen animales autótrofos.?', 80, 1, CAST(N'2023-10-19T15:09:17.910' AS DateTime), CAST(N'2023-10-19T15:09:17.910' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (129, N'¿Esta es una pregunta?', 81, 1, CAST(N'2023-10-20T17:18:36.230' AS DateTime), CAST(N'2023-10-20T17:18:36.230' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (130, N'¿Cuantos años tengo?', 81, 1, CAST(N'2023-10-20T17:19:40.703' AS DateTime), CAST(N'2023-10-20T17:19:40.703' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (131, N'¿Hola mundo?', 77, 1, CAST(N'2023-10-23T09:43:00.320' AS DateTime), CAST(N'2023-10-23T09:43:00.320' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (132, N'mi nueva pregunta', 77, 1, CAST(N'2023-10-23T09:43:22.633' AS DateTime), CAST(N'2023-10-23T09:43:22.633' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (133, N'¿Ejemplo?', 82, 1, CAST(N'2023-11-17T10:18:46.797' AS DateTime), CAST(N'2023-11-17T10:18:46.797' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
GO
INSERT [dbo].[pruebas] ([id], [texto]) VALUES (1, N'hola')
GO
INSERT [dbo].[pruebas] ([id], [texto]) VALUES (3, N'hola')
GO
INSERT [dbo].[pruebas] ([id], [texto]) VALUES (2, N'mund')
GO
INSERT [dbo].[pruebas] ([id], [texto]) VALUES (1, N'prue')
GO
INSERT [dbo].[pruebas] ([id], [texto]) VALUES (1, N'hola')
GO
INSERT [dbo].[pruebas] ([id], [texto]) VALUES (2, N'mund')
GO
INSERT [dbo].[pruebas] ([id], [texto]) VALUES (1, N'prue')
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([idRol], [nombre], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'Administrador', 1, CAST(N'2023-09-28T12:27:31.850' AS DateTime), CAST(N'2023-09-28T12:27:31.850' AS DateTime))
GO
INSERT [dbo].[Rol] ([idRol], [nombre], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (2, N'Jugador', 1, CAST(N'2023-09-28T12:27:31.850' AS DateTime), CAST(N'2023-09-28T12:27:31.850' AS DateTime))
GO
INSERT [dbo].[Rol] ([idRol], [nombre], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (3, N'SuperAdministrador', 1, CAST(N'2023-10-26T16:22:23.810' AS DateTime), CAST(N'2023-10-26T16:22:23.810' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Sala] ON 
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (4, N'Sala 2', NULL, NULL, 1, 0, CAST(N'2023-10-02T11:03:04.783' AS DateTime), CAST(N'2023-11-06T14:14:10.287' AS DateTime), CAST(N'2023-11-06T11:23:10.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (8, N'Sala 3', NULL, NULL, 2, 0, CAST(N'2023-10-02T11:49:33.003' AS DateTime), CAST(N'2023-11-06T14:15:02.047' AS DateTime), CAST(N'2023-11-06T11:23:10.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (11, N'Sala de prueba2', NULL, N'Esta puede ser una descripcion # 1', 2, 0, CAST(N'2023-10-04T09:44:33.440' AS DateTime), CAST(N'2023-10-25T11:15:22.120' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (12, N'Sala de prueba3', NULL, N'Esta puede ser una descripcion # 3', 2, 0, CAST(N'2023-10-04T10:26:24.490' AS DateTime), CAST(N'2023-10-25T11:15:23.760' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (13, N'preuba desde angular', N'TriviaCMI1.png', N'descipcon de priuba', 1, 0, CAST(N'2023-10-04T10:38:47.937' AS DateTime), CAST(N'2023-10-25T11:15:26.210' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (15, N'Sala de prueba5', NULL, N'Esta puede ser una descripcion # 5', 2, 1, CAST(N'2023-10-04T11:02:26.907' AS DateTime), CAST(N'2023-11-13T12:36:06.603' AS DateTime), CAST(N'2023-11-13T17:06:43.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (16, N'ejemplo1', N'TriviaCMI1.png', N'descripcion deejemplo', 1, 0, CAST(N'2023-10-04T11:04:12.153' AS DateTime), CAST(N'2023-10-25T11:16:41.387' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (17, N'ejemplo3', NULL, N'angular:(', 1, 0, CAST(N'2023-10-04T11:06:45.777' AS DateTime), CAST(N'2023-10-25T11:16:49.383' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (18, N'ejemplo4', N'user-icon.png', N'angular:(', 1, 0, CAST(N'2023-10-04T11:07:29.477' AS DateTime), CAST(N'2023-10-25T11:16:51.493' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (19, N'ejemplo4', NULL, N'jajajja', 1, 0, CAST(N'2023-10-04T11:07:46.680' AS DateTime), CAST(N'2023-10-25T11:20:15.623' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (20, N'ejemplo5', N'user-icon.png', N'sdkj', 1, 0, CAST(N'2023-10-04T11:08:04.937' AS DateTime), CAST(N'2023-10-26T13:12:24.717' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (21, N'Sala de prueba 1', N'lista-computacion.jpg', NULL, 1, 0, CAST(N'2023-10-04T12:09:26.867' AS DateTime), CAST(N'2023-10-26T13:14:40.797' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (23, N'ejemplo23', N'user-icon.png', NULL, 1, 1, CAST(N'2023-10-04T12:14:02.407' AS DateTime), CAST(N'2023-10-04T12:14:02.407' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (24, N'sala 23', N'barrio.jpg', NULL, 2, 1, CAST(N'2023-10-04T12:15:13.773' AS DateTime), CAST(N'2023-10-04T12:15:13.773' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (25, N'sala de angular', N'Diseño sin título.png', NULL, 2, 1, CAST(N'2023-10-04T12:49:08.597' AS DateTime), CAST(N'2023-10-04T12:49:08.597' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (26, N'sala jajaja', N'Escudo_del_Capitan_America.png', NULL, 1, 1, CAST(N'2023-10-04T12:56:22.190' AS DateTime), CAST(N'2023-10-04T12:56:22.190' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (27, N'jaja sa1', N'cortana.png', NULL, 1, 1, CAST(N'2023-10-04T12:59:00.977' AS DateTime), CAST(N'2023-10-04T12:59:00.977' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (28, N'sala', N'asdfasdf.png', NULL, 1, 1, CAST(N'2023-10-04T13:06:31.720' AS DateTime), CAST(N'2023-10-04T13:06:31.720' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (29, N'sa1ajja', N'label.png', NULL, 1, 1, CAST(N'2023-10-04T13:07:32.543' AS DateTime), CAST(N'2023-10-04T13:07:32.543' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (30, N'sala edit otra vez', N'que es y para que sirve la hiperautomatizacion.png', N'des_edit otra vez', 1, 1, CAST(N'2023-10-04T13:08:08.287' AS DateTime), CAST(N'2023-10-04T13:08:08.287' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (31, N'jujujotrasala', N'experiencia_default.png', NULL, 1, 0, CAST(N'2023-10-04T13:11:44.240' AS DateTime), CAST(N'2023-10-16T10:18:58.787' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (32, N'juan', N'dead-pool icono.png', NULL, 1, 1, CAST(N'2023-10-04T13:21:24.247' AS DateTime), CAST(N'2023-10-04T13:21:24.247' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (33, N'jauuanuanusaa', N'descarga.png', NULL, 1, 1, CAST(N'2023-10-04T14:39:39.500' AS DateTime), CAST(N'2023-10-04T14:39:39.500' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (34, N'estasivale', N'Mesa de trabajo 12.png', NULL, 1, 0, CAST(N'2023-10-04T14:44:46.373' AS DateTime), CAST(N'2023-10-16T10:19:04.050' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (35, N'funciona', N'cat-551554_640.jpg', N'esta ves si funciona', 1, 1, CAST(N'2023-10-04T14:45:40.360' AS DateTime), CAST(N'2023-10-04T14:45:40.360' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (36, N'sdpreyba', N'thumbnail_image.png', N'esta es una descripcion', 1, 0, CAST(N'2023-10-04T15:28:40.157' AS DateTime), CAST(N'2023-10-16T10:19:09.110' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (37, N'hola miundo', N'thumbnail_image (2).png', N'<script>holamuno</script>', 1, 1, CAST(N'2023-10-04T15:29:43.757' AS DateTime), CAST(N'2023-10-04T15:29:43.757' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (38, N'Sala de prueba 1', N'6762.png', N'<script', 1, 1, CAST(N'2023-10-04T15:33:43.040' AS DateTime), CAST(N'2023-10-04T15:33:43.040' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (39, N'sala editada con img', N'Recurso 69.png', N'des_editada con img', 2, 1, CAST(N'2023-10-04T15:38:01.407' AS DateTime), CAST(N'2023-10-04T15:38:01.407' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (40, N'nada', NULL, NULL, 2, 0, CAST(N'2023-10-04T15:40:04.100' AS DateTime), CAST(N'2023-10-16T10:19:14.607' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (41, N'nueva sala', N'catedral.jpg', NULL, 2, 1, CAST(N'2023-10-05T10:11:22.573' AS DateTime), CAST(N'2023-10-05T10:11:22.573' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (42, N'sala de prueba 23', N'recursos varios.png', NULL, 1, 1, CAST(N'2023-10-05T10:18:52.717' AS DateTime), CAST(N'2023-10-05T10:18:52.717' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (43, N'sala con imagen', N'rwshpm327mzi.png', NULL, 1, 1, CAST(N'2023-10-05T10:20:49.063' AS DateTime), CAST(N'2023-10-05T10:20:49.063' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (44, N'dsadsa', N'tortuga.jpg', NULL, 1, 1, CAST(N'2023-10-05T10:22:30.147' AS DateTime), CAST(N'2023-10-05T10:22:30.147' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (45, N'nombre1', N'tortuga.jpg', NULL, 1, 1, CAST(N'2023-10-05T10:39:49.033' AS DateTime), CAST(N'2023-10-05T10:39:49.033' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (46, N'ojala salga la image', N'Escudo_del_Capitan_America.png', NULL, 1, 1, CAST(N'2023-10-05T12:27:18.393' AS DateTime), CAST(N'2023-10-05T12:27:18.393' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (48, N'juego de juegos', N'cortana png.png', NULL, 1, 0, CAST(N'2023-10-05T12:37:03.153' AS DateTime), CAST(N'2023-10-16T11:14:03.123' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (49, N'nueva sala', N'escudo 3.png', NULL, 1, 0, CAST(N'2023-10-05T12:41:52.640' AS DateTime), CAST(N'2023-10-25T11:20:00.117' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (52, N'fds', N'Recurso 69.png', N'dsad', 1, 1, CAST(N'2023-10-05T12:46:38.543' AS DateTime), CAST(N'2023-10-05T12:46:38.543' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (54, N'new', N'Recurso 31.png', NULL, 1, 1, CAST(N'2023-10-05T12:54:09.653' AS DateTime), CAST(N'2023-10-05T12:54:09.653' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (55, N'new', N'Recurso 31.png', NULL, 1, 1, CAST(N'2023-10-05T12:56:07.917' AS DateTime), CAST(N'2023-10-05T12:56:07.917' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (56, N'juana', N'Diseño sin título.png', N'dasdas', 1, 1, CAST(N'2023-10-05T12:58:38.700' AS DateTime), CAST(N'2023-10-05T12:58:38.700' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (57, N'ahora si vale', N'PORTADA GENERAL.jpg', N'jajajj :D', 1, 1, CAST(N'2023-10-05T13:02:28.690' AS DateTime), CAST(N'2023-10-05T13:02:28.690' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (58, N'otra nueva sala', N'recursos varios1.png', N'desc', 1, 1, CAST(N'2023-10-05T13:09:00.637' AS DateTime), CAST(N'2023-10-05T13:09:00.637' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (61, N'Sala desde el postma', N'moneda.png', N'desc de ejemplo', 1, 1, CAST(N'2023-10-05T14:46:03.090' AS DateTime), CAST(N'2023-10-05T14:46:03.090' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (62, N'Sala desde el postma', N'fondoCert-d9be4241-350b-429c-a0ad-154622c67080.png', N'desc de ejemplo2', 1, 1, CAST(N'2023-10-05T15:12:00.333' AS DateTime), CAST(N'2023-10-05T15:12:00.333' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (63, N'Sala desde el postma', N'Esta es una imagen de prueba de mas de cincuenta c', N'desc de ejemplo3', 1, 1, CAST(N'2023-10-05T15:16:24.150' AS DateTime), CAST(N'2023-10-05T15:16:24.150' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (64, N'Sala desde el postma', NULL, N'desc de ejemplo4', 1, 1, CAST(N'2023-10-05T15:30:10.707' AS DateTime), CAST(N'2023-10-05T15:30:10.707' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (65, N'SalaC', N'Actividades preguntados CMI.xlsx', NULL, 1, 0, CAST(N'2023-10-05T15:48:03.767' AS DateTime), CAST(N'2023-10-19T17:34:04.027' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (66, N'SalaC2', N'cambios gráfico m6 Sept26.docx', NULL, 1, 1, CAST(N'2023-10-05T15:49:27.183' AS DateTime), CAST(N'2023-10-05T15:49:27.183' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (67, N'Sala desde el postma', N'acerca de sesa.docx', N'desc de ejemplo4', 1, 1, CAST(N'2023-10-05T15:50:30.460' AS DateTime), CAST(N'2023-10-05T15:50:30.460' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (69, N'sala editada con img', NULL, N'des_editada con img', 2, 0, CAST(N'2023-10-05T16:18:11.370' AS DateTime), CAST(N'2023-10-23T09:38:24.150' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (70, N'sala editada', N'boton.png', N'desc de ejemplo4 _ edit', 1, 0, CAST(N'2023-10-05T16:28:14.560' AS DateTime), CAST(N'2023-10-23T09:38:23.160' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (71, N'postman1', N'.png', N'desc de ejemplo4', 1, 0, CAST(N'2023-10-05T16:38:43.727' AS DateTime), CAST(N'2023-10-16T10:19:38.560' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (73, N'Sala 23 juegos edit', N'cortana png.png', N'descripcion_edit', 1, 0, CAST(N'2023-10-05T16:53:27.283' AS DateTime), CAST(N'2023-10-23T09:38:21.367' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (74, N'Sala prueba edit', N'newImage_edit.png', N'esta edit', 2, 1, CAST(N'2023-10-05T18:00:37.807' AS DateTime), CAST(N'2023-11-06T14:21:51.613' AS DateTime), CAST(N'2023-11-06T11:23:10.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (75, N'Nuestros valores REI', NULL, N'N/A', 2, 0, CAST(N'2023-10-06T15:09:43.450' AS DateTime), CAST(N'2023-10-23T09:38:20.423' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (76, N'mi nueva Sala 23', N'miEmpresa.png', N'esta es una descripcion de mi nueva sala gracias.', 1, 0, CAST(N'2023-10-10T11:47:17.817' AS DateTime), CAST(N'2023-10-17T21:19:41.360' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (77, N'mi sala de Angular', N'angular.png', N'esta es mi descripcion', 2, 1, CAST(N'2023-10-12T16:22:29.607' AS DateTime), CAST(N'2023-10-27T10:07:13.370' AS DateTime), CAST(N'2023-10-27T10:07:13.370' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (78, N'Valores REIR 13 Octu', N'1597601456233.jpg', NULL, 1, 1, CAST(N'2023-10-13T12:13:45.690' AS DateTime), CAST(N'2023-11-01T15:25:00.507' AS DateTime), CAST(N'2023-11-01T15:25:00.507' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (79, N'Cadena de Suministro', NULL, NULL, 1, 0, CAST(N'2023-10-13T16:09:38.080' AS DateTime), CAST(N'2023-10-23T09:38:14.247' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (80, N'archivo excel pregun', N'cortana png.png', N'esta sala es para que las preguntas sean guardadas con un archivo de excel', 2, 1, CAST(N'2023-10-16T17:43:26.883' AS DateTime), CAST(N'2023-11-13T13:06:50.197' AS DateTime), CAST(N'2023-11-13T18:06:41.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (81, N'SalaTestVacia', NULL, N'Descripcion', 1, 0, CAST(N'2023-10-20T11:29:45.760' AS DateTime), CAST(N'2023-10-26T13:14:49.523' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (82, N'mi sala numero 23', N'MicrosoftTeams-image.png', N'Aqui me equivoque la descripcion', 2, 0, CAST(N'2023-10-27T14:48:41.037' AS DateTime), CAST(N'2023-10-27T14:50:38.060' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Sala] OFF
GO
INSERT [dbo].[SalaJuego] ([idSala], [idJugador], [iniciales], [posicion], [fecha_creacion], [fecha_modificacion], [estadoJuego]) VALUES (78, 57, N'M', 3, CAST(N'2023-11-06T17:04:47.960' AS DateTime), CAST(N'2023-11-06T17:06:06.253' AS DateTime), 1)
GO
INSERT [dbo].[SalaJuego] ([idSala], [idJugador], [iniciales], [posicion], [fecha_creacion], [fecha_modificacion], [estadoJuego]) VALUES (78, 9, N'D', 0, CAST(N'2023-11-01T15:25:42.200' AS DateTime), CAST(N'2023-11-01T15:28:20.423' AS DateTime), 1)
GO
INSERT [dbo].[SalaJuego] ([idSala], [idJugador], [iniciales], [posicion], [fecha_creacion], [fecha_modificacion], [estadoJuego]) VALUES (78, 49, N'BC', 2, CAST(N'2023-11-06T17:10:16.973' AS DateTime), CAST(N'2023-11-06T17:11:36.277' AS DateTime), 1)
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (3, 3, CAST(N'2023-10-27T17:48:50.870' AS DateTime), CAST(N'2023-10-27T17:49:00.607' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (4, 23, CAST(N'2023-10-27T17:52:51.150' AS DateTime), CAST(N'2023-10-27T17:53:37.457' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (81, 69, CAST(N'2023-10-30T09:13:25.497' AS DateTime), CAST(N'2023-10-30T09:13:25.497' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (80, 9, CAST(N'2023-10-31T11:46:15.180' AS DateTime), CAST(N'2023-11-01T15:13:10.963' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (80, 33, CAST(N'2023-11-01T12:11:26.043' AS DateTime), CAST(N'2023-11-01T15:13:56.527' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (78, 9, CAST(N'2023-11-01T15:25:32.540' AS DateTime), CAST(N'2023-11-01T15:26:56.797' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (78, 34, CAST(N'2023-11-01T15:41:10.977' AS DateTime), CAST(N'2023-11-01T15:41:10.977' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (80, 69, CAST(N'2023-11-06T15:30:23.530' AS DateTime), CAST(N'2023-11-13T13:07:41.310' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (78, 57, CAST(N'2023-11-06T17:04:29.650' AS DateTime), CAST(N'2023-11-06T17:04:29.650' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (78, 49, CAST(N'2023-11-06T17:10:06.423' AS DateTime), CAST(N'2023-11-06T17:10:06.423' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (80, 68, CAST(N'2023-11-13T13:08:14.870' AS DateTime), CAST(N'2023-11-13T13:08:14.870' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (80, 34, CAST(N'2023-11-01T15:42:25.207' AS DateTime), CAST(N'2023-11-01T15:42:25.207' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (80, 63, CAST(N'2023-11-01T15:42:59.413' AS DateTime), CAST(N'2023-11-01T15:42:59.413' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'Byron', N'Cedeño', N'david@gmail.com', N'admin', N'mifoto.jpg', 1, 1, CAST(N'2023-09-28T12:39:47.910' AS DateTime), CAST(N'2023-09-28T12:39:47.910' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (9, N'David', N'Cedeño', N'david@correo.com', N'123', NULL, 2, 1, CAST(N'2023-09-28T14:16:10.590' AS DateTime), CAST(N'2023-09-28T14:16:10.590' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (23, N'juan_editsdawea', NULL, N'juan@edit.com', N'123450', NULL, 2, 1, CAST(N'2023-09-28T15:06:23.413' AS DateTime), CAST(N'2023-09-28T17:36:44.527' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (31, N'Super', N'dd', N'qwew', N'super', NULL, 3, 1, CAST(N'2023-09-28T15:39:10.457' AS DateTime), CAST(N'2023-09-28T15:39:10.457' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (33, N'Paulina', NULL, N'Gomez', N'1234', NULL, 2, 1, CAST(N'2023-09-28T17:34:34.730' AS DateTime), CAST(N'2023-09-28T17:34:34.730' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (34, N'Benito', NULL, N'benito@correo.com', N'12345', NULL, 2, 1, CAST(N'2023-09-29T11:50:57.703' AS DateTime), CAST(N'2023-09-29T11:50:57.703' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (35, N'otro', NULL, N'ptor@correo.com', N'123456', NULL, 2, 1, CAST(N'2023-09-29T17:36:18.647' AS DateTime), CAST(N'2023-09-29T17:36:18.647' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (36, N'caicaza', NULL, N'carlos@dldld', N'1234567', NULL, 2, 1, CAST(N'2023-10-02T10:22:12.840' AS DateTime), CAST(N'2023-10-02T10:22:12.840' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (37, N'caicaza2', NULL, N'carlos2@gmail.com', N'12345678', NULL, 2, 1, CAST(N'2023-10-02T11:50:31.967' AS DateTime), CAST(N'2023-10-02T11:50:31.967' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (48, N'Admin', NULL, N'admin@admin.com', N'Admin1', NULL, 1, 1, CAST(N'2023-10-02T17:52:39.027' AS DateTime), CAST(N'2023-10-02T17:52:39.027' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (49, N'Benito Camelas', NULL, N'benito23@correo.com', N'Jugador_23', NULL, 2, 1, CAST(N'2023-10-02T18:02:58.083' AS DateTime), CAST(N'2023-10-02T18:02:58.083' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (57, N'miJugador', NULL, NULL, N'jugador123', NULL, 2, 1, CAST(N'2023-10-24T09:14:07.607' AS DateTime), CAST(N'2023-10-24T09:14:07.607' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (60, N'miJugador2', NULL, NULL, N'jugador1234', NULL, 2, 1, CAST(N'2023-10-24T09:33:09.953' AS DateTime), CAST(N'2023-10-24T09:33:09.953' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (63, N'Marie', NULL, NULL, N'45Beni#', NULL, 2, 1, CAST(N'2023-10-24T09:49:45.817' AS DateTime), CAST(N'2023-10-24T09:49:45.817' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (68, N'Ana de armas', NULL, NULL, N'23Ana.', NULL, 2, 1, CAST(N'2023-10-24T10:17:32.823' AS DateTime), CAST(N'2023-10-24T10:17:32.823' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (69, N'Dana', NULL, NULL, N'1234567890123', NULL, 2, 1, CAST(N'2023-10-24T17:41:45.367' AS DateTime), CAST(N'2023-10-24T17:41:45.367' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (74, N'caicaza', NULL, NULL, N'lms', NULL, 2, 1, CAST(N'2023-11-14T12:40:14.827' AS DateTime), CAST(N'2023-11-14T12:40:14.827' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1074, N'Byron', NULL, N'david@correo.com', NULL, NULL, 2, 1, CAST(N'2023-11-14T15:42:42.800' AS DateTime), CAST(N'2023-11-14T15:42:42.800' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1075, N'byron', NULL, N'user@correo.com', NULL, NULL, 2, 1, CAST(N'2023-11-14T15:45:11.250' AS DateTime), CAST(N'2023-11-14T15:45:11.250' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1076, N'Carlos Icaza', NULL, N'cicaza@digimentore.com.ec', NULL, NULL, 2, 1, CAST(N'2023-11-14T15:47:49.607' AS DateTime), CAST(N'2023-11-14T15:47:49.607' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1077, N'miJugador2', NULL, NULL, NULL, NULL, 2, 0, CAST(N'2023-11-14T17:39:29.193' AS DateTime), CAST(N'2023-11-14T17:39:29.193' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1079, N'miJugador_edit', NULL, N'miJugador@correo.com', N'1234567890121', NULL, 2, 0, CAST(N'2023-11-14T17:42:22.837' AS DateTime), CAST(N'2023-11-16T16:47:12.947' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1089, N'Dana', NULL, N'dana@correo.com', N'1234567890122', NULL, 2, 1, CAST(N'2023-11-16T16:16:40.520' AS DateTime), CAST(N'2023-11-16T16:16:40.520' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
INSERT [dbo].[Usuario_Sala] ([idUsuario], [idSala], [estado], [fecha_creacion], [fecha_modificacion], [puntaje], [tiempo]) VALUES (33, 80, 1, CAST(N'2023-11-01T15:16:49.653' AS DateTime), CAST(N'2023-11-01T15:16:49.653' AS DateTime), 4, 9128)
GO
INSERT [dbo].[Usuario_Sala] ([idUsuario], [idSala], [estado], [fecha_creacion], [fecha_modificacion], [puntaje], [tiempo]) VALUES (9, 80, 1, CAST(N'2023-11-01T15:16:51.300' AS DateTime), CAST(N'2023-11-01T15:16:51.300' AS DateTime), 3, 6489)
GO
INSERT [dbo].[Usuario_Sala] ([idUsuario], [idSala], [estado], [fecha_creacion], [fecha_modificacion], [puntaje], [tiempo]) VALUES (34, 80, 1, CAST(N'2023-11-01T15:44:13.733' AS DateTime), CAST(N'2023-11-01T15:44:13.733' AS DateTime), 1, 5241)
GO
INSERT [dbo].[Usuario_Sala] ([idUsuario], [idSala], [estado], [fecha_creacion], [fecha_modificacion], [puntaje], [tiempo]) VALUES (1, 80, 1, CAST(N'2023-11-06T11:40:13.167' AS DateTime), CAST(N'2023-11-06T11:40:13.167' AS DateTime), 0, 4768)
GO
INSERT [dbo].[Usuario_Sala] ([idUsuario], [idSala], [estado], [fecha_creacion], [fecha_modificacion], [puntaje], [tiempo]) VALUES (57, 78, 1, CAST(N'2023-11-06T17:06:36.820' AS DateTime), CAST(N'2023-11-06T17:06:36.820' AS DateTime), 3, 44196)
GO
INSERT [dbo].[Usuario_Sala] ([idUsuario], [idSala], [estado], [fecha_creacion], [fecha_modificacion], [puntaje], [tiempo]) VALUES (49, 78, 1, CAST(N'2023-11-06T17:11:38.293' AS DateTime), CAST(N'2023-11-06T17:11:38.293' AS DateTime), 2, 16637)
GO
INSERT [dbo].[Usuario_Sala] ([idUsuario], [idSala], [estado], [fecha_creacion], [fecha_modificacion], [puntaje], [tiempo]) VALUES (69, 80, 1, CAST(N'2023-11-13T13:04:02.473' AS DateTime), CAST(N'2023-11-13T13:04:02.473' AS DateTime), 0, 8895)
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
ALTER TABLE [dbo].[SalaJuego] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[SalaJuego] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[SalaJuego] ADD  CONSTRAINT [c_estadoJuego]  DEFAULT ((1)) FOR [estadoJuego]
GO
ALTER TABLE [dbo].[SalaReciente] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[SalaReciente] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
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
ALTER TABLE [dbo].[Usuario_Sala] ADD  CONSTRAINT [df_puntaje]  DEFAULT ((0)) FOR [puntaje]
GO
ALTER TABLE [dbo].[Usuario_Sala] ADD  CONSTRAINT [df_tiempo]  DEFAULT ((0)) FOR [tiempo]
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
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [CHK_Clave_NotEmpty] CHECK  (([Clave]<>''))
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [CHK_Clave_NotEmpty]
GO
/****** Object:  StoredProcedure [dbo].[sp_B_OpcionByIdPregunta]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_B_OpcionByIdPregunta]	
	
	@estados int,
	@idPregunta int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;
	declare @contIdPregunta int = 0
	select @contIdPregunta = COUNT(*) from Opcion where idPregunta = @idPregunta

	if(@contIdPregunta > 0)
	begin 
		
		if(@estados > 0)
		begin		
			select * from Opcion 
			where estado > 0 and
			idPregunta = @idPregunta
			order by idOpcion asc
		end
		else
		begin 
			
			select * from Opcion 
			where idPregunta = @idPregunta
			order by idOpcion asc
			
		end

		set @info = 'Encontrado'
		set @error = 0

	end
	else
	begin

		set @info = 'La pregunta no tiene opciones'
		set @error = 1

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_Pregunta]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_B_Pregunta]	
	
	@estados int,
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	if(@estados > 0)
	begin
	
		Select * from Pregunta
		where estado > 0
		order by idPregunta desc		
		
	end
	else
	begin 

		Select * from Pregunta		
		order by idPregunta desc
		
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_PreguntaById]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_B_PreguntaById]	
	
	@idPregunta int,
	@estados int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	declare @contId int = 0
	select @contId = COUNT(*) from Pregunta where idPregunta = @idPregunta

	if(@contId > 0)
	begin
		if(@estados > 0)
		begin
	
			Select * from Pregunta
			where estado > 0 and idPregunta = @idPregunta
			order by idPregunta desc		
		
		end
		else
		begin 

			Select * from Pregunta	
			where idPregunta = @idPregunta
			order by idPregunta desc
		
		end

		set @info = 'Encontrado'
		set @error = 0
	end
	else
	begin

		set @info = 'No se entontró el id de la pregunta'
		set @error = 1

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_PreguntaByIdSala]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_PreguntaByIdSala]	
	
	@idSala int,
	@estados int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	declare @contIdSala int = 0
	select @contIdSala = COUNT(*) from Pregunta where idSala = @idSala

	if(@contIdSala > 0)
	begin
		if(@estados > 0)
		begin
	
			Select * from Pregunta
			where estado > 0 and idSala = @idSala
			order by idPregunta desc		
		
		end
		else
		begin 

			Select * from Pregunta	
			where idSala = @idSala
			order by idPregunta desc
		
		end

		set @info = 'Encontrado'
		set @error = 0
	end
	else
	begin

		set @info = 'La sala no tiene preguntas'
		set @error = 1

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_Rol]    Script Date: 17/11/2023 10:29:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_Sala]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_Sala]	
	
	@estados int,
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	if(@estados > 0)
	begin		
		Select 
		s.idSala,
		s.nombre,
		ISNULL(s.imagen, 'N/A') as 'imagen',
		ISNULL(s.descripcion, 'N/A') as 'descripcion',
		mj.nombre as 'modoJuego',
		s.estado,
		(select COUNT(*) from Pregunta where idSala = s.idSala) as 'totalPreguntas',
		s.fecha_creacion,
		s.fecha_modificacion,
		s.fecha_activacion
		from Sala s inner join ModoJuego mj
		on s.idModoJuego = mj.idModoJuego
		where s.estado > 0
		order by s.idSala desc
	end
	else
	begin 
		Select 
		s.idSala,
		s.nombre,
		ISNULL(s.imagen, 'N/A') as 'imagen',
		ISNULL(s.descripcion, 'N/A') as 'descripcion',
		mj.nombre as 'modoJuego',
		s.estado,
		(select COUNT(*) from Pregunta where idSala = s.idSala) as 'totalPreguntas',
		s.fecha_creacion,
		s.fecha_modificacion,
		s.fecha_activacion
		from Sala s inner join ModoJuego mj
		on s.idModoJuego = mj.idModoJuego	
		order by s.idSala desc
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_SalaByAll]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_SalaByAll]	
	
	@buscar varchar(3),
	@estados int,
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	if(@estados > 0)
	begin		
		Select 
		s.idSala,
		s.nombre,
		ISNULL(s.imagen, 'N/A') as 'imagen',
		ISNULL(s.descripcion, 'N/A') as 'descripcion',
		mj.nombre as 'modoJuego',
		s.estado,
		(select COUNT(*) from Pregunta where idSala = s.idSala) as 'totalPreguntas',
		s.fecha_creacion,
		s.fecha_modificacion,
		s.fecha_activacion
		from Sala s inner join ModoJuego mj
		on s.idModoJuego = mj.idModoJuego
		where (s.estado > 0) and
		(s.idSala like '%'+@buscar+'%' or
		s.nombre like '%'+@buscar+'%' or
		s.descripcion like '%'+@buscar+'%' or
		mj.nombre like '%'+@buscar+'%')
		order by s.idSala desc
	end
	else
	begin 
		Select 
		s.idSala,
		s.nombre,
		ISNULL(s.imagen, 'N/A') as 'imagen',
		ISNULL(s.descripcion, 'N/A') as 'descripcion',
		mj.nombre as 'modoJuego',
		s.estado,
		(select COUNT(*) from Pregunta where idSala = s.idSala) as 'totalPreguntas',
		s.fecha_creacion,
		s.fecha_modificacion,
		s.fecha_activacion
		from Sala s inner join ModoJuego mj
		on s.idModoJuego = mj.idModoJuego
		where 
		s.idSala like '%'+@buscar+'%' or
		s.nombre like '%'+@buscar+'%' or
		s.descripcion like '%'+@buscar+'%' or
		mj.nombre like '%'+@buscar+'%'
		order by s.idSala desc
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_SalaById]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_SalaById]	
	
	@idSala int,
	@estados int,
	@idUsuario int = 0,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	declare @countIdSala int = 0, @cantJugadas int = 0
	
	select @countIdSala = COUNT(*) from Sala where idSala = @idSala	
	select @cantJugadas = COUNT(*) from Usuario_Sala where idSala = @idSala and idUsuario = @idUsuario

	
	if(@countIdSala > 0)
	begin

		if(@estados > 0)
		begin		
			Select 
			s.idSala,
			s.nombre,
			ISNULL(s.imagen, 'N/A') as 'imagen',
			ISNULL(s.descripcion, 'N/A') as 'descripcion',
			mj.idModoJuego,
			mj.nombre as 'modoJuego',
			s.estado,
			(select COUNT(*) from Pregunta where idSala = s.idSala) as 'totalPreguntas',
			@cantJugadas as 'cantJugadas',
			s.fecha_creacion,
			s.fecha_modificacion,
			s.fecha_activacion
			from Sala s inner join ModoJuego mj
			on s.idModoJuego = mj.idModoJuego
			where s.estado > 0 and s.idSala = @idSala
			order by s.idSala desc
		end
		else
		begin 
			Select 
			s.idSala,
			s.nombre,
			ISNULL(s.imagen, 'N/A') as 'imagen',
			ISNULL(s.descripcion, 'N/A') as 'descripcion',
			mj.idModoJuego,
			mj.nombre as 'modoJuego',
			s.estado,
			(select COUNT(*) from Pregunta where idSala = s.idSala) as 'totalPreguntas',
			@cantJugadas as 'cantJugadas',
			s.fecha_creacion,
			s.fecha_modificacion,
			s.fecha_activacion
			from Sala s inner join ModoJuego mj
			on s.idModoJuego = mj.idModoJuego	
			where s.idSala = @idSala
			order by s.idSala desc
		end

		set @info = 'ok'
		set @error = 0
	end
	else
	begin
		set @info = 'No existe el id de la sala'
		set @error = 1
	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_SalaJuego]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_SalaJuego]	
	
	@idSala int,
	@idJugador int,
		
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	select * from SalaJuego 
	where idSala = @idSala and idJugador <> @idJugador
	order by posicion desc	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_SalaJuegoByIds]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_B_SalaJuegoByIds]	
	
	@idSala int,
	@idJugador int,
		
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	select * from SalaJuego 
	where idSala = @idSala and idJugador = @idJugador
	order by posicion desc	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_SalaReciente]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_SalaReciente]	
	
	@estados int,
	@idJugador int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	declare @tableSala table(
		idSala int,
		nombre varchar(40),
		imagen varchar(50),
		descripcion varchar(200),
		modoJuego varchar(15),
		estado int,
		fecha_creacion datetime,
		fecha_modificacion datetime,
		fecha_activacion datetime,
		idUsuario int
	);	

	declare @idSala int, @auxIdJugador int, @fechaCreacion datetime, @fechaModificacion datetime
	
	DECLARE cur_SalaReciente CURSOR FOR 
	Select idSala, idJugador from SalaReciente

	OPEN cur_SalaReciente
	FETCH NEXT FROM cur_SalaReciente INTO @idSala, @auxIdJugador
	WHILE @@fetch_status = 0
	BEGIN
	
		Select @fechaCreacion = fecha_creacion, @fechaModificacion = fecha_modificacion 
		from SalaReciente where idSala = @idSala and idJugador = @auxIdJugador

		Insert into @tableSala (idSala,nombre,imagen,descripcion,modoJuego,estado,fecha_creacion,fecha_modificacion,fecha_activacion,idUsuario)
		select s.idSala, s.nombre, s.imagen, s.descripcion, mj.nombre, s.estado, @fechaCreacion, @fechaModificacion, s.fecha_activacion, @auxIdJugador    
		from sala s inner join ModoJuego mj on mj.idModoJuego = s.idModoJuego
		where s.idSala = @idSala					

		FETCH NEXT FROM cur_SalaReciente INTO @idSala, @auxIdJugador
	END
	CLOSE cur_SalaReciente
	DEALLOCATE cur_SalaReciente


	if(@estados > 0)
	begin

		Select top 6 * 
		from @tableSala 
		where idUsuario = @idJugador and
		estado > 0
		order by fecha_modificacion desc

	end
	else
	begin

		Select top 6 *
		from @tableSala 
		where idUsuario = @idJugador
		order by fecha_modificacion desc

	end		
	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_Usuario]    Script Date: 17/11/2023 10:29:03 ******/
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
		isnull(u.correo,'N/A') as 'correo',
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
		isnull(u.correo,'N/A') as 'correo',
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
/****** Object:  StoredProcedure [dbo].[sp_B_Usuario_SalaByIdSala]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_B_Usuario_SalaByIdSala]	
	
	@idSala int,
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
		u.nombre as 'usuario',
		r.nombre as 'rol', 
		s.idSala,
		s.nombre as 'sala',
		us.fecha_creacion,
		us.fecha_modificacion,
		us.puntaje,
		us.tiempo	
		from Usuario_Sala us
		inner join Usuario u on u.idUsuario = us.idUsuario
		inner join Sala s on s.idSala = us.idSala
		inner join Rol r on r.idRol = u.idRol
		where us.estado > 0 and us.idSala = @idSala
		order by puntaje desc, tiempo asc

	end
	else
	begin 

		Select
		u.idUsuario,
		u.nombre as 'usuario',
		r.nombre as 'rol', 
		s.idSala,
		s.nombre as 'sala',
		us.fecha_creacion,
		us.fecha_modificacion,
		us.puntaje,
		us.tiempo	
		from Usuario_Sala us
		inner join Usuario u on u.idUsuario = us.idUsuario
		inner join Sala s on s.idSala = us.idSala
		inner join Rol r on r.idRol = u.idRol
		where us.idSala = @idSala
		order by puntaje desc, tiempo asc

	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_UsuarioByAll]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_UsuarioByAll]	
	
	@buscar varchar(max),
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
		isnull(u.correo,'N/A') as 'correo',
		isnull(u.clave,'N/A') as 'clave',
		r.nombre as 'rol',
		u.estado,
		u.fecha_creacion,
		u.fecha_modificacion
		from Usuario u inner join Rol r
		on u.idRol = r.idRol
		where u.estado > 0 and 
		(u.nombre like '%'+@buscar+'%' or
		u.correo like '%'+@buscar+'%' or
		u.clave like '%'+@buscar+'%' or
		r.nombre like '%'+@buscar+'%')
		order by u.idUsuario desc

	end
	else
	begin 

		Select 
		u.idUsuario,
		u.nombre,
		isnull(u.correo,'N/A') as 'correo',
		isnull(u.clave,'N/A') as 'clave',		
		r.nombre as 'rol',
		u.estado,
		u.fecha_creacion,
		u.fecha_modificacion
		from Usuario u inner join Rol r
		on u.idRol = r.idRol	
		where
		(u.nombre like '%'+@buscar+'%' or
		u.correo like '%'+@buscar+'%' or
		u.clave like '%'+@buscar+'%' or
		r.nombre like '%'+@buscar+'%')
		order by u.idUsuario desc

	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_UsuarioById]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_UsuarioById]	
	
	@estados int,
	@idUsuario int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;
	
	declare @contUsuario int = 0
	select @contUsuario = COUNT(*) from Usuario where idUsuario = @idUsuario

	if(@contUsuario > 0)
	begin
		
		if(@estados > 0)
		begin
			Select 
			u.idUsuario,
			u.nombre,
			u.correo,
			u.clave,
			u.idRol,
			r.nombre as 'rol',
			u.estado,
			u.fecha_creacion,
			u.fecha_modificacion
			from Usuario u inner join Rol r
			on u.idRol = r.idRol
			where u.estado > 0 and u.idUsuario = @idUsuario
		end
		else
		begin 
			Select 
			u.idUsuario,
			u.nombre,
			u.correo,
			u.clave,
			u.idRol,
			r.nombre as 'rol',
			u.estado,
			u.fecha_creacion,
			u.fecha_modificacion
			from Usuario u inner join Rol r
			on u.idRol = r.idRol		
			where u.idUsuario = @idUsuario
		end

		set @info = 'Encontrado'
		set @error = 0

	end
	else
	begin
		set @info = 'No se encontró el usuario'
		set @error = 1
	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_UsuarioLogin]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_UsuarioLogin]	
	
	@nombre varchar(40),
	@correo varchar(40),
	@clave varchar(20),
	@tipoLogin int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	declare @contUsuario1 int = 0, @contUsuario2 int = 0

	select @contUsuario1 = COUNT(*) from Usuario where
	nombre = @nombre --COLLATE SQL_Latin1_General_CP1_CS_AS
	and clave = @clave --COLLATE SQL_Latin1_General_CP1_CS_AS
	and estado > 0

	select @contUsuario2 = COUNT(*) from Usuario 
	where nombre = @nombre and correo = @correo


	if(@tipoLogin = 1) -- el 1 es el login normal 
	begin

		if(@contUsuario1 > 0)
		begin
			select u.idUsuario, u.nombre, u.correo, u.clave, r.idRol, r.nombre as 'rol'
			from Usuario u
			inner join Rol r
			on u.idRol = r.idRol
			where u.nombre = @nombre and u.clave = @clave and u.estado > 0	

			set @info = 'Usuario encontrado por Login normal'
			set @error = 0
		end
		else
		begin
			set @info = 'Correo y contraseña incorrectos'
			set @error = 1
		end
		
	end
	else if(@tipoLogin = 2) -- el 2 es el login desde el LMS
	begin
		
		if(@contUsuario2 > 0)
		begin

			select u.idUsuario, u.nombre, u.correo, u.clave, r.idRol, r.nombre as 'rol'
			from Usuario u
			inner join Rol r
			on u.idRol = r.idRol
			where u.nombre = @nombre and u.correo = @correo			

			set @info = 'Usuario encontrado por el LMS'
			set @error = 0
		end
		else
		begin
			
			BEGIN TRY  
			
				Insert into Usuario (nombre,correo,idRol) values
				(NULLIF(@nombre, ''),
				NULLIF(@correo, ''),				
				2)

				select u.idUsuario, u.nombre, u.correo, u.clave, r.idRol, r.nombre as 'rol'
				from Usuario u
				inner join Rol r
				on u.idRol = r.idRol
				where u.idUsuario = SCOPE_IDENTITY();				

				set @info = 'Usuario registrado y encontrado'
				set @error = 0

			END TRY
			BEGIN CATCH	

				set @info = ERROR_MESSAGE()
				set @error = 1

			END CATCH;	

		end
		
	end
	else
	begin

		set @info = 'Incorrecto el tipo de Iniciar Sesion'
		set @error = 1

	end
	

	print @info
END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Opcion]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Opcion] 
	
	@nombre varchar(150),
	@correcta int,
	@idPregunta int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;	
	declare @contNombre int = 0, @contOpcion int = 0, @idOpcion int = 0 	
	select @contNombre = COUNT(*), @idOpcion = idOpcion from Opcion where idPregunta = @idPregunta and nombre = @nombre group by idOpcion
	select @contOpcion = COUNT(*) from Opcion where idPregunta = @idPregunta

	BEGIN TRY  
		if(@contNombre > 0)
		begin 

			Update Opcion set nombre = @nombre where idOpcion = @idOpcion and idPregunta = @idPregunta
			set @info = CONCAT('Registro editado satisfactoriamente, id creado: ',@idOpcion)
			set @error = 0

		end
		else
		begin
			
			if(@contOpcion < 4)
			begin
				
				Insert into Opcion(nombre, correcta, idPregunta) values
				(NULLIF(@nombre, ''),
				@correcta,
				@idPregunta);

				set @info = CONCAT('Registro creado satisfactoriamente, id creado: ',SCOPE_IDENTITY())
				set @error = 0

			end
			else
			begin
				set @info = CONCAT('Maximo cuatro opciones, id creado: ',0)
				set @error = 1
			end

		end

		

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Pregunta]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Pregunta] 
	
	@nombre varchar(150),
	@idSala int,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;	
	declare @contNombre int = 0, @idPregunta int = 0 	
	select @contNombre = COUNT(*), @idPregunta = idPregunta from Pregunta where idSala = @idSala and nombre = @nombre group by idPregunta

	BEGIN TRY
		if(@contNombre > 0)
		begin 
			
			Update Pregunta set nombre = @nombre where idPregunta = @idPregunta and idSala = @idSala
			set @info = CONCAT('Registro editado satisfactoriamente, idPregunta: ',@idPregunta)
			set @error = 0
						
		end
		else
		begin
			
			Insert into Pregunta(nombre, idSala) values
			(NULLIF(@nombre, ''),
			@idSala);

			set @info = CONCAT('Registro creado satisfactoriamente, idPregunta: ',SCOPE_IDENTITY())
			set @error = 0

		end				

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Sala]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Sala] 
	
	@nombre varchar(20),			
	@imagen varchar(50),
	@descripcion varchar(200),
	@idModoJuego int,		

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
		
	BEGIN TRY  
		Insert into Sala (nombre, imagen, descripcion, idModoJuego, estado, fecha_activacion) values
		(NULLIF(@nombre, ''),
		NULLIF(@imagen, ''),
		NULLIF(@descripcion, ''),		
		@idModoJuego,
		0,
		'1800-01-01 00:00:00');

		set @info = 'Registro creado satisfactoriamente'
		set @error = 0

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;					

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_SalaJuego]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_SalaJuego] 
	
	@idSala int,
	@idJugador int,
	@iniciales varchar(5),	
	
	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;	

	declare @countJugador int = 0
	select @countJugador = COUNT(*) from SalaJuego where idSala = @idSala and idJugador = @idJugador

	BEGIN TRY  

		if(@countJugador > 0)
		begin

			update SalaJuego
			set posicion = 0, fecha_modificacion = GETDATE()
			where idSala = @idSala and idJugador = @idJugador

			set @info = 'Registro editado satisfactoriamente'
			set @error = 0

		end
		else
		begin

			insert into SalaJuego (idSala, idJugador, iniciales, posicion) values 
			(@idSala, @idJugador, @iniciales, 0)

			set @info = 'Registro creado satisfactoriamente'
			set @error = 0

		end			
		
	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_SalaReciente]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_SalaReciente] 
		
	@idSala int,		
	@idJugador int,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;	

	declare @contSala int = 0
	select @contSala = COUNT(*) from SalaReciente where idSala = @idSala and idJugador = @idJugador
	
		
	BEGIN TRY  
		if(@contSala > 0)
		begin 

			Update 
			SalaReciente set fecha_modificacion = GETDATE() 
			where idSala = @idSala and idJugador = @idJugador

			set @info = 'Registro editado satisfactoriamente'
			set @error = 0

		end
		else
		begin

			Insert into SalaReciente (idSala, idJugador) values
			(@idSala,@idJugador)

			set @info = 'Registro creado satisfactoriamente'
			set @error = 0

		end				

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;					

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Usuario]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Usuario] 
	
	@nombre varchar(60),
	@apellido varchar(15) = null,
	@correo varchar(40) = null,
	@clave varchar(20),
	@foto varchar(50) = null,
	@idRol int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;

	Declare @contClave int = 0, @contCorreo int = 0
	Select @contClave = COUNT(*) from Usuario where clave = @clave
	Select @contCorreo = COUNT(*) from Usuario where correo = @correo

	if(@contClave > 0)
	begin
		
		set @info = 'El DPI ya está registrado, clave'
		set @error = 1

	end
	else if((@correo <> '' or @correo <> null) and @contCorreo > 0)
	begin
		
		set @info = 'El Correo ya está registrado, correo'
		set @error = 1

	end
	else if(len(@nombre) > 60)
	begin
		
		set @info = 'El nombre y apellido solo se permite máximo 60 caracteres incluyendo espacios en blanco, nombre'
		set @error = 1

	end
	else
	begin

		BEGIN TRY  
			Insert into Usuario (nombre, apellido, correo, clave, foto, idRol) values
			(NULLIF(@nombre, ''),
			NULLIF(@apellido, ''),
			NULLIF(@correo, ''),
			@clave,
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
/****** Object:  StoredProcedure [dbo].[sp_C_Usuario_Sala]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Usuario_Sala] 
	
	@idUsuario int,
	@idSala int,
	@puntaje int,
	@tiempo int,
	
	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;		

	declare @contUsuarioSala int = 0
	select @contUsuarioSala = COUNT(*) from Usuario_Sala where idUsuario = @idUsuario and idSala = @idSala
	
	BEGIN TRY  
		if(@contUsuarioSala > 0)
		begin

			Update Usuario_Sala set 
			puntaje = @puntaje,
			tiempo = @tiempo,
			fecha_modificacion = GETDATE()
			where idUsuario = @idUsuario and idSala = @idSala

			set @info = 'Registro editado satisfactoriamente'
			set @error = 0

		end
		else
		begin
			
			Insert into Usuario_Sala (idUsuario, idSala, puntaje, tiempo) values
			(@idUsuario, @idSala, @puntaje, @tiempo)

			set @info = 'Registro creado satisfactoriamente'
			set @error = 0

		end		

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;					

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_D_OpcionByIdPregunta]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_D_OpcionByIdPregunta] 
	
	@idPregunta int,
	@idOpcion int,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;	

	Delete from Opcion 
	where idPregunta = @idPregunta and
	idOpcion > @idOpcion
	
	if(@@ROWCOUNT > 0)
	begin
		set @info = 'Registros eliminados satisfactoriamente'
	end
	else
	begin
		set @info = 'Ningún registro eliminado'
	end
	
	set @error = 0

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_D_Pregunta]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_D_Pregunta] 
	
	@idPregunta int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
	
	declare @countIdPregunta int = 0, @idSala int = 0, @contPregunta int = 0
	select @countIdPregunta = COUNT(*), @idSala = idSala from Pregunta where idPregunta = @idPregunta  group by idSala		
	
	if(@countIdPregunta > 0)
	begin 

		BEGIN TRY
			Delete from Opcion
			where idPregunta = @idPregunta;

			Delete from Pregunta		
			where idPregunta = @idPregunta;

			set @info = 'Registro eliminado satisfactoriamente'
			set @error = 0

			select @contPregunta = COUNT(*) from Pregunta where idSala = @idSala

			if(@contPregunta < 5)
			begin
				Update Sala set estado = 0 where idSala = @idSala
			end

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;	

	end
	else
	begin		

		set @info = 'No se pudo eliminar'
		set @error = 1

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_D_Sala]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_D_Sala] 
	
	@idSala int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
	
	declare @countIdSala int = 0, @idPregunta int = 0
	select @countIdSala = COUNT(*) from Sala where idSala = @idSala	

	if(@countIdSala > 0)
	begin 

		BEGIN TRY
			-- INICIO CURSOR			
			DECLARE cur_pregunta CURSOR FOR 
			select idPregunta from Pregunta where idSala = @idSala
			OPEN cur_pregunta
			FETCH NEXT FROM cur_pregunta INTO @idPregunta
			WHILE @@fetch_status = 0
			BEGIN
				--PRINT @idPregunta
				Delete from Opcion where idPregunta = @idPregunta;

				FETCH NEXT FROM cur_pregunta INTO @idPregunta
			END
			CLOSE cur_pregunta
			DEALLOCATE cur_pregunta
			-- FIN CURSOR			

			Delete from Pregunta		
			where idSala = @idSala;

			Delete from SalaReciente
			where idSala = @idSala;

			Delete from Usuario_Sala
			where idSala = @idSala;

			Delete from SalaJuego
			where idSala = @idSala;			

			Delete from Sala
			where idSala = @idSala
			

			set @info = 'Registro eliminado satisfactoriamente'
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;	

	end
	else
	begin		

		set @info = 'No se pudo eliminar'
		set @error = 1

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_D_Usuario]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_D_Usuario] 
	
	@idUsuario int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
	
	declare @countIdUsuario int = 0
	select @countIdUsuario = COUNT(*) from Usuario where idUsuario = @idUsuario

	if(@countIdUsuario > 0)
	begin 

		BEGIN TRY								

			Delete from SalaJuego
			where idJugador = @idUsuario;

			Delete from SalaReciente
			where idJugador = @idUsuario;

			Delete from Usuario_Sala
			where idUsuario = @idUsuario;

			Delete from Usuario
			where idUsuario = @idUsuario;			
			
			set @info = 'Registro eliminado satisfactoriamente'
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;	

	end
	else
	begin		

		set @info = 'No se pudo eliminar'
		set @error = 1

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_Opcion]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_Opcion] 
	
	@idOpcion int,
	@nombre varchar(150),
	@correcta int,	
	@idPregunta int,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;	
	declare @contIdOpcion int = 0, @info_C_opcion varchar(max), @error_C_opcion int
	select @contIdOpcion = COUNT(*) from Opcion where idOpcion = @idOpcion

	if(@contIdOpcion > 0)
	begin
		
		BEGIN TRY  
			Update Opcion set 
			nombre = NULLIF(@nombre, ''),
			correcta = @correcta,			
			fecha_modificacion = GETDATE()
			where idOpcion = @idOpcion

			set @info = CONCAT('Registro editado satisfactoriamente, id editado: ',@idOpcion)
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;

		print @info
	end
	else
	begin
		
		exec sp_C_Opcion	
		@nombre = @nombre,	
		@correcta = @correcta,	
		@idPregunta = @idPregunta,	
		@info = @info_C_opcion output,
		@error = @error_C_opcion output
		
		set @info = @info_C_opcion
		set @error = @error_C_opcion

	end		
	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_Pregunta]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_Pregunta] 
	
	@idPregunta int,
	@nombre varchar(150),	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;		

	BEGIN TRY  
		Update Pregunta set 
		nombre = NULLIF(@nombre, ''),		
		fecha_modificacion = GETDATE()
		where idPregunta = @idPregunta;

		set @info = 'Registro editado satisfactoriamente'
		set @error = 0

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_Sala]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_Sala] 
	
	@idSala int,
	@nombre varchar(20),
	@imagen varchar(50),
	@descripcion varchar(200),
	@idModoJuego int,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
	
	declare @contIdSala int = 0, @oldImage varchar(50) = 'N/A'	
	select @contIdSala = COUNT(*), @oldImage = ISNULL(imagen, 'N/A') from Sala where idSala = @idSala group by imagen
	
	if(@contIdSala > 0)
	begin
		BEGIN TRY  
			Update Sala set 
			nombre = NULLIF(@nombre, ''),
			imagen = case @imagen when '' then imagen else @imagen end,
			descripcion = NULLIF(@descripcion, ''),		
			idModoJuego = @idModoJuego,
			fecha_modificacion = GETDATE()
			where idSala = @idSala		

			set @info = 'Registro editado satisfactoriamente, old_image: '+@oldImage
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;
	end
	else
	begin
		set @info = 'No se encontró el id de la Sala'
		set @error = 1
	end						

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_SalaByEstado]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_SalaByEstado] 
	
	@idSala int,
	@estado int,
	@fechaActivacion datetime,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
	
	declare @contIdSala int = 0
	select @contIdSala = COUNT(*) from Sala where idSala = @idSala
	
	if(@contIdSala > 0)
	begin
		BEGIN TRY  

			if(@estado > 0)
			begin

				Update Sala set 
				estado = @estado,			
				fecha_modificacion = GETDATE(),
				fecha_activacion = @fechaActivacion
				where idSala = @idSala	

			end
			else
			begin

				Update Sala set 
				estado = @estado,			
				fecha_modificacion = GETDATE()				
				where idSala = @idSala


				Delete from SalaJuego
				where idSala = @idSala

			end
				

			set @info = 'Registro editado satisfactoriamente'
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;
	end
	else
	begin
		set @info = 'No se encontró el id de la Sala'
		set @error = 1
	end						

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_SalaJuego]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_SalaJuego] 
	
	@idSala int,
	@idJugador int,
	@estadoJuego int,

	@info varchar(max) output,
	@error int output
AS
BEGIN	

	SET NOCOUNT ON;	

	declare @posicion int = 0
	select @posicion = posicion from SalaJuego where idSala = @idSala	and idJugador = @idJugador

	if(@estadoJuego > 0)
	begin
		set @posicion += 1	
	end	

	BEGIN TRY  
		Update SalaJuego set 
		posicion = @posicion, 
		estadoJuego = @estadoJuego,
		fecha_modificacion = GETDATE()
		where idSala = @idSala and
		idJugador = @idJugador			   		

		set @info = 'Registro editado satisfactoriamente'
		set @error = 0

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;

	print @info
	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_Usuario]    Script Date: 17/11/2023 10:29:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_Usuario] 
	
	@idUsuario int, 
	@nombre varchar(60),
	@apellido varchar(15) = null,
	@correo varchar(40),
	@clave varchar(20),
	@foto varchar(50) = null,
	@idRol int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;

	Declare @contCorreo int = 0, @contClave int = 0, @contRolAdmin int = 0, @auxIdRol int = 0
	Select @contCorreo = COUNT(*) from Usuario where correo = @correo and idUsuario <> @idUsuario
	Select @contClave = COUNT(*) from Usuario where clave = @clave and idUsuario <> @idUsuario
	Select @contRolAdmin = COUNT(*) from Usuario where idRol = 1 or idRol = 3
	Select @auxIdRol = idRol from Usuario where idUsuario = @idUsuario	
	
	--if(@idRol = 2 and @contRolAdmin = 1)

	if(@contClave > 0)
	begin
		set @info = 'El dpi ya esta registrado, clave'
		set @error = 1
	end
	else if(@contCorreo > 0)
	begin 
		set @info = 'El correo electornico ya esta registrado, correo'
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
