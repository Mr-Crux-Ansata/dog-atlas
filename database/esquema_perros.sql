CREATE DATABASE DogAtlasDB;
GO

USE DogAtlasDB;
GO

CREATE TABLE roles (
    id_rol INT IDENTITY (1,1) PRIMARY KEY,
    tipo_rol VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO roles (tipo_rol) VALUES ('Administrador'), ('Usuario'), ('Invitado');

CREATE TABLE usuarios (
    id_usuario INT IDENTITY (1,1) PRIMARY KEY, 
    nombre VARCHAR(80),
    contraseña VARCHAR(50),
    correo VARCHAR(70),
    id_rol INT,

    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

CREATE TABLE notificaciones (
    id_notificacion INT IDENTITY (1,1) PRIMARY KEY,
    id_usuario INT,
    id_incidente INT,
    mensaje VARCHAR (255),
    fecha DATETIME,
    leida BIT,

    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_incidente) REFERENCES incidentes (id_incidente)
);

CREATE TABLE incidentes(
    id_incidente INT IDENTITY (1,1)PRIMARY KEY,
    tipo_incidente VARCHAR(50),
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8),
    fecha DATE,
    hora TIME,
    id_usuario INT,
    evidencia VARBINARY(MAX),
    descripcion VARCHAR(255),
    id_zona INT,
    numero_perros INT,
    edad_aproximada VARCHAR(50),

    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_zona) REFERENCES zonas(id_zona)
);

CREATE TABLE zonas(
    id_zona INT IDENTITY (1,1) PRIMARY KEY,
    color VARCHAR(20)
);

CREATE TABLE evidencias(
    id_evidencia INT IDENTITY (1,1) PRIMARY KEY,
    tipo_evidencia VARCHAR(20),
    archivo VARBINARY(MAX),
    id_incidente INT,

    FOREIGN KEY (id_incidente) REFERENCES incidentes(id_incidente)
);

INSERT INTO evidencias (tipo_evidencia) VALUES ('Imagen'), ('Video');

CREATE TABLE jaurias(
    id_jauria INT IDENTITY (1,1) PRIMARY KEY,
    id_incidente INT,

    FOREIGN KEY (id_incidente) REFERENCES incidentes(id_incidente)
);

INSERT INTO jaurias (edad_aproximada) VALUES ('Cachorro'), ('Joven'), ('Senil');

CREATE TABLE trayectorias(
    id_trayectoria INT IDENTITY (1,1) PRIMARY KEY,
    id_incidente INT,
    id_jauria INT,
    longitud DECIMAL (11,8),
    latitud DECIMAL (10,8),
    fecha DATE,
    hora TIME,

    FOREIGN KEY (id_incidente) REFERENCES incidentes(id_incidente),
    FOREIGN KEY (id_jauria) REFERENCES jaurias(id_jauria)
);

