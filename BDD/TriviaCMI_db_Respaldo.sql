USE [TriviaCMI_db]
GO
/****** Object:  Table [dbo].[ModoJuego]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  Table [dbo].[Opcion]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  Table [dbo].[Pregunta]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  Table [dbo].[Sala]    Script Date: 13/10/2023 17:11:17 ******/
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
PRIMARY KEY CLUSTERED 
(
	[idSala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  Table [dbo].[Usuario_Sala]    Script Date: 13/10/2023 17:11:17 ******/
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
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (28, N'¿preg sin opciones?', 77, 1, CAST(N'2023-10-13T11:05:40.143' AS DateTime), CAST(N'2023-10-13T11:05:40.143' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([idRol], [nombre], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'Administrador', 1, CAST(N'2023-09-28T12:27:31.850' AS DateTime), CAST(N'2023-09-28T12:27:31.850' AS DateTime))
GO
INSERT [dbo].[Rol] ([idRol], [nombre], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (2, N'Jugador', 1, CAST(N'2023-09-28T12:27:31.850' AS DateTime), CAST(N'2023-09-28T12:27:31.850' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Sala] ON 
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (4, N'Sala 2', NULL, NULL, 1, 1, CAST(N'2023-10-02T11:03:04.783' AS DateTime), CAST(N'2023-10-02T11:03:04.783' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (8, N'Sala 3', NULL, NULL, 2, 1, CAST(N'2023-10-02T11:49:33.003' AS DateTime), CAST(N'2023-10-02T11:49:33.003' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (10, N'hola mundo', N'TriviaCMI1.png', N'esra es una descripcion', 1, 0, CAST(N'2023-10-04T09:40:34.530' AS DateTime), CAST(N'2023-10-13T15:22:53.373' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (11, N'Sala de prueba2', NULL, N'Esta puede ser una descripcion # 1', 2, 1, CAST(N'2023-10-04T09:44:33.440' AS DateTime), CAST(N'2023-10-04T09:44:33.440' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (12, N'Sala de prueba3', NULL, N'Esta puede ser una descripcion # 3', 2, 1, CAST(N'2023-10-04T10:26:24.490' AS DateTime), CAST(N'2023-10-04T10:26:24.490' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (13, N'preuba desde angular', N'TriviaCMI1.png', N'descipcon de priuba', 1, 1, CAST(N'2023-10-04T10:38:47.937' AS DateTime), CAST(N'2023-10-04T10:38:47.937' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (15, N'Sala de prueba5', NULL, N'Esta puede ser una descripcion # 5', 2, 1, CAST(N'2023-10-04T11:02:26.907' AS DateTime), CAST(N'2023-10-04T11:02:26.907' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (16, N'ejemplo1', N'TriviaCMI1.png', N'descripcion deejemplo', 1, 1, CAST(N'2023-10-04T11:04:12.153' AS DateTime), CAST(N'2023-10-04T11:04:12.153' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (17, N'ejemplo3', NULL, N'angular:(', 1, 1, CAST(N'2023-10-04T11:06:45.777' AS DateTime), CAST(N'2023-10-04T11:06:45.777' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (18, N'ejemplo4', N'user-icon.png', N'angular:(', 1, 1, CAST(N'2023-10-04T11:07:29.477' AS DateTime), CAST(N'2023-10-04T11:07:29.477' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (19, N'ejemplo4', NULL, N'jajajja', 1, 1, CAST(N'2023-10-04T11:07:46.680' AS DateTime), CAST(N'2023-10-04T11:07:46.680' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (20, N'ejemplo5', N'user-icon.png', N'sdkj', 1, 1, CAST(N'2023-10-04T11:08:04.937' AS DateTime), CAST(N'2023-10-04T11:08:04.937' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (21, N'Sala de prueba 1', N'lista-computacion.jpg', NULL, 1, 1, CAST(N'2023-10-04T12:09:26.867' AS DateTime), CAST(N'2023-10-04T12:09:26.867' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (23, N'ejemplo23', N'user-icon.png', NULL, 1, 1, CAST(N'2023-10-04T12:14:02.407' AS DateTime), CAST(N'2023-10-04T12:14:02.407' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (24, N'sala 23', N'barrio.jpg', NULL, 2, 1, CAST(N'2023-10-04T12:15:13.773' AS DateTime), CAST(N'2023-10-04T12:15:13.773' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (25, N'sala de angular', N'Diseño sin título.png', NULL, 2, 1, CAST(N'2023-10-04T12:49:08.597' AS DateTime), CAST(N'2023-10-04T12:49:08.597' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (26, N'sala jajaja', N'Escudo_del_Capitan_America.png', NULL, 1, 1, CAST(N'2023-10-04T12:56:22.190' AS DateTime), CAST(N'2023-10-04T12:56:22.190' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (27, N'jaja sa1', N'cortana.png', NULL, 1, 1, CAST(N'2023-10-04T12:59:00.977' AS DateTime), CAST(N'2023-10-04T12:59:00.977' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (28, N'sala', N'asdfasdf.png', NULL, 1, 1, CAST(N'2023-10-04T13:06:31.720' AS DateTime), CAST(N'2023-10-04T13:06:31.720' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (29, N'sa1ajja', N'label.png', NULL, 1, 1, CAST(N'2023-10-04T13:07:32.543' AS DateTime), CAST(N'2023-10-04T13:07:32.543' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (30, N'sala edit otra vez', N'que es y para que sirve la hiperautomatizacion.png', N'des_edit otra vez', 1, 1, CAST(N'2023-10-04T13:08:08.287' AS DateTime), CAST(N'2023-10-04T13:08:08.287' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (31, N'jujujotrasala', N'experiencia_default.png', NULL, 1, 1, CAST(N'2023-10-04T13:11:44.240' AS DateTime), CAST(N'2023-10-04T13:11:44.240' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (32, N'juan', N'dead-pool icono.png', NULL, 1, 1, CAST(N'2023-10-04T13:21:24.247' AS DateTime), CAST(N'2023-10-04T13:21:24.247' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (33, N'jauuanuanusaa', N'descarga.png', NULL, 1, 1, CAST(N'2023-10-04T14:39:39.500' AS DateTime), CAST(N'2023-10-04T14:39:39.500' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (34, N'estasivale', N'Mesa de trabajo 12.png', NULL, 1, 1, CAST(N'2023-10-04T14:44:46.373' AS DateTime), CAST(N'2023-10-04T14:44:46.373' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (35, N'funciona', N'cat-551554_640.jpg', N'esta ves si funciona', 1, 1, CAST(N'2023-10-04T14:45:40.360' AS DateTime), CAST(N'2023-10-04T14:45:40.360' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (36, N'sdpreyba', N'thumbnail_image.png', N'esta es una descripcion', 1, 1, CAST(N'2023-10-04T15:28:40.157' AS DateTime), CAST(N'2023-10-04T15:28:40.157' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (37, N'hola miundo', N'thumbnail_image (2).png', N'<script>holamuno</script>', 1, 1, CAST(N'2023-10-04T15:29:43.757' AS DateTime), CAST(N'2023-10-04T15:29:43.757' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (38, N'Sala de prueba 1', N'6762.png', N'<script', 1, 1, CAST(N'2023-10-04T15:33:43.040' AS DateTime), CAST(N'2023-10-04T15:33:43.040' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (39, N'sala editada con img', N'Recurso 69.png', N'des_editada con img', 2, 1, CAST(N'2023-10-04T15:38:01.407' AS DateTime), CAST(N'2023-10-04T15:38:01.407' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (40, N'nada', NULL, NULL, 2, 1, CAST(N'2023-10-04T15:40:04.100' AS DateTime), CAST(N'2023-10-04T15:40:04.100' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (41, N'nueva sala', N'catedral.jpg', NULL, 2, 1, CAST(N'2023-10-05T10:11:22.573' AS DateTime), CAST(N'2023-10-05T10:11:22.573' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (42, N'sala de prueba 23', N'recursos varios.png', NULL, 1, 1, CAST(N'2023-10-05T10:18:52.717' AS DateTime), CAST(N'2023-10-05T10:18:52.717' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (43, N'sala con imagen', N'rwshpm327mzi.png', NULL, 1, 1, CAST(N'2023-10-05T10:20:49.063' AS DateTime), CAST(N'2023-10-05T10:20:49.063' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (44, N'dsadsa', N'tortuga.jpg', NULL, 1, 1, CAST(N'2023-10-05T10:22:30.147' AS DateTime), CAST(N'2023-10-05T10:22:30.147' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (45, N'nombre1', N'tortuga.jpg', NULL, 1, 1, CAST(N'2023-10-05T10:39:49.033' AS DateTime), CAST(N'2023-10-05T10:39:49.033' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (46, N'ojala salga la image', N'Escudo_del_Capitan_America.png', NULL, 1, 1, CAST(N'2023-10-05T12:27:18.393' AS DateTime), CAST(N'2023-10-05T12:27:18.393' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (48, N'juego de juegos', N'cortana png.png', NULL, 1, 1, CAST(N'2023-10-05T12:37:03.153' AS DateTime), CAST(N'2023-10-05T12:37:03.153' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (49, N'nueva sala', N'escudo 3.png', NULL, 1, 1, CAST(N'2023-10-05T12:41:52.640' AS DateTime), CAST(N'2023-10-05T12:41:52.640' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (52, N'fds', N'Recurso 69.png', N'dsad', 1, 1, CAST(N'2023-10-05T12:46:38.543' AS DateTime), CAST(N'2023-10-05T12:46:38.543' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (54, N'new', N'Recurso 31.png', NULL, 1, 1, CAST(N'2023-10-05T12:54:09.653' AS DateTime), CAST(N'2023-10-05T12:54:09.653' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (55, N'new', N'Recurso 31.png', NULL, 1, 1, CAST(N'2023-10-05T12:56:07.917' AS DateTime), CAST(N'2023-10-05T12:56:07.917' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (56, N'juana', N'Diseño sin título.png', N'dasdas', 1, 1, CAST(N'2023-10-05T12:58:38.700' AS DateTime), CAST(N'2023-10-05T12:58:38.700' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (57, N'ahora si vale', N'PORTADA GENERAL.jpg', N'jajajj :D', 1, 1, CAST(N'2023-10-05T13:02:28.690' AS DateTime), CAST(N'2023-10-05T13:02:28.690' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (58, N'otra nueva sala', N'recursos varios1.png', N'desc', 1, 1, CAST(N'2023-10-05T13:09:00.637' AS DateTime), CAST(N'2023-10-05T13:09:00.637' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (61, N'Sala desde el postma', N'moneda.png', N'desc de ejemplo', 1, 1, CAST(N'2023-10-05T14:46:03.090' AS DateTime), CAST(N'2023-10-05T14:46:03.090' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (62, N'Sala desde el postma', N'fondoCert-d9be4241-350b-429c-a0ad-154622c67080.png', N'desc de ejemplo2', 1, 1, CAST(N'2023-10-05T15:12:00.333' AS DateTime), CAST(N'2023-10-05T15:12:00.333' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (63, N'Sala desde el postma', N'Esta es una imagen de prueba de mas de cincuenta c', N'desc de ejemplo3', 1, 1, CAST(N'2023-10-05T15:16:24.150' AS DateTime), CAST(N'2023-10-05T15:16:24.150' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (64, N'Sala desde el postma', NULL, N'desc de ejemplo4', 1, 1, CAST(N'2023-10-05T15:30:10.707' AS DateTime), CAST(N'2023-10-05T15:30:10.707' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (65, N'SalaC', N'Actividades preguntados CMI.xlsx', NULL, 1, 1, CAST(N'2023-10-05T15:48:03.767' AS DateTime), CAST(N'2023-10-05T15:48:03.767' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (66, N'SalaC2', N'cambios gráfico m6 Sept26.docx', NULL, 1, 1, CAST(N'2023-10-05T15:49:27.183' AS DateTime), CAST(N'2023-10-05T15:49:27.183' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (67, N'Sala desde el postma', N'acerca de sesa.docx', N'desc de ejemplo4', 1, 1, CAST(N'2023-10-05T15:50:30.460' AS DateTime), CAST(N'2023-10-05T15:50:30.460' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (69, N'sala editada con img', NULL, N'des_editada con img', 2, 1, CAST(N'2023-10-05T16:18:11.370' AS DateTime), CAST(N'2023-10-05T16:18:11.370' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (70, N'sala editada', N'boton.png', N'desc de ejemplo4 _ edit', 1, 1, CAST(N'2023-10-05T16:28:14.560' AS DateTime), CAST(N'2023-10-05T16:28:14.560' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (71, N'postman1', N'.png', N'desc de ejemplo4', 1, 1, CAST(N'2023-10-05T16:38:43.727' AS DateTime), CAST(N'2023-10-05T16:38:43.727' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (73, N'Sala 23 juegos edit', N'cortana png.png', N'descripcion_edit', 1, 1, CAST(N'2023-10-05T16:53:27.283' AS DateTime), CAST(N'2023-10-05T16:53:27.283' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (74, N'Sala prueba edit', N'newImage_edit.png', N'esta edit', 2, 1, CAST(N'2023-10-05T18:00:37.807' AS DateTime), CAST(N'2023-10-05T18:00:37.807' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (75, N'Nuestros valores REI', NULL, N'N/A', 2, 1, CAST(N'2023-10-06T15:09:43.450' AS DateTime), CAST(N'2023-10-06T15:09:43.450' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (76, N'mi nueva Sala 23', N'miEmpresa.png', N'esta es una descripcion de mi nueva sala gracias.', 1, 1, CAST(N'2023-10-10T11:47:17.817' AS DateTime), CAST(N'2023-10-10T11:47:17.817' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (77, N'mi sala de Angular', N'angular.png', N'esta es mi descripcion', 2, 1, CAST(N'2023-10-12T16:22:29.607' AS DateTime), CAST(N'2023-10-12T16:22:29.607' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (78, N'Valores REIR 13 Octu', N'1597601456233.jpg', NULL, 1, 1, CAST(N'2023-10-13T12:13:45.690' AS DateTime), CAST(N'2023-10-13T12:13:45.690' AS DateTime))
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (79, N'Cadena de Suministro', NULL, NULL, 1, 1, CAST(N'2023-10-13T16:09:38.080' AS DateTime), CAST(N'2023-10-13T16:09:38.080' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Sala] OFF
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
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (31, N'cc', N'dd', N'qwew', N'd', NULL, 2, 0, CAST(N'2023-09-28T15:39:10.457' AS DateTime), CAST(N'2023-09-28T15:39:10.457' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (33, N'Paulina', NULL, N'Gomez', N'123', NULL, 2, 1, CAST(N'2023-09-28T17:34:34.730' AS DateTime), CAST(N'2023-09-28T17:34:34.730' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (34, N'Benito', NULL, N'benito@correo.com', N'12345', NULL, 2, 1, CAST(N'2023-09-29T11:50:57.703' AS DateTime), CAST(N'2023-09-29T11:50:57.703' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (35, N'otro', NULL, N'ptor@correo.com', N'123456', NULL, 2, 1, CAST(N'2023-09-29T17:36:18.647' AS DateTime), CAST(N'2023-09-29T17:36:18.647' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (36, N'caicaza', NULL, N'carlos@dldld', N'12345', NULL, 2, 1, CAST(N'2023-10-02T10:22:12.840' AS DateTime), CAST(N'2023-10-02T10:22:12.840' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (37, N'caicaza2', NULL, N'carlos2@gmail.com', N'123456', NULL, 2, 1, CAST(N'2023-10-02T11:50:31.967' AS DateTime), CAST(N'2023-10-02T11:50:31.967' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (38, N'caicaza2', NULL, N'carlos3@gmail.com', N'123456', NULL, 2, 1, CAST(N'2023-10-02T11:51:27.937' AS DateTime), CAST(N'2023-10-02T11:51:27.937' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (39, N'caicaza2', NULL, N'carlos4@gmail.com', N'123456', NULL, 2, 1, CAST(N'2023-10-02T11:51:56.393' AS DateTime), CAST(N'2023-10-02T11:51:56.393' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (40, N'caicaza', NULL, N'carlos5@gmail.com', N'123456', NULL, 2, 1, CAST(N'2023-10-02T12:53:33.063' AS DateTime), CAST(N'2023-10-02T12:53:33.063' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (41, N'caicaza', NULL, N'carlos8gmail.com', N'123456', NULL, 2, 1, CAST(N'2023-10-02T12:58:47.227' AS DateTime), CAST(N'2023-10-02T12:58:47.227' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (42, N'caicaza', NULL, N'carlos57@dldld', N'123456', NULL, 2, 1, CAST(N'2023-10-02T14:08:08.980' AS DateTime), CAST(N'2023-10-02T14:08:08.980' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (48, N'Admin', NULL, N'admin@admin.com', N'Admin', NULL, 1, 1, CAST(N'2023-10-02T17:52:39.027' AS DateTime), CAST(N'2023-10-02T17:52:39.027' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (49, N'Benito Camelas', NULL, N'benito23@correo.com', N'Jugador_23', NULL, 2, 1, CAST(N'2023-10-02T18:02:58.083' AS DateTime), CAST(N'2023-10-02T18:02:58.083' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (52, N'David', NULL, N'byron@hotmail.com', N'Admin.23', NULL, 2, 1, CAST(N'2023-10-04T12:45:32.360' AS DateTime), CAST(N'2023-10-04T12:45:32.360' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuario__2A586E0B87670F85]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_OpcionByIdPregunta]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_Pregunta]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_PreguntaById]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_PreguntaByIdSala]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_Rol]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_Sala]    Script Date: 13/10/2023 17:11:17 ******/
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
		s.fecha_creacion,
		s.fecha_modificacion
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
		s.fecha_creacion,
		s.fecha_modificacion
		from Sala s inner join ModoJuego mj
		on s.idModoJuego = mj.idModoJuego	
		order by s.idSala desc
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_SalaByAll]    Script Date: 13/10/2023 17:11:17 ******/
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
		s.fecha_creacion,
		s.fecha_modificacion
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
		s.fecha_creacion,
		s.fecha_modificacion
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
/****** Object:  StoredProcedure [dbo].[sp_B_SalaById]    Script Date: 13/10/2023 17:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_SalaById]	
	
	@idSala int,
	@estados int,
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	declare @countIdSala int = 0
	select @countIdSala = COUNT(*) from Sala where idSala = @idSala
	
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
			s.fecha_creacion,
			s.fecha_modificacion
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
			s.fecha_creacion,
			s.fecha_modificacion
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
/****** Object:  StoredProcedure [dbo].[sp_B_Usuario]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_UsuarioLogin]    Script Date: 13/10/2023 17:11:17 ******/
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

	select @contUsuario = COUNT(*) from Usuario where
	correo = @correo COLLATE SQL_Latin1_General_CP1_CS_AS
	and clave = @clave COLLATE SQL_Latin1_General_CP1_CS_AS
	and estado > 0

	if(@contUsuario > 0)
	begin
		select u.idUsuario, u.nombre, u.correo, u.clave, r.idRol, r.nombre as 'rol'
		from Usuario u
		inner join Rol r
		on u.idRol = r.idRol
		where u.correo = @correo and u.clave = @clave and u.estado > 0	

		set @info = 'Usuario encontrado'
		set @error = 0
	end
	else
	begin
		set @info = 'Correo y contraseña incorrectos'
		set @error = 1
	end

	print @info
END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Opcion]    Script Date: 13/10/2023 17:11:17 ******/
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

	BEGIN TRY  
		Insert into Opcion(nombre, correcta, idPregunta) values
		(NULLIF(@nombre, ''),
		@correcta,
		@idPregunta);

		set @info = CONCAT('Registro creado satisfactoriamente, id creado: ',SCOPE_IDENTITY())
		set @error = 0

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Pregunta]    Script Date: 13/10/2023 17:11:17 ******/
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

	BEGIN TRY  
		Insert into Pregunta(nombre, idSala) values
		(NULLIF(@nombre, ''),
		@idSala);

		set @info = CONCAT('Registro creado satisfactoriamente, idPregunta: ',SCOPE_IDENTITY())
		set @error = 0

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Sala]    Script Date: 13/10/2023 17:11:17 ******/
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
		Insert into Sala (nombre, imagen, descripcion, idModoJuego) values
		(NULLIF(@nombre, ''),
		NULLIF(@imagen, ''),
		NULLIF(@descripcion, ''),		
		@idModoJuego);

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
/****** Object:  StoredProcedure [dbo].[sp_C_Usuario]    Script Date: 13/10/2023 17:11:17 ******/
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
		set @info = 'El correo electrónico ya está registrado'
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
/****** Object:  StoredProcedure [dbo].[sp_D_OpcionByIdPregunta]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_D_Pregunta]    Script Date: 13/10/2023 17:11:17 ******/
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
	
	declare @countIdPregunta int = 0
	select @countIdPregunta = COUNT(*) from Pregunta where idPregunta = @idPregunta

	if(@countIdPregunta > 0)
	begin 

		BEGIN TRY
			Delete from Opcion
			where idPregunta = @idPregunta;

			Delete from Pregunta		
			where idPregunta = @idPregunta;

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
/****** Object:  StoredProcedure [dbo].[sp_D_Sala]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_U_Opcion]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_U_Pregunta]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_U_Sala]    Script Date: 13/10/2023 17:11:17 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_U_SalaByEstado]    Script Date: 13/10/2023 17:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_U_SalaByEstado] 
	
	@idSala int,
	@estado int,

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
			Update Sala set 
			estado = @estado,			
			fecha_modificacion = GETDATE()
			where idSala = @idSala		

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
/****** Object:  StoredProcedure [dbo].[sp_U_Usuario]    Script Date: 13/10/2023 17:11:17 ******/
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
