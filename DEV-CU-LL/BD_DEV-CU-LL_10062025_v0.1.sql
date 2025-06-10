CREATE DATABASE admProyects;
USE admProyects;

CREATE TABLE CatEstatus (
    IdStatus INT PRIMARY KEY,
    Descripcion VARCHAR(255),
    Estatus BIT,
    Catalogo VARCHAR(100)
);

CREATE TABLE TblCarrera (
    IdCarrera INT PRIMARY KEY,
    Descripcion VARCHAR(255),
    FechaReg DATETIME,
    FechaMod DATETIME,
    Estatus BIT
);

CREATE TABLE CatRol (
    IdRol INT PRIMARY KEY,
    Descripcion VARCHAR(100),
    Estatus BIT,
    FechaAlta DATETIME
);

CREATE TABLE TblUsuario (
    IdUsuario INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Matricula VARCHAR(100),
    Telefono VARCHAR(13),
    Correo VARCHAR(100),
    Contrasena VARCHAR(255),
    IdCarrera INT,
    IdRol INT,
    FechaAlta DATETIME,
    FechaMod DATETIME,
    IdUsuarioMod INT,
	FOREIGN KEY (IdCarrera) REFERENCES TblCarrera(IdCarrera),
    FOREIGN KEY (IdRol) REFERENCES CatRol(IdRol)
);

CREATE TABLE CatCategoria (
    IdCategoria INT PRIMARY KEY,
    Descripcion VARCHAR(255),
    Estatus BIT
);

CREATE TABLE TblConvocatoria (
    IdConvocatoria INT PRIMARY KEY,
    FechaInicio DATE,
    FechaFin DATE,
    Edad INT,
    Residencia VARCHAR(100),
    Pdf VARCHAR(255),
    RestriccionPart VARCHAR(255),
    IdCategoria INT,
    IdStatus INT,
    Estatus BIT,
    FechaAlta DATETIME,
    FechaMod DATETIME,
    IdUsuarioAlta INT,
    IdUsuarioMod INT,
    FOREIGN KEY (IdCategoria) REFERENCES CatCategoria(IdCategoria),
    FOREIGN KEY (IdStatus) REFERENCES CatEstatus(IdStatus)
);

CREATE TABLE TblProyecto (
    IdProyecto INT PRIMARY KEY,
    IdUsuarioLider INT,
    IdCategoria INT,
    IdDescripcion INT,
    FechaAlta DATETIME,
    FechaMod DATETIME,
    IdUsuarioMod INT,
	FOREIGN KEY (IdUsuarioLider) REFERENCES TblUsuario(IdUsuario),
    FOREIGN KEY (IdCategoria) REFERENCES CatCategoria(IdCategoria)
);

CREATE TABLE TblProyectosEliminados (
    IdProyectoEliminado INT PRIMARY KEY,
    IdProyecto INT,
    IdUsuario INT,
	FechaElimina DATETIME,
    FOREIGN KEY (IdProyecto) REFERENCES TblProyecto(IdProyecto),
    FOREIGN KEY (IdUsuario) REFERENCES TblUsuario(IdUsuario)
);

CREATE TABLE TblDescripcionProyecto (
    IdDescProyecto INT PRIMARY KEY,
    Nombre VARCHAR(255),
    PropValor VARCHAR(255),
    Introduccion TEXT,
    Justificacion TEXT,
    Descripcion TEXT,
    ObjsGrals TEXT,
    ObjsEspec TEXT,
    EdoArte TEXT,
    Fortalezas TEXT,
    Oportunidades TEXT,
    Debilidades TEXT,
    Amenazas TEXT,
    Metodologias TEXT,
    Costos TEXT,
    Resultados TEXT,
    Referencias TEXT,
    Pdf VARCHAR(255),
    IdStatus INT,
    FechaAlta DATETIME,
    IdUsuarioAlta INT,
    FechaMod DATETIME,
    IdUsuarioMod INT,
    FOREIGN KEY (IdStatus) REFERENCES CatEstatus(IdStatus)
);

CREATE TABLE TblProyectoConvocatoria (
    IdProyectoConvocatoria INT PRIMARY KEY,
    IdProyecto INT,
    IdConvocatoria INT,
	IdUsuarioPostula INT,
    Participo BIT,
    EstatusConvocatoria VARCHAR(100),
    Estatus BIT,
    FechaAlta DATETIME,
    FechaMod DATETIME,
    IdUsuarioMod INT,
    FOREIGN KEY (IdProyecto) REFERENCES TblProyecto(IdProyecto),
    FOREIGN KEY (IdConvocatoria) REFERENCES TblConvocatoria(IdConvocatoria),
    FOREIGN KEY (IdUsuarioPostula) REFERENCES TblUsuario(IdUsuario)
);

CREATE TABLE TblIntegrantesProyecto (
    IdIntegrProy INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Matricula VARCHAR(100),
    IdProyecto INT,
    FechaAlta DATETIME,
    FechaMod DATETIME,
    IdUsuarioAlta INT,
    IdUsuarioMod INT,
    Estatus BIT,
    FOREIGN KEY (IdProyecto) REFERENCES TblProyecto(IdProyecto)
);
