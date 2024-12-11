-- MySQL Script

#Diagrama E/R: https://sql-playground.com/diagrams/tienda.png

#Query para crear bd, crear tablas, insertar registros.

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  id_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

#Consultas Sencillas.

# 1) Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

# 2) Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

# 3) Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

# 4) Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio, precio * 1.15 FROM producto;

# 5) Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS 'nombre de producto', precio AS 'euros', precio * 1.15 AS 'dólares' FROM producto;

# 6) Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio FROM producto;

# 7) Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio FROM producto;

# 8) Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;

# 9) Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio) FROM producto;

# 10) Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, truncate(precio,0) FROM producto;

# 11) Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT id_fabricante FROM producto;

# 12) Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT(id_fabricante) FROM producto;

# 13) Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante
ORDER BY nombre ASC;

# 14) Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante
ORDER BY nombre DESC;

# 15) Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto
ORDER BY nombre ASC, precio DESC;

# 16) Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante
LIMIT 5;

# 17) Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM fabricante
LIMIT 3,2;

# 18) Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto
ORDER BY precio ASC
LIMIT 1;

# 19) Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto
ORDER BY precio DESC
LIMIT 1;

# 20) Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM producto
WHERE id_fabricante = 2;

# 21) Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre FROM producto
WHERE precio <= 120;

# 22) Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto
WHERE precio >= 400;

# 23) Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto
WHERE precio < 400;

# 24) Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT * FROM producto
WHERE precio > 80 AND precio < 300;

# 25) Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT * FROM producto
WHERE precio BETWEEN 80 AND 300;

# 26) Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT * FROM producto
WHERE precio > 200 AND id_fabricante = 6;

# 27) Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT * FROM producto
WHERE id_fabricante = 1 OR id_fabricante = 3 OR id_fabricante = 5;

# 28) Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM producto
WHERE id_fabricante IN (1,3,5);

# 29) Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio * 100 AS 'céntimos' FROM producto;

# 30) Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante
WHERE SUBSTRING(nombre,1,1) = 'S';

# 31) Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante
WHERE SUBSTRING(nombre,LENGTH(nombre),1) = 'e';

# 32) Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante
WHERE nombre LIKE '%w%';

# 33) Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante
WHERE LENGTH(nombre) = 4;

# 34) Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM producto
WHERE nombre LIKE '%Portátil%';

# 35) Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre FROM producto
WHERE nombre LIKE '%Monitor%' AND precio < 215;

# 36) Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio FROM producto
WHERE precio >= 180 
ORDER BY precio DESC, nombre ASC;


# Composición Interna

# 1) Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT p.nombre, p.precio, f.nombre FROM producto p
INNER JOIN fabricante f ON f.id = p.id_fabricante;

# 2) Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre, p.precio, f.nombre FROM producto p
INNER JOIN fabricante f ON f.id = p.id_fabricante
ORDER BY f.nombre;

# 3) Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT p.id, p.nombre, f.id, f.nombre FROM producto p
INNER JOIN fabricante f ON f.id = p.id_fabricante;

# 4) Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT p.nombre, p.precio, f.nombre FROM producto p
INNER JOIN fabricante f ON f.id = p.id_fabricante
ORDER BY p.precio ASC
LIMIT 1;

# 5) Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT p.nombre, p.precio, f.nombre FROM producto p
INNER JOIN fabricante f ON f.id = p.id_fabricante
ORDER BY p.precio DESC
LIMIT 1;

# 6) Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto p
INNER JOIN fabricante f ON f.id = p.id_fabricante
WHERE f.nombre = 'Lenovo';

# 7) Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT * FROM producto p
INNER JOIN fabricante f ON f.id = p.id_fabricante
WHERE f.nombre = 'Crucial' AND p.precio > 200;

# 8) Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT * FROM producto p
INNER JOIN fabricante f ON f.id = p.id_fabricante
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

# 9) Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT * FROM producto p
INNER JOIN fabricante f ON f.id = p.id_fabricante
WHERE f.nombre IN ( 'Asus','Hewlett-Packard', 'Seagate');

# 10) Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT p.nombre, p.precio FROM producto p
INNER JOIN fabricante f ON f.id = p.id_fabricante
WHERE f.nombre LIKE "%e";

# 11) Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT p.nombre, p.precio FROM producto p
INNER JOIN fabricante f ON f.id = p.id_fabricante
WHERE f.nombre LIKE "%w%";

# 12) Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT p.nombre, p.precio, f.nombre FROM producto p
INNER JOIN fabricante f ON f.id = p.id_fabricante
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

# 13) Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT(f.id), f.nombre FROM fabricante f
INNER JOIN producto p ON f.id = p.id_fabricante;


# Composición Externa

# 1) Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT * FROM fabricante f 
LEFT JOIN producto p ON p.id_fabricante = f.id;

# 2) Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT * FROM fabricante f 
LEFT JOIN producto p ON p.id_fabricante = f.id
WHERE p.id_fabricante IS NULL;


# SubConsultas

# 1) Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto p
WHERE p.id_fabricante IN (SELECT id FROM fabricante WHERE nombre = 'Lenovo');

# 2) Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto
WHERE precio = (SELECT precio FROM producto p
WHERE p.id_fabricante IN (SELECT id FROM fabricante WHERE nombre = 'Lenovo')
ORDER BY precio DESC
LIMIT 1);

# 3) Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre FROM producto p
WHERE p.id_fabricante IN (SELECT id FROM fabricante WHERE nombre = 'Lenovo')
ORDER BY precio DESC
LIMIT 1;

# 4) Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT nombre FROM producto p
WHERE p.id_fabricante IN (SELECT id FROM fabricante WHERE nombre = 'Hewlett-Packard')
ORDER BY precio ASC
LIMIT 1;

# 5) Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM producto
WHERE precio >= (SELECT precio FROM producto p
WHERE p.id_fabricante IN (SELECT id FROM fabricante WHERE nombre = 'Lenovo')
ORDER BY precio DESC
LIMIT 1);

# 6) Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM producto
WHERE precio > (SELECT AVG(precio) FROM producto WHERE id_fabricante IN (SELECT id FROM fabricante WHERE nombre = 'Asus')) AND id_fabricante IN (SELECT id FROM fabricante WHERE nombre = 'Asus');

# 7) Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT * FROM producto
WHERE precio >= ALL (SELECT precio FROM producto);

# 8) Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT * FROM producto
WHERE precio <= ALL (SELECT precio FROM producto);

# 9) Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre FROM fabricante
WHERE id = ANY (SELECT id_fabricante FROM producto);

# 10) Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre FROM fabricante
WHERE id != ALL (SELECT id_fabricante FROM producto);

# 11) Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre FROM fabricante
WHERE id IN (SELECT id_fabricante FROM producto);

# 12) Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre FROM fabricante
WHERE id NOT IN (SELECT id_fabricante FROM producto);

# 13) Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre FROM fabricante fab
WHERE EXISTS (SELECT id_fabricante FROM producto pro WHERE pro.id_fabricante = fab.id);

# 14) Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre FROM fabricante fab
WHERE NOT EXISTS (SELECT id_fabricante FROM producto pro WHERE pro.id_fabricante = fab.id);