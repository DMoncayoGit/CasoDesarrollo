/*
 Caso Práctico Desarrollo
 Nombre: Doménica Moncayo
 Fecha: 03/05/2026
*/

/* Creación de la Base de Datos */

DROP DATABASE IF EXISTS gestion_academica;
CREATE DATABASE IF NOT EXISTS gestion_academica 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_bin; 

/* Switch */
USE gestion_academica;

/* Elimina las tablas existentes  */

DROP TABLE IF EXISTS universidad;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS usuario_perfil;
DROP TABLE IF EXISTS periodo_academico;
DROP TABLE IF EXISTS curso;
DROP TABLE IF EXISTS universidad_facultad;
DROP TABLE IF EXISTS universidad_facultad_periodo;
DROP TABLE IF EXISTS universidad_oferta;
DROP TABLE IF EXISTS aula;
DROP TABLE IF EXISTS horario;
DROP TABLE IF EXISTS universidad_horario;
DROP TABLE IF EXISTS universidad_matricula;
DROP TABLE IF EXISTS nota;
DROP TABLE IF EXISTS universidad_calificacion;
DROP TABLE IF EXISTS tarea;
DROP TABLE IF EXISTS universidad_tarea;
DROP TABLE IF EXISTS asistencia;
DROP TABLE IF EXISTS universidad_asistencia;

-- Creando ... tabla universidad

CREATE TABLE universidad (
    id_universidad INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT 'Identificador único de la universidad',
    ruc VARCHAR(13) NOT NULL UNIQUE                                 COMMENT 'Registro Único de Contribuyentes',
    nombre_universidad VARCHAR(200) NOT NULL                        COMMENT 'Nombre oficial de la institución',
    siglas VARCHAR(20)                                              COMMENT 'Siglas de la universidad ',
    sitio_web VARCHAR(150)                                          COMMENT 'URL del portal institucional'
) ENGINE=InnoDB COMMENT='Catálogo de universidades';

-- Creando..... tabla usuario

CREATE TABLE usuario (
    id_universidad INT UNSIGNED NOT NULL                         COMMENT 'Referencia a la tabla universidad',
    id_usuario BINARY(16) NOT NULL PRIMARY KEY                   COMMENT 'Identificador en formato binario',
    correo_electronico VARCHAR(100) NOT NULL UNIQUE              COMMENT 'Correo y login de acceso',
    password VARCHAR(255) NOT NULL                               COMMENT 'Contraseña cifrada',
    rol ENUM('Admin', 'Docente', 'Estudiante') NOT NULL          COMMENT 'Rol de permisos dentro del sistema',
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT 'Fecha y hora de registro inicial',
    INDEX idx_rol_estado (rol),
	CONSTRAINT usuario_fk_universidad FOREIGN KEY (id_universidad) REFERENCES universidad (id_universidad) ON DELETE CASCADE,
	UNIQUE KEY usuario_uk (id_universidad,  id_usuario)
) ENGINE=InnoDB COMMENT='Catálogo de usuarios';

-- Creando..... tabla usuario_perfil

CREATE TABLE usuario_perfil (
    id_universidad INT UNSIGNED NOT NULL COMMENT 'Referencia a la tabla universidad',
    id_usuario BINARY(16) NOT NULL       COMMENT 'Referencia a la tabla usuario',
    cedula VARCHAR(15) NOT NULL UNIQUE   COMMENT 'Documento de identidad',
    nombres VARCHAR(100) NOT NULL        COMMENT 'Nombres completos del individuo',
    apellidos VARCHAR(100) NOT NULL      COMMENT 'Apellidos completos del individuo',
    telefono VARCHAR(20)                 COMMENT 'Número telefónico de contacto',
    direccion TEXT                       COMMENT 'Domicilio físico del usuario',
	PRIMARY KEY (id_universidad, id_usuario),
	CONSTRAINT usuario_perfil_fk_universidad FOREIGN KEY (id_universidad) REFERENCES universidad (id_universidad) ON DELETE CASCADE,
    CONSTRAINT usuario_perfil_fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB COMMENT='Información personal de los usuarios';

-- Creando..... tabla periodo_academico

CREATE TABLE periodo_academico (
    id_periodo SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT 'Identificador incremental del periodo',
    nombre_periodo VARCHAR(50) NOT NULL                              COMMENT 'Nombre del periodo',
    fecha_inicio DATE NOT NULL                                       COMMENT 'Inicio de clases',
    fecha_fin DATE NOT NULL                                          COMMENT 'Finalización de clases',
    activo BOOLEAN NOT NULL DEFAULT TRUE                             COMMENT 'Indica si el periodo permite registros actuales'
) ENGINE=InnoDB COMMENT='Catálogo de periodos académicos';

-- Creando..... tabla curso

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT 'Identificador único del curso',
    codigo VARCHAR(20) NOT NULL UNIQUE               COMMENT 'Código del curso',
    nombre_curso VARCHAR(150) NOT NULL               COMMENT 'Nombre completo del curso',
    creditos TINYINT UNSIGNED NOT NULL DEFAULT 0     COMMENT 'Peso académico/créditos del curso'
) ENGINE=InnoDB COMMENT='Catálogo de cursos';

-- Creando..... tabla universidad_facultad

CREATE TABLE universidad_facultad (
    id_universidad INT UNSIGNED NOT NULL                         COMMENT 'Referencia a la tabla universidad',
    id_facultad INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT 'Identificador único del facultad',
    nombre VARCHAR(200) NOT NULL                                 COMMENT 'Nombre oficial del facultad académico',
    direccion VARCHAR(255)                                       COMMENT 'Ubicación física',
    ciudad VARCHAR(100)                                          COMMENT 'Ciudad donde se encuentra ubicado',
	CONSTRAINT universidad_facultad_fk_universidad FOREIGN KEY (id_universidad) REFERENCES universidad (id_universidad) ON DELETE CASCADE,
	UNIQUE KEY universidad_facultad_uk (id_universidad, id_facultad)
) ENGINE=InnoDB COMMENT='Catalogo de facultades';

-- Creando..... tabla universidad_facultad_periodo

CREATE TABLE universidad_facultad_periodo (
    id_universidad INT UNSIGNED NOT NULL                COMMENT 'Referencia a la tabla universidad',
    id_facultad INT UNSIGNED    NOT NULL                COMMENT 'Referencia a la tabla facultad',
    id_periodo SMALLINT UNSIGNED NOT NULL               COMMENT 'Referencia a la tabla periodo',
    estado ENUM('Abierto', 'Cerrado') DEFAULT 'Abierto' COMMENT 'Estado facultad periodo',
	PRIMARY KEY (id_universidad, id_facultad, id_periodo),
    CONSTRAINT universidad_facultad_periodo_fk_universidad FOREIGN KEY (id_universidad) REFERENCES universidad(id_universidad) ON DELETE CASCADE,
    CONSTRAINT universidad_facultad_periodo_fk_universidad_facultad  FOREIGN KEY (id_facultad) REFERENCES universidad_facultad (id_facultad) ON DELETE CASCADE,
	CONSTRAINT universidad_facultad_periodo_fk_periodo_academico FOREIGN KEY (id_periodo) REFERENCES periodo_academico(id_periodo) ON DELETE CASCADE
) ENGINE=InnoDB COMMENT='Periodos por cada facultad académico';

-- Creando..... tabla universidad_oferta

CREATE TABLE universidad_oferta (
    id_universidad INT UNSIGNED NOT NULL  COMMENT 'Referencia a la tabla universidad',
    id_facultad INT UNSIGNED    NOT NULL  COMMENT 'Referencia a la tabla facultad',
    id_periodo SMALLINT UNSIGNED NOT NULL COMMENT 'Referencia a la tabla periodo',
    id_curso INT NOT NULL                 COMMENT 'Curso a dictar',
	PRIMARY KEY (id_universidad, id_facultad, id_periodo, id_curso),
    CONSTRAINT universidad_oferta_fk_universidad_facultad_periodo FOREIGN KEY (id_universidad, id_facultad, id_periodo) 
	                                 REFERENCES  universidad_facultad_periodo (id_universidad, id_facultad, id_periodo) ON DELETE CASCADE,
    CONSTRAINT universidad_oferta_fk_curso FOREIGN KEY (id_curso) REFERENCES curso (id_curso) ON DELETE CASCADE
) ENGINE=InnoDB COMMENT='Cursos que oferta la universidad';

-- Creando..... tabla aula

CREATE TABLE aula (
    id_aula INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT 'Identificador del aula',
    codigo_aula VARCHAR(20) NOT NULL UNIQUE                  COMMENT 'Código físico',
    capacidad TINYINT UNSIGNED NOT NULL                      COMMENT 'Capacidad máximo de estudiantes',
    tipo_aula ENUM('Teórica', 'Laboratorio', 'Auditorio') DEFAULT 'Teórica'
) ENGINE=InnoDB COMMENT='Catálogo de aulas';

-- Creando..... tabla horario

CREATE TABLE horario (
    codigo_horario INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT 'Identificador horarios',
	dia  VARCHAR(15) NOT NULL DEFAULT 'Lunes'                       COMMENT 'Día',
	hora VARCHAR(11) NOT NULL DEFAULT '07:00-09:00'                 COMMENT 'Horas de clase (07:00-09:00)'
) ENGINE=InnoDB COMMENT='Catálogo de horarios';

-- Creando..... tabla universidad_horario

CREATE TABLE universidad_horario (
    id_universidad INT UNSIGNED NOT NULL               COMMENT 'Referencia a la tabla universidad',
    id_facultad INT UNSIGNED NOT NULL                  COMMENT 'Referencia a la tabla facultad',
    id_periodo SMALLINT UNSIGNED NOT NULL              COMMENT 'Referencia a la tabla periodo',
    id_curso INT NOT NULL                              COMMENT 'Referencia a la tabla curso',
    id_aula INT UNSIGNED NOT NULL                      COMMENT 'Referencia a la tabla aula',  
    id_docente BINARY(16) NOT NULL                     COMMENT 'Referencia a la tabla usuario (Docente)',
    horario INT UNSIGNED NOT NULL                      COMMENT 'Referencia a la tabla horario', 
    PRIMARY KEY (id_universidad, id_facultad, id_periodo, id_curso, id_aula),
    CONSTRAINT universidad_horario_fk_universidad_oferta FOREIGN KEY (id_universidad, id_facultad, id_periodo, id_curso) 
	                                   REFERENCES universidad_oferta (id_universidad, id_facultad, id_periodo, id_curso) ON DELETE CASCADE,
    CONSTRAINT universidad_horario_fk_aula FOREIGN KEY (id_aula) REFERENCES aula (id_aula) ON DELETE CASCADE,
    CONSTRAINT universidad_horario_fk_usuario FOREIGN KEY (id_docente) REFERENCES usuario (id_usuario) ON DELETE CASCADE,
	CONSTRAINT universidad_horario_fk_horario FOREIGN KEY (horario) REFERENCES horario (codigo_horario) ON DELETE CASCADE,
    INDEX idx_horario_curso (id_curso),
    INDEX idx_horario_docente (id_docente),
    INDEX idx_horario_codigo (horario)
) ENGINE=InnoDB COMMENT='Horarios de los cursos';

-- Creando..... tabla universidad_matricula

CREATE TABLE universidad_matricula (
    id_universidad INT UNSIGNED NOT NULL                COMMENT 'Referencia a la tabla universidad',
    id_facultad INT UNSIGNED NOT NULL                   COMMENT 'Referencia a la tabla facultad',
    id_periodo SMALLINT UNSIGNED NOT NULL               COMMENT 'Referencia a la tabla periodo',
	
	id_estudiante BINARY(16) NOT NULL                   COMMENT 'Referencia a la tabla usuario (Estudiante)',
	
    id_curso INT NOT NULL                               COMMENT 'Referencia a la tabla curso',
    id_aula INT UNSIGNED NOT NULL                       COMMENT 'Referencia a la tabla aula',  
	
	costo DECIMAL(8,2) NOT NULL                         COMMENT 'Costo de Matrícula',
    promedio_acta DECIMAL(4,2) DEFAULT NULL             COMMENT 'Nota final (0.00 - 10.00)',
    fecha_acta DATE DEFAULT NULL                        COMMENT 'Fecha de cierre de notas',
    fecha_matricula TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de Matrícula',
	horario INT UNSIGNED NOT NULL                       COMMENT 'Referencia a la tabla horario', 
    PRIMARY KEY (id_universidad, id_facultad, id_periodo, id_estudiante,  id_curso ),
    CONSTRAINT universidad_matricula_fk_universidad_horario FOREIGN KEY (id_universidad, id_facultad, id_periodo, id_curso, id_aula) 
	                                     REFERENCES universidad_horario (id_universidad, id_facultad, id_periodo, id_curso, id_aula) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT universidad_matricula_fk_usuario FOREIGN KEY (id_estudiante) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT universidad_matricula_fk_horario FOREIGN KEY (horario) REFERENCES horario (codigo_horario) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_universidad_matricula_curso (id_curso),
    INDEX idx_universidad_matricula_estudiante (id_estudiante)
) ENGINE=InnoDB COMMENT='Matriculas de la universidad';

--  Creando..... tabla nota

CREATE TABLE nota (
    codigo_nota INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT 'Identificador de notas',
	nombre VARCHAR(20) NOT NULL                                  COMMENT 'Nombre de la Nota'
) ENGINE=InnoDB COMMENT='Catálogo de notas';

-- Creando..... tabla universidad_calificacion

CREATE TABLE universidad_calificacion (
    id_universidad INT UNSIGNED NOT NULL                COMMENT 'Referencia a la tabla universidad',
    id_facultad INT UNSIGNED NOT NULL                   COMMENT 'Referencia a la tabla facultad',
    id_periodo SMALLINT UNSIGNED NOT NULL               COMMENT 'Referencia a la tabla periodo',
	id_estudiante BINARY(16) NOT NULL                   COMMENT 'Referencia a la tabla usuario (Estudiante)',
	id_curso INT NOT NULL                               COMMENT 'Referencia a la tabla curso',
	nota INT UNSIGNED NOT NULL                          COMMENT 'Identificador de notas',
	valor DECIMAL(4,2) DEFAULT NULL                     COMMENT 'Valor (0.00 - 10.00)',
    PRIMARY KEY (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso  ),
    CONSTRAINT universidad_calificacion_fk_universidad_matricula FOREIGN KEY (id_universidad, id_facultad, id_periodo, id_curso) 
	                                         REFERENCES universidad_matricula (id_universidad, id_facultad, id_periodo, id_curso) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT universidad_calificacion_fk_nota FOREIGN KEY (id_estudiante) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_universidad_calificacion_curso (id_curso),
    INDEX idx_universidad_calificacion_estudiante (id_estudiante),
    INDEX idx_universidad_calificacion_nota (nota)
) ENGINE=InnoDB COMMENT='Calificaciones estudiantes';

-- Creando..... tabla tarea

CREATE TABLE tarea (
    codigo_tarea INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT 'Identificador de tarea',
	nombre VARCHAR(65) NOT NULL                                   COMMENT 'Nombre oficial de la tarea'
) ENGINE=InnoDB COMMENT='Catálogo de tareas';

-- Creando..... tabla universidad_tarea

CREATE TABLE universidad_tarea (
    id_universidad INT UNSIGNED NOT NULL                COMMENT 'Referencia a la tabla universidad',
    id_facultad INT UNSIGNED NOT NULL                   COMMENT 'Referencia a la tabla facultad',
    id_periodo SMALLINT UNSIGNED NOT NULL               COMMENT 'Referencia a la tabla periodo',
	id_estudiante BINARY(16) NOT NULL                   COMMENT 'Referencia a la tabla usuario (Estudiante)',
	id_curso INT NOT NULL                               COMMENT 'Referencia a la tabla curso',
	tarea INT UNSIGNED NOT NULL                         COMMENT 'Identificador de tareas',
    PRIMARY KEY (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso  ),
    CONSTRAINT uuniversidad_tarea_fk_universidad_matricula FOREIGN KEY (id_universidad, id_facultad, id_periodo, id_curso) 
	                                         REFERENCES universidad_matricula (id_universidad, id_facultad, id_periodo, id_curso) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT universidad_tarea_fk_nota FOREIGN KEY (id_estudiante) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_universidad_tarea_curso (id_curso),
    INDEX idx_universidad_tarea_estudiante (id_estudiante)
) ENGINE=InnoDB COMMENT='Tareas de los estudiantes';

-- Creando..... tabla asistencia 

CREATE TABLE asistencia (
    codigo_asistencia INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT 'Identificador de la asistencia',
	nombre VARCHAR(65) NOT NULL                                        COMMENT 'Descripción de la asistencia'
) ENGINE=InnoDB COMMENT='Catálogo de asistencia';

-- Creando..... tabla universidad_asistencia 

CREATE TABLE universidad_asistencia (
    id_universidad INT UNSIGNED NOT NULL                COMMENT 'Referencia a la tabla universidad',
    id_facultad INT UNSIGNED NOT NULL                   COMMENT 'Referencia a la tabla facultad',
    id_periodo SMALLINT UNSIGNED NOT NULL               COMMENT 'Referencia a la tabla periodo',
	id_estudiante BINARY(16) NOT NULL                   COMMENT 'Referencia a la tabla usuario (Estudiante)',
	id_curso INT NOT NULL                               COMMENT 'Referencia a la tabla curso',
	asistencia INT UNSIGNED NOT NULL                    COMMENT 'Identificador de tareas',
    PRIMARY KEY (id_universidad, id_facultad, id_periodo, id_estudiante, id_curso  ),
    CONSTRAINT uuniversidad_asistencia_fk_universidad_matricula FOREIGN KEY (id_universidad, id_facultad, id_periodo, id_curso) 
	                                       REFERENCES universidad_matricula (id_universidad, id_facultad, id_periodo, id_curso) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT universidad_asistencia_fk_nota FOREIGN KEY (id_estudiante) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_universidad_asistencia_curso (id_curso),
    INDEX idx_universidad_asistencia_estudiante (id_estudiante)
) ENGINE=InnoDB COMMENT='Tareas de los estudiantes';