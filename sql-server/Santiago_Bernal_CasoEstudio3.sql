DROP DATABASE IF EXISTS CasoEstudio2
CREATE DATABASE CasoEstudio2
USE CasoEstudio2

CREATE TABLE Departamento(
	id INT PRIMARY KEY,
	nombre NVARCHAR(50)
)

CREATE TABLE Profesor(
	id INT PRIMARY KEY,
	nif NVARCHAR(9),
	nombre NVARCHAR(25),
	apellido1 NVARCHAR(50),
	apellido2 NVARCHAR(50),
	ciudad NVARCHAR(25),
	direccion NVARCHAR(50),
	telefono NVARCHAR(9),
	fecha_nacimiento DATE,
	sexo CHAR(1) NOT NULL CHECK (sexo IN ('H', 'M')),
	id_departamento INT,
	FOREIGN KEY (id_departamento) REFERENCES Departamento(id)
)

CREATE TABLE Grado(
	id INT PRIMARY KEY,
	nombre NVARCHAR(100)
)

CREATE TABLE Asignatura(
	id INT PRIMARY KEY,
	nombre NVARCHAR(100),
	creditos FLOAT,
	tipo NVARCHAR(100),
	curso TINYINT,
	cuatrisemestre TINYINT,
	id_profesor INT,
	id_grado INT,
	FOREIGN KEY (id_profesor) REFERENCES Profesor(id),
	FOREIGN KEY (id_grado) REFERENCES Grado (id)
) 

CREATE TABLE Alumno(
	id INT PRIMARY KEY,
	nif NVARCHAR(9),
	nombre NVARCHAR(25),
	apellido1 NVARCHAR(50),
	apellido2 NVARCHAR(50),
	ciudad NVARCHAR(25),
	direccion NVARCHAR(50),
	telefono NVARCHAR(9),
	fecha_nacimiento DATE,
	sexo CHAR(1) NOT NULL CHECK (sexo IN ('H', 'M'))
)

CREATE TABLE Curso_Escolar(
	id INT PRIMARY KEY,
	anyo_inicio INT,
	anyo_fin INT
)

CREATE TABLE Alumno_se_matricula_asignatura(
	id_alumno INT,
	id_asignatura INT,
	id_curso_escolar INT,
	FOREIGN KEY(id_alumno) REFERENCES Alumno(id),
	FOREIGN KEY(id_asignatura) REFERENCES Asignatura(id),
	FOREIGN KEY(id_curso_escolar) REFERENCES Curso_Escolar(id),
)

/* Departamento */
INSERT INTO departamento VALUES (1, 'Informática');
INSERT INTO departamento VALUES (2, 'Matemáticas');
INSERT INTO departamento VALUES (3, 'Economía y Empresa');
INSERT INTO departamento VALUES (4, 'Educación');
INSERT INTO departamento VALUES (5, 'Agronomía');
INSERT INTO departamento VALUES (6, 'Química y Física');
INSERT INTO departamento VALUES (7, 'Filología');
INSERT INTO departamento VALUES (8, 'Derecho');
INSERT INTO departamento VALUES (9, 'Biología y Geología');

/* Alumno */
INSERT INTO alumno VALUES (1, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992/08/08', 'H');
INSERT INTO alumno VALUES (2, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837',
'1991/03/28', 'H');
INSERT INTO alumno VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H');
INSERT INTO alumno VALUES (6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998/01/28', 'H');
INSERT INTO alumno VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999/05/24', 'H');
INSERT INTO alumno VALUES (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996/11/21', 
'H');
INSERT INTO alumno VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', 
'1997/04/26', 'H');
INSERT INTO alumno VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', 
'1998/09/01', 'M');
INSERT INTO alumno VALUES (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998/01/01', 
'H');
INSERT INTO alumno VALUES (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', 
'1999/02/11', 'H');
INSERT INTO alumno VALUES (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', 
'1996/03/12', 'M');
INSERT INTO alumno VALUES 
(24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995/04/13', 'M');


-- Nuevos datos del caso estudio 3.
INSERT INTO alumno VALUES 
(25, '12345678A', 'Ana', 'García', 'López', 'Madrid', 'Calle Falsa 123', '600123456', '2008/05/15', 'M'),
(26, '23456789B', 'Luis', 'Martínez', 'Pérez', 'Barcelona', 'Avenida Siempre Viva 456', '600234567', '2007/08/22', 'H'),
(27, '34567890C', 'Marta', 'Hernández', 'Sánchez', 'Valencia', 'Calle Luna 789', '600345678', '2009/11/30', 
'M'),
(28, '45678901D', 'Carlos', 'Fernández', 'Gómez', 'Sevilla', 'Calle Sol 321', '600456789', '2010/04/10', 'H'),
(29, '56789012E', 'Lucía', 'Díaz', 'Moreno', 'Bilbao', 'Calle Estrella 654', '600567890', '2011/02/25', 'M'),
(30, '67890123F', 'Javier', 'Ruiz', 'Romero', 'Zaragoza', 'Avenida Mar 987', '600678901', '2008/12/05', 'H'),
(31, '78901234G', 'Elena', 'Jiménez', 'Ortega', 'Málaga', 'Calle Tierra 123', '600789012', '2009/06/18', 'M'),
(32, '89012345H', 'David', 'López', 'Muñoz', 'Murcia', 'Calle Río 456', '600890123', '2010/09/28', 'H'),
(33, '90123456I', 'María', 'Álvarez', 'Castro', 'Granada', 'Avenida Viento 789', '600901234', '2007/03/12', 
'M'),
(34, '01234567J', 'Sergio', 'González', 'Navas', 'Alicante', 'Calle Fuego 321', '600012345', '2009/07/24', 'H');

-- Nuevos datos del caso estudio 3.

SELECT * FROM ALUMNO

/* Profesor */
INSERT INTO profesor VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979/08/19', 'M', 1);
INSERT INTO profesor VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978/01/19', 'H', 
2);
INSERT INTO profesor VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', 
'1977/08/21', 'M', 3);
INSERT INTO profesor VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977/05/19', 'M', 4);
INSERT INTO profesor VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 
'M', 4);
INSERT INTO profesor VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', 
'1980/02/01', 'H', 6);
INSERT INTO profesor VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977/01/02', 
'H', 1);
INSERT INTO profesor VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980/03/14', 
'H', 2);
INSERT INTO profesor VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, 
'1982/03/18', 'H', 3);
INSERT INTO profesor VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, 
'1973/05/05', 'H', 4);
INSERT INTO profesor VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', 
'1976/02/25', 'H', 5);
INSERT INTO profesor VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, 
'1980/10/31', 'H', 6);
INSERT INTO profesor VALUES (21, '13175769N', 'Pepe', 'Sánchez', 'Ruiz', 'Almería', 'C/ Quinto pino', NULL, '1980/10/16', 'H', 
1);
INSERT INTO profesor VALUES (22, '98816696W', 'Juan', 'Guerrero', 'Martínez', 'Almería', 'C/ Quinto pino', NULL, '1980/11/21', 
'H', 1);
INSERT INTO profesor VALUES (23, '77194445M', 'María', 'Domínguez', 'Hernández', 'Almería', 'C/ Quinto pino', NULL, 
'1980/12/13', 'M', 2);

/* Grado */
INSERT INTO grado VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO grado VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO grado VALUES (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO grado VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO grado VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO grado VALUES (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO grado VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO grado VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO grado VALUES (10, 'Grado en Química (Plan 2009)');

/* Asignatura */
INSERT INTO asignatura VALUES (1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (2, 'Cálculo', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (3, 'Física para informática', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (4, 'Introducción a la programación', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (6, 'Estadística', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (9, 'Lógica y algorítmica', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (10, 'Metodología de la programación', 6, 'básica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES (16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES (20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
INSERT INTO asignatura VALUES (22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, 
NULL, 4);
INSERT INTO asignatura VALUES (24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4); 
INSERT INTO asignatura VALUES (28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (53, 'Física', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (55, 'Química general', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (59, 'Genética', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

/* Curso escolar */
INSERT INTO curso_escolar VALUES (1, 2014, 2015);
INSERT INTO curso_escolar VALUES (2, 2015, 2016);
INSERT INTO curso_escolar VALUES (3, 2016, 2017);
INSERT INTO curso_escolar VALUES (4, 2017, 2018);

/* Alumno se matricula en asignatura */
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 4, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 5, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 6, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 7, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 8, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 9, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 10, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 4, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 5, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 6, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 7, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 8, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 9, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 10, 2);

-- Funciones
-- 1. Función para calcular la edad de alumnos hasta el día de hoy
CREATE FUNCTION dbo.CalcularEdad (@fecha_nacimiento DATE)
RETURNS INT
AS
BEGIN
DECLARE @edad INT;
SET @edad = DATEDIFF(YEAR, @fecha_nacimiento, GETDATE());
-- Ajuste para aquellos cuyo cumpleaños no han ocurrido en el año actual
IF ( MONTH (GETDATE()) < MONTH(@fecha_nacimiento) )
OR ( MONTH (GETDATE()) = MONTH(@fecha_nacimiento) AND
 DAY(GETDATE()) < DAY(@fecha_nacimiento) )
BEGIN
SET @edad = @edad - 1;
END
RETURN @edad;
END;
-- 2. Función para definir si es mayor o menor de edad
CREATE FUNCTION dbo.EsMayorDeEdad (@fecha_nacimiento DATE)
RETURNS BIT
AS
BEGIN
 DECLARE @edad INT;
 SET @edad = DATEDIFF(YEAR, @fecha_nacimiento, GETDATE());
 -- Ajuste para aquellos cuyo cumpleaños no ha ocurrido en el año actual
 IF (MONTH(GETDATE()) < MONTH(@fecha_nacimiento))
 OR (MONTH(GETDATE()) = MONTH(@fecha_nacimiento) AND DAY(GETDATE()) <
 DAY(@fecha_nacimiento))
 BEGIN
 SET @edad = @edad - 1;
 END
 RETURN CASE
 WHEN @edad >= 18 THEN 1 
 ELSE 0 
 END;
END;
--3. Función para obtener estadísticas por ciudad
CREATE FUNCTION dbo.EstadisticasPorCiudad (@ciudad VARCHAR(25))
RETURNS TABLE
AS
RETURN
(
 SELECT
 @ciudad AS Ciudad,
 COUNT(DISTINCT a.id) AS NumeroAlumnos,
 COUNT(DISTINCT p.id) AS NumeroProfesores,
 AVG(dbo.CalcularEdad(a.fecha_nacimiento)) AS EdadPromedioAlumnos,
 AVG(dbo.CalcularEdad(p.fecha_nacimiento)) AS EdadPromedioProfesores
 FROM
 alumno a
 LEFT JOIN
 profesor p ON a.ciudad = p.ciudad
 WHERE
 a.ciudad = @ciudad OR p.ciudad = @ciudad
);


-- Preguntas
-- 1. ¿Cuál es la edad de Juan Saez?
SELECT nombre, dbo.CalcularEdad(fecha_nacimiento) AS edad FROM alumno
WHERE nombre = 'Juan' AND apellido1 = 'Saez'

-- 2. ¿Quiénes son los alumnos mayores de edad?
SELECT CONCAT(nombre, ' ', apellido1, ' ', apellido2) AS Alumnos_Mayores_Edad
FROM alumno
WHERE dbo.EsMayorDeEdad(fecha_nacimiento) = 1

-- 3. ¿Cuál es la edad promedio de los alumnos en Almería?
SELECT Ciudad, EdadPromedioAlumnos FROM dbo.EstadisticasPorCiudad('Almería')

-- 4. ¿Cuántos alumnos hay en la ciudad de Madrid?
SELECT Ciudad, NumeroAlumnos FROM dbo.EstadisticasPorCiudad('Madrid')

-- 5. ¿Qué alumnos tienen menos de 20 años?
SELECT nombre, dbo.CalcularEdad(fecha_nacimiento) AS edad FROM alumno
WHERE dbo.CalcularEdad(fecha_nacimiento) < 20

-- 6. ¿Quiénes son los profesores mayores de edad?
SELECT CONCAT(nombre, ' ', apellido1, ' ', apellido2) AS Profesores_Mayores_Edad, 
dbo.CalcularEdad(fecha_nacimiento) AS edad FROM Profesor
WHERE dbo.CalcularEdad(fecha_nacimiento) > 18

-- 7. ¿Cuál es la edad promedio de los profesores en Almería?
SELECT Ciudad, EdadPromedioProfesores FROM dbo.EstadisticasPorCiudad('Almería')

-- 8. ¿Cuántos profesores hay en la ciudad de Barcelona?
SELECT Ciudad, NumeroProfesores FROM dbo.EstadisticasPorCiudad('Barcelona')

-- 9. ¿Cuál es la edad de Sonia Gea?
SELECT nombre, dbo.CalcularEdad(fecha_nacimiento) AS edad FROM alumno
WHERE nombre = 'Sonia' AND apellido1 = 'Gea'

-- 10. ¿Quiénes son los alumnos menores de edad?
SELECT CONCAT(nombre, ' ', apellido1, ' ', apellido2) AS Alumnos_Mayores_Edad
FROM alumno
WHERE dbo.EsMayorDeEdad(fecha_nacimiento) = 0

-- 11. ¿Cuál es la edad promedio de los alumnos que viven en la misma ciudad que el profesor Zoe Ramirez?
SELECT Ciudad, EdadPromedioAlumnos FROM dbo.EstadisticasPorCiudad(
	(SELECT ciudad FROM Profesor
	WHERE nombre = 'Zoe' AND apellido1 = 'Ramirez')
)

-- 12. ¿Cuántos alumnos y profesores son mayores de edad en Almería?
SELECT 
    (SELECT COUNT(*) 
     FROM Alumno 
     WHERE ciudad = 'Almería' 
     AND dbo.EsMayorDeEdad(fecha_nacimiento) = 1) AS AlumnosMayoresDeEdad,
    (SELECT COUNT(*) 
     FROM Profesor 
     WHERE ciudad = 'Almería' 
     AND dbo.EsMayorDeEdad(fecha_nacimiento) = 1) AS ProfesoresMayoresDeEdad;

-- 13. ¿Cuál es la ciudad con la mayor cantidad de alumnos menores de edad?
SELECT  distinct ciudad, COUNT(dbo.EsMayorDeEdad(fecha_nacimiento)) AS cantidad_menores_Edad  FROM Alumno
WHERE dbo.EsMayorDeEdad(fecha_nacimiento) = 1
GROUP BY ciudad , dbo.EsMayorDeEdad(fecha_nacimiento)
ORDER BY COUNT(dbo.EsMayorDeEdad(fecha_nacimiento)) desc

-- 14. ¿Qué porcentaje de alumnos y profesores en Almería son mayores de edad?

SELECT 
    ROUND((SELECT COUNT(*) * 1.0 / (SELECT COUNT(*) FROM Alumno) * 100
     FROM Alumno 
     WHERE ciudad = 'Almería' 
     AND dbo.EsMayorDeEdad(fecha_nacimiento) = 1), 2) AS Porcentaje_Alumnos_Mayores_Edad,
    ROUND((SELECT COUNT(*) * 1.0 / (SELECT COUNT(*) FROM Profesor) * 100
     FROM Profesor 
     WHERE ciudad = 'Almería' 
     AND dbo.EsMayorDeEdad(fecha_nacimiento) = 1), 2) AS Porcentaje_Profesores_Mayores_Edad;


-- 15. ¿Cuál es la edad del profesor más joven en la base de datos?
SELECT TOP 1 CONCAT(nombre, ' ', apellido1, ' ', apellido2 ) AS nombre_completo, fecha_nacimiento ,dbo.CalcularEdad(fecha_nacimiento) AS edad FROM Profesor
ORDER BY dbo.CalcularEdad(fecha_nacimiento) ASC

-- 16. ¿Cuántos alumnos y profesores hay en cada ciudad, y cuál es la edad promedio de cada grupo?

CREATE VIEW ciudades AS
SELECT DISTINCT ciudad FROM Alumno;


SELECT 
    c.ciudad,
    e.NumeroAlumnos,
    e.NumeroProfesores,
    e.EdadPromedioAlumnos,
    ISNULL( e.EdadPromedioProfesores,0) AS EdadPromedioAlumnos
FROM 
    ciudades c
CROSS APPLY 
    dbo.EstadisticasPorCiudad(c.ciudad) e;

-- 17. ¿Cuál es la ciudad con la mayor diferencia de edad promedio entre alumnos y profesores?


-- 18. ¿Cuál es la edad promedio de los alumnos que tienen el mismo apellido que algún profesor?
SELECT p.apellido1 AS apelldio1_profesor, AVG(dbo.CalcularEdad(a.fecha_nacimiento)) AS edad_promedio_alumnos FROM Profesor p
JOIN Alumno a ON p.apellido1 = a.apellido1
GROUP BY p.apellido1

-- 19. ¿Cuál es la ciudad con el mayor número de personas (alumnos y profesores) mayores de edad?
SELECT 
	TOP 1
    c.ciudad,
    e.NumeroAlumnos,
    e.NumeroProfesores,
    e.NumeroAlumnos + e.NumeroProfesores AS NumeroPersonas
FROM 
    ciudades c
CROSS APPLY 
    dbo.EstadisticasPorCiudad(c.ciudad) e
ORDER BY 
    e.NumeroAlumnos + e.NumeroProfesores DESC;

-- 20. ¿Cuántos alumnos y profesores hay en cada ciudad donde la edad promedio de los alumnos es menor 
--     de 25 años?
SELECT 
    c.ciudad,
    e.NumeroAlumnos + e.NumeroProfesores AS NumeroPersonas,
    e.EdadPromedioAlumnos
FROM 
    ciudades c
CROSS APPLY 
    dbo.EstadisticasPorCiudad(c.ciudad) e
WHERE 
	e.EdadPromedioAlumnos < 25
