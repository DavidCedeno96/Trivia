use TriviaCMI_db

create table Rol(
	idRol int identity(1,1) primary key,
	nombre varchar(20) not null,
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

create table Usuario(
	idUsuario int identity(1,1) primary key,
	nombre varchar(60) not null,
	apellido varchar(15),
	correo varchar(40),
	clave varchar(20) CHECK (clave <> ''),
	foto varchar(50),
	idRol int references Rol(idRol) not null,	
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

create table ModoJuego(
	idModoJuego int identity(1,1) primary key,
	nombre varchar(15) not null,
	imagen varchar(50),
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

create table Sala(
	idSala int identity(1,1) primary key,
	nombre varchar(40) not null,
	imagen varchar(50),
	descripcion varchar(200),
	idModoJuego int references ModoJuego(idModoJuego) not null,
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

create table Usuario_Sala(
	idUsuario int references Usuario(idUsuario) not null,
	idSala int references Sala(idSala) not null,
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
	puntaje int default 0,
	tiempo int default 0
);

create table Pregunta(
	idPregunta int identity(1,1) primary key,
	nombre varchar(150) not null,
	idSala int references Sala(idSala) not null,
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

create table Opcion(
	idOpcion int identity(1,1) primary key,
	nombre varchar(150) not null,
	correcta int not null,
	idPregunta int references Pregunta(idPregunta) not null,
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

---------------------------
create table SalaJuego( -- este es para las posiciones durante el juego challenger
	idSala int,
	idJugador int,
	iniciales varchar(5),
	posicion int,

	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

create table SalaReciente( -- este es para las salas recientes visitadas
	idSala int,
	idJugador int,

	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

-----------------------------------------------------------------
select * from Rol -- Hacer el insert y no truncar
select * from ModoJuego -- Hacer el insert y no truncar

select * from SalaReciente
select * from Usuario_Sala
select * from SalaJuego
------------------------------------------------------------------------------------

truncate table Usuario_Sala
------------------------------------------------------------------------------------
Insert into Rol (nombre) values 
('Administrador'),
('Jugador'),
('SuperAdministrador')

Insert into ModoJuego (nombre, imagen) values 
('Challenger','img1.jpg'),
('Supervivencia','img2.jpg')

--insert into Usuario (nombre, clave, idRol) values 
--('Super CMI', 'admincmi', 3)

--Insert into Sala (nombre, imagen, idModoJuego) values
--('Sala 1', 'imge1.jpg', 1)

--Insert into Pregunta (nombre, idSala) values
--('�Cu�ntos litros de sangre tiene una persona adulta?',75),
--('�Qui�n es el autor de la frase "Pienso, luego existo"?',75),
--('�Cu�l es el pa�s m�s grande y el m�s peque�o del mundo?',75),
--('�Cu�l es el grupo de palabras escritas correctamente?',75),
--('�Cu�l es el libro m�s vendido en el mundo despu�s de la Biblia?',75)

--insert into Opcion (nombre, correcta, idPregunta) values
--('Tiene entre 2 y 4 litros',0,1),
--('Tiene entre 4 y 6 litros',1,1),
--('Tiene 10 litros',0,1),
--('Tiene 7 litros',0,1)

--insert into Usuario_Sala (idUsuario, idSala, puntaje, tiempo) values
--(33,10,6,29687)

Insert into Usuario (nombre, correo, idRol) values
('user', 'myUser@gmail.com', 2);
------------------------------------------------------------------------------------

---- ROL ---------------------------------------------
exec sp_B_Rol
@estados = 0,
@info = '',
@error = ''

---- USUARIO ---------------------------------------------
exec sp_B_Usuario
@estados = 0, -- 0 va a mostrar todo y 1 o > 1 mostrar las de estado 1
@info = '',
@error = ''

exec sp_B_UsuarioById
@estados = 0,
@idUsuario =1,
@info = '',
@error = ''

exec sp_B_UsuarioByAll	
@buscar = 'byron',
@estados = 0,
@info = '',
@error = ''

exec sp_B_UsuarioLogin	
@nombre = 'caicaza',
@clave = '1234567',
@correo = '',
@tipoLogin = 1,
@info = '',
@error = '' 

exec sp_C_Usuario
@nombre = 'miJugador4',
@clave = '12345555456',
@correo = '',
@idRol = 2,
@info = '',
@error = ''

exec sp_U_Usuario
@idUsuario = 1081, 
@nombre = 'user_edit',
@clave = '12344',
@correo = '',
@idRol = 2,
@info = '',
@error = ''

exec sp_D_Usuario	
@idUsuario = 0,	
@info = '',
@error = ''
---- SALA ---------------------------------------------
select * from ModoJuego

exec sp_B_Sala
@estados = 0, -- 0 va a mostrar todo y 1 o > 1 mostrar las de estado 1
@info = '',
@error = ''

exec sp_B_SalaById
@idSala = 77,
--@idUsuario = 1,
@estados = 0, -- 0 va a mostrar todo y 1 o > 1 mostrar las de estado 1
@info = '',
@error = ''

exec sp_B_SalaByAll	
@buscar = 'supervi',
@estados = 0,
@info = '',
@error = ''

exec sp_C_Sala	
@nombre = 'Sala 3',
@imagen = '',
@descripcion = '',
@idModoJuego = 2,
@info = '',
@error = ''

exec sp_U_Sala
@idSala = 0,
@nombre = 'edit otra vez jeje',
@imagen = 'myImage2.png',
@descripcion = 'desc 1',
@idModoJuego = 2,
@info = '', 
@error = ''

exec sp_U_SalaByEstado	
@idSala = 15,
@estado = 1,
@fechaActivacion = '2023-11-13T17:06:43',
@info = '',
@error = '' 

exec sp_D_Sala	
@idSala = 0,	
@info = '',
@error = ''

---- PREGUNTA ---------------------------------------------
exec sp_B_Pregunta	
@estados = 0, -- 0 va a mostrar todo y 1 o > 1 mostrar las de estado 1
@info = '',
@error = ''

exec sp_B_PreguntaByIdSala	
@idSala = 72,
@estados = 0, -- 0 va a mostrar todo y 1 o > 1 mostrar las de estado 1
@info = '',
@error = ''

exec sp_B_PreguntaById	
@idPregunta = 12,
@estados = 0, -- 0 va a mostrar todo y 1 o > 1 mostrar las de estado 1
@info = '',
@error = ''

exec sp_C_Pregunta
@nombre = '�Esta es otra nueva pregunta, si o no?',
@idSala = 0,
@info = '',
@error = ''

exec sp_U_Pregunta
@idPregunta = 0,
@nombre = '�pregunta?',
@info = '',
@error = ''

exec sp_D_Pregunta
@idPregunta = 0,	
@info = '',
@error = ''

---- OPCION ---------------------------------------------
Select * from Opcion

exec sp_B_OpcionByIdPregunta
@idPregunta = 12,
@estados = 0,
@info = '',
@error = ''

exec sp_C_Opcion	
@nombre = 'Esta es otra opcion',	
@correcta = 0,	
@idPregunta = 2,	
@info = '',
@error = ''

exec sp_U_Opcion
@idOpcion = 0,
@nombre = 'op h..',	
@correcta = 0,	
@idPregunta = 12,
@info = '',
@error = ''

exec sp_D_OpcionByIdPregunta	
@idPregunta = 0,
@idOpcion = 0,
@info = '',
@error = ''

---- USUARIO_SALA ---------------------------------------------
select * from Usuario_Sala 

exec sp_B_Usuario_Sala		
@estados = 0,
@info = '',
@error = ''

exec sp_B_Usuario_SalaByIdSala	
@idSala = 80,
@estados = 0,
@info = '',
@error = ''

exec sp_C_Usuario_Sala	
@idUsuario = 23,
@idSala = 78,
@puntaje = 8,
@tiempo = 34623,
@info = '',
@error = ''

exec sp_D_Usuario_Sala
@idSala = 0,	
@info = '',
@error = ''

---- SALA JUEGO ---------------------------------------------
select * from Usuario
select * from Sala -- 2 es supervivencia
select * from Usuario_Sala
select * from SalaJuego

exec sp_B_SalaJuego
@idSala = 78,		
@idJugador = 1,
@info = '',
@error = ''

exec sp_B_SalaJuegoByIds
@idSala = 78,		
@idJugador = 9,
@info = '',
@error = ''

exec sp_C_SalaJuego	
@idSala = 80,
@idJugador = 33,
@iniciales = 'P',
@info = '',
@error = ''

exec sp_U_SalaJuego	
@idSala = 80,
@idJugador = 57,	
@estadoJuego = 0,
@info = '',
@error = ''


---- SALA RECIENTE ---------------------------------------------
select * from SalaReciente order by fecha_modificacion desc
--select * from ModoJuego

exec sp_B_SalaReciente	-- ESTE ES PARA LAS 5 SALAS RECIENTES DEL JUGADOR
@estados = 0,
@idJugador = 23,
@info = '',
@error = ''

exec sp_C_SalaReciente
@idSala = 4,		
@idJugador = 23,
@info = '',
@error = ''
----------------------------------------------------------------------------
select * from Sala where idSala = 80
select * from Pregunta where idSala = 63
select * from Opcion where idPregunta = 43
select * from Opcion where idPregunta = 44


--delete from Pregunta where idPregunta = 41

USE TriviaCMI_db;
EXEC sp_spaceused

EXEC sp_helpdb 'TriviaCMI_db';

---
SELECT ROUTINE_NAME FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE ROUTINE_TYPE = 'PROCEDURE'
   ORDER BY ROUTINE_NAME 

---
SELECT 
	tc.CONSTRAINT_TYPE,
    tc.CONSTRAINT_NAME,
	tc.TABLE_NAME,
    kcu.COLUMN_NAME	
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu
    ON tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
WHERE 
    tc.TABLE_NAME = 'Usuario' AND 
    tc.CONSTRAINT_TYPE = 'UNIQUE'    

----
SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Usuario' AND CONSTRAINT_TYPE = 'CHECK';

---
SELECT tc.COLUMN_NAME, tc.DATA_TYPE, tc.CHARACTER_MAXIMUM_LENGTH, tc.IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS tc
WHERE tc.TABLE_NAME = 'Sala';

---
SELECT @@VERSION;

-- CAMBIOS ----------------------------------------------------------------------------------
--

------------------------------------------------------------------------------------
--insert into pruebas (id, texto) values
--(3, 'hola'),
--(2, 'mund'),
--(1, 'prue'),
--(1, 'hola'),
--(2, 'mund'),
--(1, 'prue')

--select * from  pruebas

--select 
--	sum(case when texto = 'hola' then 1 else 0 end) AS CountTextoHola,
--	sum(case when texto = 'mund' then 1 else 0 end) AS CountTextoMund
--from  pruebas
