/*
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
*/

-- Poblando.... TABLA universidad

INSERT INTO universidad (ruc, nombre_universidad, siglas, sitio_web) VALUES ('1700000000001', 'Universidad Técnica "Innovación"', 'UTI', 'www.uti.edu.ec');
INSERT INTO universidad (ruc, nombre_universidad, siglas, sitio_web) VALUES ('1700000000002', 'Universitaria del Norte','UDN', 'www.udn.edu.ec');

-- Poblando.... TABLA usuario 

SET @admin_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO usuario (id_universidad, id_usuario, correo_electronico, password, rol) 
	   VALUES (1, @admin_id, 'admin@gestioneducativa.edu.ec', '$2y$10$0tKyGAlaDywcvcWdKuswj.qHWPPfFSBmZ4Y5h/WtrLN8HG1nHwxki', 'Admin');
SET @docente1_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO usuario (id_universidad, id_usuario, correo_electronico, password, rol) 
       VALUES (1, @docente1_id, 'm.perez@gestioneducativa.edu.ec', '$2y$10$q5v/RSPu135afiBRhu/pDeAl3qLpqPpuNHVrz7IkuZktFnWKYvsMe', 'Docente');
SET @docente2_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO usuario (id_universidad, id_usuario, correo_electronico, password, rol) 
       VALUES (1, @docente2_id, 'j.garcia@gestioneducativa.edu.ec', '$2y$10$uZ.zddXfgkQA6ct7zt0RdefKvhtPy0XXj.eb4MEvpMRzZF6JiQhH.', 'Docente');	   
SET @estudiante1_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO usuario (id_universidad, id_usuario, correo_electronico, password, rol) 
       VALUES (1, @estudiante1_id, 'est.ana@gestioneducativa.edu.ec', '$2y$10$gsAkkZpubmAPAeXrVw/RF.PMASE43t18/3htprU5KkyjyUtw6MXDe', 'Estudiante');
SET @estudiante2_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO usuario (id_universidad, id_usuario, correo_electronico, password, rol) 
       VALUES (1, @estudiante2_id, 'est.luis@gestioneducativa.edu.ec', '$2y$10$t2Rov0mxLVaZzh68r8JxxO4/qup2VNtDHKN60uD.JFITzTstObWrC', 'Estudiante');
SET @docente_inact_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO usuario (id_universidad, id_usuario, correo_electronico, password, rol) 
	   VALUES (1, @docente_inact_id, 'r.salazar@gestioneducativa.edu.ec', '$2y$10$dOX8SfQhNkZ0JBYYqusWcuStdcFmj2h28gp/8aGoHEIqm38jYok7.', 'Docente');  
SET @estudiante_inact_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO usuario (id_universidad, id_usuario, correo_electronico, password, rol) 
       VALUES (1, @estudiante_inact_id, 'est.carla@gestioneducativa.edu.ec', '$2y$10$P1zOwcdfoXz7TjRRDnPyj..u7NpTurTBkuZ120Y/HOV5NBnUcf2pK', 'Estudiante');	 

-- Poblando.... TABLA usuario_perfil 

INSERT INTO usuario_perfil (id_universidad, id_usuario, cedula, nombres, apellidos, telefono, direccion)
       VALUES (1, @admin_id, '1700000001', 'Carlos', 'Administrador', '0225556667', 'Av. Amazonas N3X-15 y La Niña, Edificio Aranjuez');
INSERT INTO usuario_perfil (id_universidad, id_usuario, cedula, nombres, apellidos, telefono, direccion)
       VALUES (1, @docente1_id, '1700000002', 'Maria', 'Perez', '0984445551', 'Calle Guayaquil G4-31 y Espejo, Centro Histórico');
INSERT INTO usuario_perfil (id_universidad, id_usuario, cedula, nombres, apellidos, telefono, direccion)
       VALUES (1, @docente2_id, '1700000003', 'Jose', 'Garcia', '0984445552', 'Av. De los Shyris y Naciones Unidas, Sector La Carolina');
INSERT INTO usuario_perfil (id_universidad, id_usuario, cedula, nombres, apellidos, telefono, direccion)
       VALUES (1, @estudiante1_id, '1700000004', 'Ana', 'Lopez', '0984445553', 'Calle Ladrón de Guevara H11-254, Sector La Vicentina');
INSERT INTO usuario_perfil (id_universidad, id_usuario, cedula, nombres, apellidos, telefono, direccion)
       VALUES (1, @estudiante2_id, '1700000005', 'Luis', 'Ramirez', '0984445554', 'Av. Maldonado y Rodrigo de Chávez, Sector La Villa Flora');
INSERT INTO usuario_perfil (id_universidad, id_usuario, cedula, nombres, apellidos, telefono, direccion)
       VALUES (1, @docente_inact_id, '1700000006', 'Roberto', 'Salazar', '0984445555', 'Av. Cóndor Ñan y Av. Quitumbe, Sector Quitumbe');
INSERT INTO usuario_perfil (id_universidad, id_usuario, cedula, nombres, apellidos, telefono, direccion)
       VALUES (1, @estudiante_inact_id, '1700000007', 'Carla', 'Mendez', '0984445556', 'Calle El Inca y Av. 6 de Diciembre, Sector El Inca'); 

-- Poblando.... TABLA periodo_academico 

INSERT INTO periodo_academico (nombre_periodo, fecha_inicio, fecha_fin, activo) VALUES ('2025-2026 Sierra', '2025-09-01', '2026-06-30', FALSE);
INSERT INTO periodo_academico (nombre_periodo, fecha_inicio, fecha_fin, activo) VALUES ('2026-2027 Sierra', '2026-09-01', '2027-06-30', TRUE);

-- Poblando.... TABLA curso 

INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('MED-101', 'Embriología Humana', 5);
INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('MED-202', 'Farmacología Clínica', 4);
INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('MED-303', 'Patología General', 5);
INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('MED-404', 'Semiología Médica', 4);
INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('MED-505', 'Salud Pública y Epidemiología', 3);

INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('SIS-101', 'Programación Orientada a Objetos', 4);
INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('SIS-202', 'Redes de Datos y Conectividad', 4);
INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('SIS-303', 'Inteligencia Artificial Aplicada', 5);
INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('SIS-404', 'Desarrollo de Aplicaciones Móviles', 4);
INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('SIS-505', 'Ingeniería de Software II', 5);

INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('GAS-101', 'Panadería y Pastelería Profesional', 3);
INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('GAS-202', 'Administración de Alimentos y Bebidas', 4);
INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('GAS-303', 'Gastronomía Ecuatoriana e Identidad', 4);
INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('TUR-404', 'Ecoturismo y Áreas Protegidas', 3);
INSERT INTO curso (codigo, nombre_curso, creditos) VALUES ('TUR-505', 'Marketing Turístico Digital', 4);

-- Poblando.... TABLA universidad_facultad 

INSERT INTO universidad_facultad (id_universidad, nombre, direccion, ciudad) VALUES (1, 'Facultad de Ciencias de la Ingeniería e Industrias', 'Campus Occidental - Av. Mariana de Jesús', 'Quito');
INSERT INTO universidad_facultad (id_universidad, nombre, direccion, ciudad) VALUES (1, 'Facultad de Ciencias de la Salud Eugenio Espejo', 'Av. Occidental y Mariana de Jesús', 'Quito');
INSERT INTO universidad_facultad (id_universidad, nombre, direccion, ciudad) VALUES (1, 'Facultad de Ingeniería y Ciencias Aplicadas', 'Calle Rumipamba s/n y Bourgeois', 'Quito');
INSERT INTO universidad_facultad (id_universidad, nombre, direccion, ciudad) VALUES (1, 'Facultad de Ciencias Gastronómicas y Turismo', 'Campus Matriz - Edificio C', 'Quito');
INSERT INTO universidad_facultad (id_universidad, nombre, direccion, ciudad) VALUES (1, 'Facultad de Arquitectura y Urbanismo', 'Av. Atahualpa y Núñez de Vela', 'Quito');

-- Poblando.... TABLA tabla universidad_facultad_periodo 

INSERT INTO universidad_facultad_periodo (id_universidad, id_facultad, id_periodo, estado) VALUES (1, 1, 2, 'Abierto');
INSERT INTO universidad_facultad_periodo (id_universidad, id_facultad, id_periodo, estado) VALUES (1, 2, 2, 'Abierto');
INSERT INTO universidad_facultad_periodo (id_universidad, id_facultad, id_periodo, estado) VALUES (1, 3, 2, 'Abierto');
INSERT INTO universidad_facultad_periodo (id_universidad, id_facultad, id_periodo, estado) VALUES (1, 1, 1, 'Cerrado');
INSERT INTO universidad_facultad_periodo (id_universidad, id_facultad, id_periodo, estado) VALUES (1, 4, 2, 'Abierto');

-- Poblando.... TABLA universidad_oferta  

INSERT INTO universidad_oferta (id_universidad, id_facultad, id_periodo, id_curso) VALUES (1, 1, 2, 6);
INSERT INTO universidad_oferta (id_universidad, id_facultad, id_periodo, id_curso) VALUES (1, 1, 2, 7);
INSERT INTO universidad_oferta (id_universidad, id_facultad, id_periodo, id_curso) VALUES (1, 1, 2, 8);
INSERT INTO universidad_oferta (id_universidad, id_facultad, id_periodo, id_curso) VALUES (1, 1, 2, 9);
INSERT INTO universidad_oferta (id_universidad, id_facultad, id_periodo, id_curso) VALUES (1, 2, 2, 1);
INSERT INTO universidad_oferta (id_universidad, id_facultad, id_periodo, id_curso) VALUES (1, 2, 2, 2);
INSERT INTO universidad_oferta (id_universidad, id_facultad, id_periodo, id_curso) VALUES (1, 2, 2, 3);
INSERT INTO universidad_oferta (id_universidad, id_facultad, id_periodo, id_curso) VALUES (1, 2, 2, 4);
INSERT INTO universidad_oferta (id_universidad, id_facultad, id_periodo, id_curso) VALUES (1, 2, 2, 5);

-- Poblando.... tabla aula 

INSERT INTO aula (codigo_aula, capacidad, tipo_aula) VALUES ('LAB-COMP-01', 25, 'Laboratorio');
INSERT INTO aula (codigo_aula, capacidad, tipo_aula) VALUES ('LAB-COMP-02', 25, 'Laboratorio');
INSERT INTO aula (codigo_aula, capacidad, tipo_aula) VALUES ('AULA-101', 40, 'Teórica');
INSERT INTO aula (codigo_aula, capacidad, tipo_aula) VALUES ('AULA-102', 40, 'Teórica');
INSERT INTO aula (codigo_aula, capacidad, tipo_aula) VALUES ('AULA-201', 35, 'Teórica');
INSERT INTO aula (codigo_aula, capacidad, tipo_aula) VALUES ('AULA-202', 35, 'Teórica');
INSERT INTO aula (codigo_aula, capacidad, tipo_aula) VALUES ('AUD-MATRIZ', 120, 'Auditorio');
INSERT INTO aula (codigo_aula, capacidad, tipo_aula) VALUES ('LAB-REDES', 20, 'Laboratorio');
INSERT INTO aula (codigo_aula, capacidad, tipo_aula) VALUES ('AULA-MAGNA', 80, 'Auditorio');
INSERT INTO aula (codigo_aula, capacidad, tipo_aula) VALUES ('LAB-IA-01', 15, 'Laboratorio');

-- Poblando.... tabla horario

INSERT INTO horario (dia, hora) VALUES ('Lun-Mie', '07:00-09:00');
INSERT INTO horario (dia, hora) VALUES ('Mar-Jue', '07:00-09:00');
INSERT INTO horario (dia, hora) VALUES ('Lun-Mie', '11:00-13:00');
INSERT INTO horario (dia, hora) VALUES ('Mar-Jue', '11:00-13:00');
INSERT INTO horario (dia, hora) VALUES ('Vie',     '07:00-11:00');
INSERT INTO horario (dia, hora) VALUES ('Mar-Jue', '09:00-11:00');
INSERT INTO horario (dia, hora) VALUES ('Vie',     '08:00-12:00');
INSERT INTO horario (dia, hora) VALUES ('Lun-Mie', '14:00-16:00');
INSERT INTO horario (dia, hora) VALUES ('Mar-Jue', '14:00-16:00');

-- Recuperar IDs de Docentes

SELECT id_usuario INTO @docente_ing   FROM usuario WHERE correo_electronico = 'j.garcia@gestioneducativa.edu.ec' LIMIT 1;
SELECT id_usuario INTO @docente_salud FROM usuario WHERE correo_electronico = 'm.perez@gestioneducativa.edu.ec'  LIMIT 1;

INSERT INTO universidad_horario (id_universidad, id_facultad, id_periodo, id_curso, id_aula, id_docente, horario) VALUES (1, 1, 2, 6, 1, @docente_ing,   1);
INSERT INTO universidad_horario (id_universidad, id_facultad, id_periodo, id_curso, id_aula, id_docente, horario) VALUES (1, 1, 2, 7, 8, @docente_ing,   2);
INSERT INTO universidad_horario (id_universidad, id_facultad, id_periodo, id_curso, id_aula, id_docente, horario) VALUES (1, 1, 2, 8,10, @docente_ing,   5);
INSERT INTO universidad_horario (id_universidad, id_facultad, id_periodo, id_curso, id_aula, id_docente, horario) VALUES (1, 1, 2, 9, 2, @docente_ing,   1);
INSERT INTO universidad_horario (id_universidad, id_facultad, id_periodo, id_curso, id_aula, id_docente, horario) VALUES (1, 2, 2, 1, 3, @docente_salud, 2);
INSERT INTO universidad_horario (id_universidad, id_facultad, id_periodo, id_curso, id_aula, id_docente, horario) VALUES (1, 2, 2, 2, 4, @docente_salud, 3);
INSERT INTO universidad_horario (id_universidad, id_facultad, id_periodo, id_curso, id_aula, id_docente, horario) VALUES (1, 2, 2, 3, 5, @docente_salud, 4);
INSERT INTO universidad_horario (id_universidad, id_facultad, id_periodo, id_curso, id_aula, id_docente, horario) VALUES (1, 2, 2, 4, 3, @docente_salud, 5);

-- Poblando.... tabla  universidad_matricula 

SELECT id_usuario INTO @est_ana   FROM usuario WHERE correo_electronico = 'est.ana@gestioneducativa.edu.ec'   LIMIT 1;
SELECT id_usuario INTO @est_carla FROM usuario WHERE correo_electronico = 'est.carla@gestioneducativa.edu.ec' LIMIT 1;
SELECT id_usuario INTO @est_luis  FROM usuario WHERE correo_electronico = 'est.luis@gestioneducativa.edu.ec'  LIMIT 1;

INSERT INTO universidad_matricula (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, id_aula, costo, horario) VALUES (1, 1, 2, @est_ana,  6,  1, 150.00, 1);
INSERT INTO universidad_matricula (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, id_aula, costo, horario) VALUES (1, 1, 2, @est_ana,  7,  8, 150.00, 2);
INSERT INTO universidad_matricula (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, id_aula, costo, horario) VALUES (1, 1, 2, @est_ana,  8, 10, 150.00, 3);

INSERT INTO universidad_matricula (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, id_aula, costo, horario) VALUES (1, 1, 2, @est_luis, 6,  1, 150.00, 1);
INSERT INTO universidad_matricula (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, id_aula, costo, horario) VALUES (1, 1, 2, @est_luis, 7,  8, 150.00, 2);
INSERT INTO universidad_matricula (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, id_aula, costo, horario) VALUES (1, 1, 2, @est_luis, 9,  2, 150.00, 4);

INSERT INTO universidad_matricula (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, id_aula, costo, horario) VALUES (1, 1, 2, @est_carla, 6,  1, 150.00, 1);
INSERT INTO universidad_matricula (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, id_aula, costo, horario) VALUES (1, 1, 2, @est_carla, 8, 10, 150.00, 3);
INSERT INTO universidad_matricula (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, id_aula, costo, horario) VALUES (1, 1, 2, @est_carla, 9,  2, 150.00, 4);

-- Poblando.... tabla  nota 

INSERT INTO nota (nombre) VALUES 
('Parcial 1'),
('Parcial 2'),
('Examen Final'),
('Proyecto Integrador'),
('Supletorio');

-- Poblando.... tabla  universidad_calificacion  

INSERT INTO universidad_calificacion (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, nota, valor) VALUES (1, 1, 2, @est_ana,   6, 1,  9.00);
INSERT INTO universidad_calificacion (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, nota, valor) VALUES (1, 1, 2, @est_ana,   7, 2, 10.00);
INSERT INTO universidad_calificacion (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, nota, valor) VALUES (1, 1, 2, @est_ana,   8, 3,  7.00);

INSERT INTO universidad_calificacion (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, nota, valor) VALUES (1, 1, 2, @est_luis,  6, 1,  7.50);
INSERT INTO universidad_calificacion (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, nota, valor) VALUES (1, 1, 2, @est_luis,  7, 2, 10.00);
INSERT INTO universidad_calificacion (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, nota, valor) VALUES (1, 1, 2, @est_luis,  9, 4,  9.50);

INSERT INTO universidad_calificacion (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, nota, valor) VALUES (1, 1, 2, @est_carla, 6, 1,  9.50);
INSERT INTO universidad_calificacion (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, nota, valor) VALUES (1, 1, 2, @est_carla, 8, 3,  8.75);
INSERT INTO universidad_calificacion (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, nota, valor) VALUES (1, 1, 2, @est_carla, 9, 5,  7.25);

-- Poblando.... tabla  tarea 

INSERT INTO tarea (nombre) VALUES ('Leer y resumir capítulos de libros o artículos asignados.');
INSERT INTO tarea (nombre) VALUES ('Resolver ejercicios prácticos o problemas propuestos.');
INSERT INTO tarea (nombre) VALUES ('Elaborar mapas conceptuales para visualizar temas complejos.');
INSERT INTO tarea (nombre) VALUES ('Revisar y actualizar bibliografía para trabajos de investigación.');
INSERT INTO tarea (nombre) VALUES ('Redactar borradores de ensayos o informes.');
INSERT INTO tarea (nombre) VALUES ('Preparar presentaciones con esquemas claros.');
INSERT INTO tarea (nombre) VALUES ('Coordinar con compañeros para trabajos grupales.');
INSERT INTO tarea (nombre) VALUES ('Preparar resúmenes de fórmulas, definiciones y conceptos clave.');
INSERT INTO tarea (nombre) VALUES ('Asistir a charlas, seminarios o conferencias.');
INSERT INTO tarea (nombre) VALUES ('Explorar herramientas de modelado y diagramación.');

-- Poblando tabla universidad_tarea 

INSERT INTO universidad_tarea (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, tarea) VALUES (1, 1, 2, @est_ana,   6,  1); 
INSERT INTO universidad_tarea (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, tarea) VALUES (1, 1, 2, @est_ana,   7,  2); 
INSERT INTO universidad_tarea (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, tarea) VALUES (1, 1, 2, @est_ana,   8,  3); 

INSERT INTO universidad_tarea (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, tarea) VALUES (1, 1, 2, @est_luis,  6,  4); 
INSERT INTO universidad_tarea (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, tarea) VALUES (1, 1, 2, @est_luis,  7,  5); 
INSERT INTO universidad_tarea (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, tarea) VALUES (1, 1, 2, @est_luis,  9,  6); 

INSERT INTO universidad_tarea (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, tarea) VALUES (1, 1, 2, @est_carla, 6,  7); 
INSERT INTO universidad_tarea (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, tarea) VALUES (1, 1, 2, @est_carla, 8,  8);
INSERT INTO universidad_tarea (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, tarea) VALUES (1, 1, 2, @est_carla, 9, 10); 

-- Poblando.... tabla  asistencia 

INSERT INTO asistencia (nombre) VALUES ('Clases magistrales.');
INSERT INTO asistencia (nombre) VALUES ('Seminarios.');
INSERT INTO asistencia (nombre) VALUES ('Talleres. ');
INSERT INTO asistencia (nombre) VALUES ('Laboratorios. ');
INSERT INTO asistencia (nombre) VALUES ('Trabajos de campo.');

-- Poblando.... tabla  asistencia 

INSERT INTO universidad_asistencia (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, asistencia) VALUES (1, 1, 2, @est_ana,   6, 1); 
INSERT INTO universidad_asistencia (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, asistencia) VALUES (1, 1, 2, @est_ana,   7, 2); 
INSERT INTO universidad_asistencia (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, asistencia) VALUES (1, 1, 2, @est_ana,   8, 3);

INSERT INTO universidad_asistencia (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, asistencia) VALUES (1, 1, 2, @est_luis,  6, 1);
INSERT INTO universidad_asistencia (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, asistencia) VALUES (1, 1, 2, @est_luis,  7, 4);
INSERT INTO universidad_asistencia (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, asistencia) VALUES (1, 1, 2, @est_luis,  9, 5); 

INSERT INTO universidad_asistencia (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, asistencia) VALUES (1, 1, 2, @est_carla, 6, 1);
INSERT INTO universidad_asistencia (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, asistencia) VALUES (1, 1, 2, @est_carla, 8, 3);
INSERT INTO universidad_asistencia (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso, asistencia) VALUES (1, 1, 2, @est_carla, 9, 4);
