
INSERT INTO tb_roles (rol, descripcion) VALUES
(1, 'Administrador'),
(2, 'Profesor'),
(3, 'Alumno'),
(4, 'Tutor');

INSERT INTO tb_usuarios (id, identificador, correo, rol, nombre, paterno, materno) VALUES
(1, 'ADMIN123', 'admin@admin.com', 1, 'administrador', 'admin', 'admin');

INSERT INTO tb_alumnos (matricula, nombre, paterno, materno, fecha_nacimiento, edad, curp, correo, telefono, municipio, colonia, cp, calle, rol) VALUES
('REPO1234', 'alumno', 'alumno', 'alumno', '2000-02-22', 23, 'REPO000222HMCYNSA1', 'alumno@alumno.com', '5511223399', 'x', 'x', 'x', 'x', 3);

INSERT INTO tb_profesores (id_profesor, nombre, paterno, materno, fecha_nacimiento, edad, curp, rfc, correo, telefono, municipio, colonia, cp, calle, rol) VALUES
('RENA1234', 'profesor', 'profesor', 'profesor', '1970-11-01', 53, 'REPO000222HMCYNSB9', 'REPO000222H18', 'profesor@profesor.com', '5511223398', 'x', 'x', 'x', 'x', 2);

INSERT INTO tb_tutores (id_tutor, nombre, paterno, materno, curp, correo, telefono, municipio, colonia, cp, calle, matricula, rol, id_pago) VALUES 
('POCM1234', 'tutor', 'tutor', 'tutor', 'REPO000222HMCYNSA7', 'tutor@tutor.com', '5511223399', 'x', 'x', 'x', 'x', 'REPO1234', '4', NULL);
