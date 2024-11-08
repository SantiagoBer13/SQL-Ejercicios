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
	sexo CHAR(1) NOT NULL CHECK (sexo�IN�('H',�'M')),
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
	sexo CHAR(1) NOT NULL CHECK (sexo�IN�('H',�'M'))
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
INSERT INTO departamento VALUES (1, 'Inform�tica');
INSERT INTO departamento VALUES (2, 'Matem�ticas');
INSERT INTO departamento VALUES (3, 'Econom�a y Empresa');
INSERT INTO departamento VALUES (4, 'Educaci�n');
INSERT INTO departamento VALUES (5, 'Agronom�a');
INSERT INTO departamento VALUES (6, 'Qu�mica y F�sica');
INSERT INTO departamento VALUES (7, 'Filolog�a');
INSERT INTO departamento VALUES (8, 'Derecho');
INSERT INTO departamento VALUES (9, 'Biolog�a y Geolog�a');

/* Alumno */
INSERT INTO alumno VALUES (1, '89542419S', 'Juan', 'Saez', 'Vega', 'Almer�a', 'C/ Mercurio', '618253876', '1992/08/08', 'H');
INSERT INTO alumno VALUES (2, '26902806M', 'Salvador', 'S�nchez', 'P�rez', 'Almer�a', 'C/ Real del barrio alto', '950254837',
'1991/03/28', 'H');
INSERT INTO alumno VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almer�a', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H');
INSERT INTO alumno VALUES (6, '04233869Y', 'Jos�', 'Koss', 'Bayer', 'Almer�a', 'C/ J�piter', '628349590', '1998/01/28', 'H');
INSERT INTO alumno VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almer�a', 'C/ Neptuno', NULL, '1999/05/24', 'H');
INSERT INTO alumno VALUES (9, '82842571K', 'Ram�n', 'Herzog', 'Tremblay', 'Almer�a', 'C/ Urano', '626351429', '1996/11/21', 
'H');
INSERT INTO alumno VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almer�a', 'C/ Andarax', '679837625', 
'1997/04/26', 'H');
INSERT INTO alumno VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almer�a', 'C/ Picos de Europa', '678652431', 
'1998/09/01', 'M');
INSERT INTO alumno VALUES (21, '79089577Y', 'Juan', 'Guti�rrez', 'L�pez', 'Almer�a', 'C/ Los pinos', '678652431', '1998/01/01', 
'H');
INSERT INTO alumno VALUES (22, '41491230N', 'Antonio', 'Dom�nguez', 'Guerrero', 'Almer�a', 'C/ Cabo de Gata', '626652498', 
'1999/02/11', 'H');
INSERT INTO alumno VALUES (23, '64753215G', 'Irene', 'Hern�ndez', 'Mart�nez', 'Almer�a', 'C/ Zapillo', '628452384', 
'1996/03/12', 'M');
INSERT INTO alumno VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almer�a', 'C/ Mercurio', '678812017', '1995/04/13', 'M');

/* Profesor */
INSERT INTO profesor VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almer�a', 'C/ Marte', '618223876', '1979/08/19', 'M', 1);
INSERT INTO profesor VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almer�a', 'C/ Venus', '678516294', '1978/01/19', 'H', 
2);
INSERT INTO profesor VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almer�a', 'C/ Saturno', '669162534', 
'1977/08/21', 'M', 3);
INSERT INTO profesor VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almer�a', 'C/ Plut�n', NULL, '1977/05/19', 'M', 4);
INSERT INTO profesor VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almer�a', 'C/ Almanzora', NULL, '1971-04-29', 
'M', 4);
INSERT INTO profesor VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almer�a', 'C/ Guadalquivir', '950896725', 
'1980/02/01', 'H', 6);
INSERT INTO profesor VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almer�a', 'C/ Duero', '950263514', '1977/01/02', 
'H', 1);
INSERT INTO profesor VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almer�a', 'C/ Tajo', '668726354', '1980/03/14', 
'H', 2);
INSERT INTO profesor VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almer�a', 'C/ Sierra de los Filabres', NULL, 
'1982/03/18', 'H', 3);
INSERT INTO profesor VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almer�a', 'C/ Sierra de G�dor', NULL, 
'1973/05/05', 'H', 4);
INSERT INTO profesor VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almer�a', 'C/ Veleta', '662765413', 
'1976/02/25', 'H', 5);
INSERT INTO profesor VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almer�a', 'C/ Quinto pino', NULL, 
'1980/10/31', 'H', 6);
INSERT INTO profesor VALUES (21, '13175769N', 'Pepe', 'S�nchez', 'Ruiz', 'Almer�a', 'C/ Quinto pino', NULL, '1980/10/16', 'H', 
1);
INSERT INTO profesor VALUES (22, '98816696W', 'Juan', 'Guerrero', 'Mart�nez', 'Almer�a', 'C/ Quinto pino', NULL, '1980/11/21', 
'H', 1);
INSERT INTO profesor VALUES (23, '77194445M', 'Mar�a', 'Dom�nguez', 'Hern�ndez', 'Almer�a', 'C/ Quinto pino', NULL, 
'1980/12/13', 'M', 2);

/* Grado */
INSERT INTO grado VALUES (1, 'Grado en Ingenier�a Agr�cola (Plan 2015)');
INSERT INTO grado VALUES (2, 'Grado en Ingenier�a El�ctrica (Plan 2014)');
INSERT INTO grado VALUES (3, 'Grado en Ingenier�a Electr�nica Industrial (Plan 2010)');
INSERT INTO grado VALUES (4, 'Grado en Ingenier�a Inform�tica (Plan 2015)');
INSERT INTO grado VALUES (5, 'Grado en Ingenier�a Mec�nica (Plan 2010)');
INSERT INTO grado VALUES (6, 'Grado en Ingenier�a Qu�mica Industrial (Plan 2010)');
INSERT INTO grado VALUES (7, 'Grado en Biotecnolog�a (Plan 2015)');
INSERT INTO grado VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado VALUES (9, 'Grado en Matem�ticas (Plan 2010)');
INSERT INTO grado VALUES (10, 'Grado en Qu�mica (Plan 2009)');

/* Asignatura */
INSERT INTO asignatura VALUES (1, '�lgegra lineal y matem�tica discreta', 6, 'b�sica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (2, 'C�lculo', 6, 'b�sica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (3, 'F�sica para inform�tica', 6, 'b�sica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (4, 'Introducci�n a la programaci�n', 6, 'b�sica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (5, 'Organizaci�n y gesti�n de empresas', 6, 'b�sica', 1, 1, NULL, 4);
INSERT INTO asignatura VALUES (6, 'Estad�stica', 6, 'b�sica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (7, 'Estructura y tecnolog�a de computadores', 6, 'b�sica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (8, 'Fundamentos de electr�nica', 6, 'b�sica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (9, 'L�gica y algor�tmica', 6, 'b�sica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (10, 'Metodolog�a de la programaci�n', 6, 'b�sica', 1, 2, NULL, 4);
INSERT INTO asignatura VALUES (11, 'Arquitectura de Computadores', 6, 'b�sica', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (13, 'Ingenier�a del Software', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES (16, 'Bases de Datos', 6, 'b�sica', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES (19, 'Planificaci�n y Gesti�n de Proyectos Inform�ticos', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES (20, 'Programaci�n de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
INSERT INTO asignatura VALUES (22, 'Ingenier�a de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (23, 'Integraci�n de las Tecnolog�as de la Informaci�n en las Organizaciones', 6, 'optativa', 3, 1, 
NULL, 4);
INSERT INTO asignatura VALUES (24, 'Modelado y Dise�o del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (27, 'Sistema de Informaci�n para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4); 
INSERT INTO asignatura VALUES (28, 'Tecnolog�as web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (29, 'Teor�a de c�digos y criptograf�a', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (30, 'Administraci�n de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (31, 'Herramientas y M�todos de Ingenier�a del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (32, 'Inform�tica industrial y rob�tica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (33, 'Ingenier�a de Sistemas de Informaci�n', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (34, 'Modelado y Dise�o del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (35, 'Negocio Electr�nico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (36, 'Perif�ricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (38, 'Tecnolog�as de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (39, 'Tratamiento digital de im�genes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (40, 'Administraci�n de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (42, 'Fiabilidad y Gesti�n de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (43, 'L�neas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (44, 'Procesos de Ingenier�a del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (45, 'Tecnolog�as multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (46, 'An�lisis y planificaci�n de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (47, 'Desarrollo R�pido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (48, 'Gesti�n de la Calidad y de la Innovaci�n Tecnol�gica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (50, 'Procesos de Ingenier�a del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (51, 'Seguridad Inform�tica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (52, 'Biologia celular', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (53, 'F�sica', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (54, 'Matem�ticas I', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (55, 'Qu�mica general', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (56, 'Qu�mica org�nica', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (57, 'Biolog�a vegetal y animal', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (58, 'Bioqu�mica', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (59, 'Gen�tica', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (60, 'Matem�ticas II', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (61, 'Microbiolog�a', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (62, 'Bot�nica agr�cola', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (63, 'Fisiolog�a vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (64, 'Gen�tica molecular', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (65, 'Ingenier�a bioqu�mica', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (66, 'Termodin�mica y cin�tica qu�mica aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (68, 'Biotecnolog�a microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (69, 'Ingenier�a gen�tica', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (70, 'Inmunolog�a', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (71, 'Virolog�a', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (73, 'Fisiolog�a animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (74, 'Metabolismo y bios�ntesis de biomol�culas', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (75, 'Operaciones de separaci�n', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (76, 'Patolog�a molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (77, 'T�cnicas instrumentales b�sicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (78, 'Bioinform�tica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (79, 'Biotecnolog�a de los productos hortofrut�culas', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (80, 'Biotecnolog�a vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (81, 'Gen�mica y prote�mica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (82, 'Procesos biotecnol�gicos', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (83, 'T�cnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

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

-- Dar soluci�n a las siguientes consultas:
-- 1. Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado 
--    en Ingenier�a Inform�tica (Plan 2015).
SELECT a.* FROM alumno a
INNER JOIN alumno_se_matricula_asignatura am ON am.id_alumno = a.id
INNER JOIN asignatura asi ON asi.id = am.id_asignatura
INNER JOIN grado g ON g.id = asi.id
WHERE a.sexo = 'M' AND g.nombre = 'Grado en Ingenier�a Inform�tica (Plan 2015)'

-- 2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingenier�a 
--    Inform�tica (Plan 2015).
SELECT a.* FROM asignatura a
INNER JOIN grado g ON g.id = a.id_grado
WHERE g.nombre = 'Grado en Ingenier�a Inform�tica (Plan 2015)'

-- 3. Devuelve un listado de los profesores junto con el nombre del departamento al que est�n vinculados. El 
--    listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del 
--    departamento. El resultado estar� ordenado alfab�ticamente de menor a mayor por los apellidos y el 
--    nombre.
SELECT p.apellido1, p.apellido2, p.nombre AS nombre_profesor, d.nombre AS nombre_departamento FROM profesor p
INNER JOIN departamento d ON d.id = p.id_departamento

-- 4. Devuelve un listado con el nombre de las asignaturas, a�o de inicio y a�o de fin del curso escolar del 
--    alumno con nif 26902806M.
SELECT asi.nombre, ce.anyo_inicio, ce.anyo_fin FROM alumno a
INNER JOIN alumno_se_matricula_asignatura am ON am.id_alumno = a.id
INNER JOIN asignatura asi ON asi.id = am.id_asignatura
INNER JOIN curso_escolar ce ON ce.id = am.id_curso_escolar
WHERE a.nif = '26902806M'

-- 5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten 
--    alguna asignatura en el Grado en Ingenier�a Inform�tica (Plan 2015).
SELECT DISTINCT d.nombre FROM departamento d
INNER JOIN profesor p ON p.id_departamento = d.id
INNER JOIN asignatura asi ON asi.id_profesor = p.id
INNER JOIN grado g ON g.id = asi.id_grado
WHERE g.nombre = 'Grado en Ingenier�a Inform�tica (Plan 2015)'

-- 6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso 
--    escolar 2018/2019.
SELECT a.* FROM alumno a
INNER JOIN Alumno_se_matricula_asignatura am ON am.id_alumno = a.id
INNER JOIN Curso_Escolar ce ON ce.id = am.id_curso_escolar
WHERE ce.anyo_inicio >= 2018 AND ce.anyo_fin <= 2019

-- 7. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. 
--    El listado tambi�n debe mostrar aquellos profesores que no tienen ning�n departamento asociado. El 
--    listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y 
--    nombre del profesor. El resultado estar� ordenado alfab�ticamente de menor a mayor por el nombre del 
--    departamento, apellidos y el nombre.
SELECT d.nombre, p.apellido1, p.apellido2, p.nombre FROM Profesor p
LEFT JOIN departamento d ON d.id = p.id_departamento
ORDER BY d.nombre, p.apellido1, apellido2, p.nombre

-- 8. Devuelve un listado con los profesores que no est�n asociados a un departamento.
SELECT d.nombre, p.apellido1, p.apellido2, p.nombre FROM Profesor p
left JOIN departamento d ON d.id = p.id_departamento
WHERE p.id_departamento IS NULL
ORDER BY d.nombre, p.apellido1, apellido2, p.nombre

-- 9. Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT d.nombre, p.apellido1, p.apellido2, p.nombre FROM Profesor p
RIGHT JOIN departamento d ON d.id = p.id_departamento
WHERE p.id_departamento IS NULL
ORDER BY d.nombre, p.apellido1, apellido2, p.nombre

-- 10. Devuelve un listado con los profesores que no imparten ninguna asignatura.
select p.* FROM profesor p
LEFT JOIN Asignatura asi ON asi.id_profesor = p.id
WHERE asi.id_profesor IS NULL

-- 11. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT * FROM Asignatura
WHERE id_profesor IS NULL

-- 12. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido 
--     en ning�n curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la 
--     asignatura que no se haya impartido nunca.


-- 13. Devuelve el n�mero total de alumnas que hay.
SELECT COUNT(*) AS 'n�mero total de alumnas' FROM alumno
WHERE SEXO = 'M'

-- 14. Calcula cu�ntos alumnos nacieron en 1999.
SELECT COUNT(*) AS 'Alumnos que nacieron en 1999' FROM alumno
WHERE YEAR(fecha_nacimiento) = '1999'

-- 15. Calcula cu�ntos profesores hay en cada departamento. El resultado s�lo debe mostrar dos columnas, una 
--     con el nombre del departamento y otra con el n�mero de profesores que hay en ese departamento. El 
--     resultado s�lo debe incluir los departamentos que tienen profesores asociados y deber� estar ordenado 
--     de mayor a menor por el n�mero de profesores.
SELECT d.nombre, count(*) AS 'cantidad de profesores' FROM departamento d
INNER JOIN Profesor p ON p.id_departamento = d.id
GROUP BY d.nombre
ORDER BY count(*) desc

-- 16. Devuelve un listado con todos los departamentos y el n�mero de profesores que hay en cada uno de 
--     ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos 
--     departamentos tambi�n tienen que aparecer en el listado.

SELECT d.nombre, COUNT(p.id) AS 'cantidad de profesores' 
FROM departamento d
LEFT JOIN Profesor p ON p.id_departamento = d.id
GROUP BY d.nombre
ORDER BY COUNT(p.id) DESC;

-- 17. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el n�mero de 
--     asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas 
--     asociadas. Estos grados tambi�n tienen que aparecer en el listado. El resultado deber� estar ordenado 
--     de mayor a menor por el n�mero de asignaturas
SELECT g.nombre, COUNT(asi.id) as 'n�mero de asignaturas' FROM grado g
LEFT JOIN asignatura asi ON asi.id_grado = g.id
GROUP BY g.nombre
ORDER BY COUNT(asi.id) DESC
