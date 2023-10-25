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
	nombre varchar(40) not null,
	apellido varchar(15),
	correo varchar(40),
	clave varchar(30) unique not null,
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
create table JuegoChallenger(
	idSala int,
	idJugador int,
	iniciales varchar(5),
	posicion int,

	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
)

create table SalaJuego(
	idSala int,
	idJugador int,

	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
)
--------------------------------------------
select * from JuegoChallenger
select * from SalaJuego
------------------------------------------------------------------------------------
select * from Rol -- Hacer el insert y no truncar
select * from ModoJuego -- Hacer el insert y no truncar
------------------------------------------------------------------------------------
Insert into Rol (nombre) values 
('Administrador'),
('Jugador')

Insert into ModoJuego (nombre, imagen) values 
('Challenger','img1.jpg'),
('Supervivencia','img2.jpg')

--insert into Usuario (nombre, correo, clave, idRol) values ()

--Insert into Sala (nombre, imagen, idModoJuego) values
--('Sala 1', 'imge1.jpg', 1)

--Insert into Pregunta (nombre, idSala) values
--('¿Cuántos litros de sangre tiene una persona adulta?',75),
--('¿Quién es el autor de la frase "Pienso, luego existo"?',75),
--('¿Cuál es el país más grande y el más pequeño del mundo?',75),
--('¿Cuál es el grupo de palabras escritas correctamente?',75),
--('¿Cuál es el libro más vendido en el mundo después de la Biblia?',75)

--insert into Opcion (nombre, correcta, idPregunta) values
--('Tiene entre 2 y 4 litros',0,1),
--('Tiene entre 4 y 6 litros',1,1),
--('Tiene 10 litros',0,1),
--('Tiene 7 litros',0,1)

--insert into Usuario_Sala (idUsuario, idSala, puntaje, tiempo) values
--(33,78,6,29687)

--Insert into Usuario (nombre, apellido, correo, clave, idRol) values
--('Byron', 'Cedeño', 'david3@gmail.com', 'admin', 1);
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

exec sp_C_Usuario
@nombre = 'miJugador2',
@clave = 'jugador123',
@idRol = 2,
@info = '',
@error = ''

exec sp_U_Usuario
@idUsuario = 57, 
@nombre = 'juan_editsdaweadcfdee',
@correo = 'juan@edit.com',
@clave = '123450',
@idRol = 2,
@info = '',
@error = ''

exec sp_B_UsuarioLogin	
@nombre = 'caicaza',
@clave = '1234567',
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
@idSala = 0,
@estado = 0,
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
@nombre = '¿Esta es otra nueva pregunta, si o no?',
@idSala = 0,
@info = '',
@error = ''

exec sp_U_Pregunta
@idPregunta = 0,
@nombre = '¿pregunta?',
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

exec sp_B_Usuario_SalaByIdSala	
@idSala = 78,
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

---- JUEGO CHALLENGER ---------------------------------------------
select * from Usuario
select * from JuegoChallenger
--truncate table JuegoChallenger

exec sp_B_JuegoChallenger
@idSala = 77,		
@idJugador = 1,
@info = '',
@error = ''

exec sp_C_JuegoChallenger	
@idSala = 77,
@idJugador = 34,
@iniciales = 'MJ',
@info = '',
@error = ''

exec sp_U_JuegoChallenger	
@idSala = 77,
@idJugador = 34,	
@info = '',
@error = ''

--- new SPs
---- SALA JUEGO ---------------------------------------------
select * from SalaJuego order by fecha_modificacion desc
--select * from ModoJuego

exec sp_B_SalaJuego	-- ESTE ES PARA LAS 5 SALAS RECIENTES DEL JUGADOR
@estados = 0,
@idJugador = 9,
@info = '',
@error = ''

exec sp_C_SalaJuego
@idSala = 3,		
@idJugador = 3,
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

SELECT 
    tc.CONSTRAINT_NAME,
    kcu.COLUMN_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu
    ON tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
WHERE 
    tc.TABLE_NAME = 'Usuario' AND 
    tc.CONSTRAINT_TYPE = 'UNIQUE'    


SELECT ROUTINE_NAME FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE ROUTINE_TYPE = 'PROCEDURE'
   ORDER BY ROUTINE_NAME 


SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Usuario';

SELECT @@VERSION;

------------------------------------------------------------------------------------



------------------------------------------------------------------------------------
create table pruebas(
	id int,
	texto varchar(5)
)

insert into pruebas (id, texto) values
(1, 'hola mundo')

select * from  pruebas

select * from Usuario