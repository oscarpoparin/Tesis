CREATE TRIGGER `traspasar_alumnos` AFTER INSERT ON `tb_alumnos`
 FOR EACH ROW BEGIN
    INSERT INTO tb_usuarios (identificador, correo, rol, nombre, paterno, materno)
    VALUES (NEW.matricula, NEW.correo, NEW.rol, NEW.nombre, NEW.paterno, NEW.materno);
END;

CREATE TRIGGER `traspasar_tutores` AFTER INSERT ON `tb_tutores`
 FOR EACH ROW BEGIN
    INSERT INTO usuarios (identificador, correo, rol)
    VALUES (NEW.id_tutor, NEW.correo, NEW.rol);
END;

CREATE TRIGGER `traspasar_profesores` AFTER INSERT ON `tb_profesores`
 FOR EACH ROW BEGIN
    INSERT INTO tb_usuarios (identificador, correo, rol, nombre, paterno, materno)
    VALUES (NEW.id_profesor, NEW.correo, NEW.rol, NEW.nombre, NEW.paterno, NEW.materno);
END;


