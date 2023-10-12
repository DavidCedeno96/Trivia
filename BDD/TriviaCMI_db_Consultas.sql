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
	nombre varchar(15) not null,
	apellido varchar(15),
	correo varchar(40) unique not null,
	clave varchar(30) not null,
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

------------------------------------------------------------------------------------
select * from Rol
select * from Usuario
------------------------------------------------------------------------------------
Insert into Rol (nombre) values 
('Administrador'),
('Jugador')

Insert into ModoJuego (nombre, imagen) values 
('Challenger','img1.jpg'),
('Supervivencia','img2.jpg')


Insert into Sala (nombre, imagen, idModoJuego) values
('Sala 1', 'imge1.jpg', 1)

Insert into Pregunta (nombre, idSala) values
('¿Cuántos litros de sangre tiene una persona adulta?',75),
('¿Quién es el autor de la frase "Pienso, luego existo"?',75),
('¿Cuál es el país más grande y el más pequeño del mundo?',75),
('¿Cuál es el grupo de palabras escritas correctamente?',75),
('¿Cuál es el libro más vendido en el mundo después de la Biblia?',75)

insert into Opcion (nombre, correcta, idPregunta) values
('Tiene entre 2 y 4 litros',0,1),
('Tiene entre 4 y 6 litros',1,1),
('Tiene 10 litros',0,1),
('Tiene 7 litros',0,1)

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
@nombre = 'Admin',
@correo = 'admin@admin.com',
@clave = 'AdminCMI',
@idRol = 1,
@info = '',
@error = ''

exec sp_U_Usuario
@idUsuario = 23, 
@nombre = 'juan_editsdaweadcfdee',
@correo = 'juan@edit.com',
@clave = '123450',
@idRol = 2,
@info = '',
@error = ''

exec sp_B_UsuarioLogin	
@correo = 'david@gmail.com',
@clave = 'admin',
@info = '',
@error = '' 
---- SALA ---------------------------------------------
select * from ModoJuego

exec sp_B_Sala
@estados = 0, -- 0 va a mostrar todo y 1 o > 1 mostrar las de estado 1
@info = '',
@error = ''

exec sp_B_SalaById
@idSala = 10,
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
@idSala = 12,
@nombre = 'edit otra vez jeje',
@imagen = 'myImage2.png',
@descripcion = 'desc 1',
@idModoJuego = 2,
@info = '', -- en el info devolver la antigua imagen => 'Registro editado satisfactoriamente, old_image: image.png' 
@error = ''

exec sp_D_Sala	
@idSala = 72,	
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
@idSala = 14,
@info = '',
@error = ''

exec sp_U_Pregunta
@idPregunta = 10,
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
