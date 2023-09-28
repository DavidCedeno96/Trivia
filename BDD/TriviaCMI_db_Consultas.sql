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
	nombre varchar(20) not null,
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

Insert into Usuario (nombre, apellido, correo, clave, idRol) values
('Byron', 'Cedeño', 'david3@gmail.com', 'admin', 1);
------------------------------------------------------------------------------------
---- ROL ---------------------------------------------
exec sp_B_Rol
@estados = 0,
@info = '',
@error = ''

---- USUARIO ---------------------------------------------
exec sp_B_Usuario
@estados = 0,
@info = '',
@error = ''

exec sp_C_Usuario
@nombre = 'Paulina',
@correo = 'Gomez',
@clave = '123',
@idRol = 2,
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

