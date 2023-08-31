CREATE DATABASE tesis1;

USE tesis;

CREATE TABLE tb_roles(
    rol INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(30) NOT NULL
);

CREATE TABLE tb_pagos (
    id_pago VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
    concepto VARCHAR(50) CHECK (concepto IN ('Colegiatura', 'Seguro', 'Examen')),
    monto DECIMAL(10, 2),
    adeudo DECIMAL(10, 2),
    total DECIMAL(10, 2),
    recibo BOOLEAN
);

-- Tablas asociadas a los alumnos

CREATE TABLE tb_alumnos(
    matricula VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    paterno VARCHAR(50) NOT NULL,
    materno VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    edad INT NOT NULL,
    curp VARCHAR(18) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    estatus INT NOT NULL,
    municipio VARCHAR(50) NOT NULL,
    colonia VARCHAR(50) NOT NULL,
    cp VARCHAR(8) NOT NULL,
    calle VARCHAR(50) NOT NULL,
    rol INT,
    FOREIGN KEY (rol) REFERENCES tb_rol(rol) ON DELETE CASCADE
);

CREATE TABLE tb_ tutores(
    id_tutor VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    paterno VARCHAR(50) NOT NULL,
    materno VARCHAR(50) NOT NULL,
    curp VARCHAR(18) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    municipio VARCHAR(50) NOT NULL,
    colonia VARCHAR(50) NOT NULL,
    cp VARCHAR(8) NOT NULL,
    calle VARCHAR(50) NOT NULL,
    ocupacion VARCHAR(50) NOT NULL,
    matricula VARCHAR(8),
    id_pago VARCHAR(8),
    rol INT,
    FOREIGN KEY (matricula) REFERENCES tb_alumnos(matricula) ON DELETE CASCADE,
    FOREIGN KEY (id_pago) REFERENCES tb_pagos(id_pago) ON DELETE CASCADE,
    FOREIGN KEY (rol) REFERENCES tb_roles(rol) ON DELETE CASCADE
);

CREATE TABLE tb_asistencia_alumnos(
    id_asistencia INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    fecha DATE NOT NULL,
    matricula VARCHAR(8),
    FOREIGN KEY (matricula) REFERENCES tb_alumnos(matricula) ON DELETE CASCADE
);

CREATE TABLE tb_inscripciones(
    id_inscripcion INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    acta_nacimiento BOOLEAN,
    curp BOOLEAN,
    ine_tutor BOOLEAN,
    certificado_estudios BOOLEAN,
    matricula VARCHAR(8),
    FOREIGN KEY (matricula) REFERENCES tb_alumnos(matricula) ON DELETE CASCADE
);

CREATE TABLE tb_grupos(
    id_grupo INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    nombre VARCHAR(5) NOT NULL,
    carrera VARCHAR(50) NOT NULL,
    matricula VARCHAR(8),
    FOREIGN KEY (matricula) REFERENCES tb_alumnos(matricula) ON DELETE CASCADE
);

-- TABLAS RELACIONADAS CON LOS PROFESORES
CREATE TABLE tb_profesores(
    id_profesro VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    paterno VARCHAR(50) NOT NULL,
    materno VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    edad INT NOT NULL,
    curp VARCHAR(18) NOT NULL UNIQUE,
    rfc VARCHAR(13) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    municipio VARCHAR(50) NOT NULL,
    colonia VARCHAR(50) NOT NULL,
    cp VARCHAR(8) NOT NULL,
    calle VARCHAR(50) NOT NULL,
    rol INT,
    FOREIGN KEY (rol) REFERENCES tb_roles(rol) ON DELETE CASCADE
);

CREATE TABLE tb_asistencia_profesores(
    id_asistencia_profesor INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    fecha DATE NOT NULL,
    hora_entrada TIME NOT NULL,
    hora_salida TIME NOT NULL,
    id_profesor VARCHAR(8),
    FOREIGN KEY (id_profesor) REFERENCES tb_profesores(id_profesor) ON DELETE CASCADE
);

-- TABLAS RELACIONADAS CON LA ESCUELA

CREATE TABLE tb_asignaturas(
    clave VARCHAR(8) PRIMARY KEY NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    grado ENUM('PRIMERO','SEGUNDO','TERCERO','CUARTO','QUINTO','SEXTO'),
    turno BOOLEAN 
);

CREATE TABLE tb_calificaciones(
    1parcial DECIMAL(2,2),
    2parcial DECIMAL(2,2),
    3parcial DECIMAL(2,2),
    cal_final DECIMAL(2,2),
    matricula VARCHAR(8),
    id_profesor VARCHAR(8),
    clave VARCHAR(8),
    FOREIGN KEY (matricula) REFERENCES tb_alumnos(matricula) ON DELETE CASCADE,
    FOREIGN KEY (id_profesor) REFERENCES tb_profesores(id_profesor) ON DELETE CASCADE,
    FOREIGN KEY (clave) REFERENCES tb_asignaturas(clave) ON DELETE CASCADE
);

CREATE TABLE tb_horarios(
    salon  VARCHAR(5) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_termino TIME NOT NULL,
    id_grupo INT,
    id_profesor VARCHAR(8),
    clave VARCHAR(8),
    FOREIGN KEY (id_grupo) REFERENCES tb_grupos(id_grupo) ON DELETE CASCADE,
    FOREIGN KEY (id_profesor) REFERENCES tb_profesores(id_profesor) ON DELETE CASCADE,
    FOREIGN KEY (clave) REFERENCES tb_asignaturas(clave) ON DELETE CASCADE
);


