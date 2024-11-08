DROP DATABASE IF EXISTS CasoEstudioI;
CREATE DATABASE CasoEstudioI;
USE CasoEstudioI;

CREATE TABLE departamento(
  codigo INT PRIMARY KEY,
  nombre NVARCHAR(100) NOT NULL,
  presupuesto FLOAT NOT NULL,
  gastos FLOAT NOT NULL
)

CREATE TABLE empleado(
  codigo INT PRIMARY KEY,
  nif NVARCHAR(9) NOT NULL,
  nombre NVARCHAR(100) NOT NULL,
  apellido1 NVARCHAR(100) NOT NULL,
  apellido2 NVARCHAR(100),
  codigo_departamento INT,
  FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
)

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);


-- Dar solución a las siguientes consultas:
-- 1. Lista el primer apellido de todos los empleados
SELECT apellido1 FROM empleado;

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos
SELECT DISTINCT apellido1 FROM empleado;

-- 3. Lista todas las columnas de la tabla empleado
SELECT * FROM empleado;

-- 4. Lista el nombre y los apellidos de todos los empleados
SELECT nombre, apellido1, apellido2 FROM empleado;

-- 5. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado
SELECT codigo_departamento FROM empleado;

-- 6. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado, 
--    eliminando los códigos que aparecen repetidos
SELECT DISTINCT codigo_departamento FROM empleado;

-- 7. Lista el nombre y apellidos de los empleados en una única columna
SELECT CONCAT(nombre,' ',apellido1,' ',apellido2) FROM empleado

-- 8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los 
--    caracteres en mayúscula
SELECT UPPER(CONCAT(nombre,' ',apellido1,' ',apellido2)) FROM empleado

-- 9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los 
--    caracteres en minúscula
SELECT LOWER(CONCAT(nombre,' ',apellido1,' ',apellido2)) FROM empleado

-- 10. Lista el código de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, 
--     una mostrará únicamente los dígitos del nif y la otra la letra
SELECT 
    codigo,
    nif,
    SUBSTRING(nif,1, LEN(nif) - 1) AS nif_numeros,
    SUBSTRING(nif, LEN(nif),1) AS nif_letra
FROM Empleado;

SELECT 
    codigo,
    nif,
    LEFT(nif, LEN(nif) - 1) AS nif_numeros,
    RIGHT(nif, 1) AS nif_letra
FROM Empleado;

-- 11. Lista el nombre de todos los departamentos ordenados de forma ascendente
SELECT nombre FROM departamento
ORDER BY nombre ASC

-- 12. Lista el nombre de todos los departamentos ordenados de forma descendente
SELECT nombre FROM departamento
ORDER BY nombre DESC

-- 13. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética teniendo en 
--     cuenta en primer lugar sus apellidos y luego su nombre
SELECT apellido1, apellido2, nombre FROM empleado
ORDER BY apellido1, apellido2, nombre

-- 14. Devuelve una lista con el nombre y el presupuesto de los 3 departamentos que tienen mayor 
--     presupuesto
SELECT TOP(3) nombre, presupuesto FROM departamento
ORDER BY presupuesto DESC

-- 15. Devuelve una lista con el nombre y el presupuesto de los 3 departamentos que tienen menor 
--     presupuesto
SELECT TOP(3) nombre, presupuesto FROM departamento
ORDER BY presupuesto ASC

-- 16. Devuelve una lista con el nombre y el gasto de los 2 departamentos que tienen mayor gasto
SELECT TOP(2) nombre, gastos FROM departamento
ORDER BY gastos DESC

-- 17. Devuelve una lista con el nombre y el gasto de los 2 departamentos que tienen menor gasto
SELECT TOP(2) nombre, gastos FROM departamento
ORDER BY gastos ASC

-- 18. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado, incluyendo todas las 
--     columnas de la tabla empleado
SELECT TOP(5) *
FROM Empleado
WHERE codigo > 2
ORDER BY codigo

-- 19. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un 
--     presupuesto mayor o igual a 150,000 euros
SELECT nombre, presupuesto FROM departamento
WHERE presupuesto >= 150000

-- 20. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 
--     5000 euros de gastos
SELECT nombre, gastos FROM departamento
WHERE gastos < 5000

-- 21. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un 
--     presupuesto entre 100,000 y 200,000 euros, sin utilizar el operador BETWEEN
SELECT nombre, presupuesto FROM departamento
WHERE presupuesto >= 100000 AND presupuesto <= 200000

-- 22. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 
--     100,000 y 200,000 euros, sin utilizar el operador BETWEEN
SELECT nombre, presupuesto FROM departamento
WHERE presupuesto < 100000 OR presupuesto > 200000

-- 23. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100,000 y 
--     200,000 euros, utilizando el operador BETWEEN
SELECT nombre, presupuesto FROM departamento
WHERE presupuesto BETWEEN 100000 AND 200000

-- 24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 
--     100,000 y 200,000 euros, utilizando el operador BETWEEN
SELECT nombre, presupuesto FROM departamento
WHERE presupuesto NOT BETWEEN 100000 AND 200000

-- 25. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos 
--     departamentos donde los gastos sean mayores que el presupuesto del que disponen
SELECT nombre, presupuesto, gastos FROM departamento
WHERE gastos > presupuesto

-- 26. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos 
--     departamentos donde los gastos sean menores que el presupuesto del que disponen
SELECT nombre, presupuesto, gastos FROM departamento
WHERE gastos < presupuesto

-- 27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos 
--     departamentos donde los gastos sean iguales al presupuesto del que disponen
SELECT nombre, gastos, presupuesto FROM departamento
WHERE gastos = presupuesto

-- 28. Lista todos los datos de los empleados cuyo segundo apellido sea NULL
SELECT * FROM empleado
WHERE apellido2 IS NULL

-- 29. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL
SELECT * FROM empleado
WHERE apellido2 IS NOT NULL

-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea López
SELECT * FROM empleado
WHERE apellido2 = 'López'

-- 31. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno, sin utilizar el 
--     operador IN
SELECT * FROM empleado
WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno'

-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno, utilizando el 
-- operador IN
SELECT * FROM empleado
WHERE apellido2 IN ('Díaz', 'Moreno')

-- 33. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3
SELECT nombre,  apellido1, apellido2, nif FROM empleado
WHERE codigo_departamento = 3

-- 34. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5
SELECT nombre,  apellido1, apellido2, nif FROM empleado
WHERE codigo_departamento IN (2,4,5)