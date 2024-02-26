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
	imagen varchar(60),
	descripcion varchar(200),
	idModoJuego int references ModoJuego(idModoJuego) not null,
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
	fechaCierre datetime NOT NULL,
	tiempoXpreg int default 20 NOT NULL
);

select * from Sala

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