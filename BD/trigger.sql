-- Crear el trigger que inserta los datos necesarios para el control de usuarios en el aplicativo

CREATE TABLE tb_usuarios(
    id int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    identificador varchar(8) DEFAULT NULL,
    correo varchar(100) DEFAULT NULL,
    rol int(11) DEFAULT NULL,
    nombre varchar(50) DEFAULT NULL,
    paterno varchar(50) DEFAULT NULL,
    materno varchar(50) DEFAULT NULL
);
DELIMITER //
CREATE TRIGGER usuario_alumno
AFTER INSERT ON tb_alumnos
FOR EACH ROW
BEGIN
    INSERT INTO tb_usuarios (identificador, correo, rol, nombre, paterno, materno)
    VALUES (NEW.matricula, NEW.correo, NEW.rol, NEW.nombre, NEW.paterno, NEW.materno);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER usuario_tutor
AFTER INSERT ON tb_tutores
FOR EACH ROW
BEGIN
    INSERT INTO tb_usuarios (identificador, correo, rol, nombre, paterno, materno)
    VALUES (NEW.id_tutor, NEW.correo, NEW.rol, NEW.nombre, NEW.paterno, NEW.materno);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER usuario_profesor
AFTER INSERT ON tb_profesores
FOR EACH ROW
BEGIN
    INSERT INTO tb_usuarios (identificador, correo, rol, nombre, paterno, materno)
    VALUES (NEW.id_profesor, NEW.correo, NEW.rol, NEW.nombre, NEW.paterno, NEW.materno);
END;
//
DELIMITER ;

