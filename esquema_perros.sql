CREATE TABLE roles (
    id_usuario INT IDENTITY (1,1) PRIMARY KEY,
    tipo_rol VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO roles (tipo_rol) VALUES ('Adminitrador', 'Usuario');

CREATE TABLE usuarios (
    id_usuario INT IDENTITY (1,1) PRIMARY KEY, 
    nombre VARCHAR(80),
    contraseña VARCHAR(50),
    correo VARCHAR(70),
    FOREIGN KEY (tipo_usuario) REFERENCES roles(id_usuario)
);

CREATE TABLE notificaciones (
    id_notificacion INT IDENTITY (1,1) PRIMARY KEY
);

CREATE TABLE incidentes(
    id_incidente INT IDENTITY (1,1)PRIMARY KEY,
    tipo_incidente VARCHAR(50),
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8),
    fecha DATE,
    hora TIME,
    id_usaurio INT,
    evidencia VARBINARY(MAX),
    descripcion VARCHAR(255)
);

CREATE TALE zonas(
    id_usuario INT IDENTITY (1,1) PRIMARY KEY
    color VARCHAR(20)
);

CREATE TABLE evidencias(
    id_evidencia INT IDENTITY (1,1) PRIMARY KEY
    tipo_evidencia VARCHAR(20)
    archivo VARBINARY(MAX)
)

INSERT INTO evidencias (tipo_evidencia) VALUES ('Imagen', 'Video');

CREATE TABLE jaurias(
    id_jauria INT IDENTITY (1,1) PRIMARY KEY,
    edad_aproximada VARCHAR(50),
    FOREIGN KEY id_incidente REFERENCES incidentes(id_incidente)
);

INSERT INTO jaurias (edad_aproximada) VALUES ('Cachorro', 'Joven', 'Senil');

CREATE TABLE trayectorias(
    id_trayectoria INT IDENTITY (1,1) PRIMARY KEY,
    FOREIGN KEY id_incidente REFERENCES incidentes(id_incidente),
    FOREIGN KEY id_jauria REFERENCES jaurias(id_jauria),
    FOREIGN KEY longitud REFERENCES incidentes(longitud),
    FOREIGN KEY latitud REFERENCES incidentes(latitud),
    FOREIGN KEY fecha REFERENCES incidentes(fecha),
    FOREIGN KEY hora REFERENCES incidentes(hora)
);

CREATE TABLE zonas(
    id_zona INT IDENTITY (1,1) PRIMARY KEY,
    color VARCHAR(20)
);