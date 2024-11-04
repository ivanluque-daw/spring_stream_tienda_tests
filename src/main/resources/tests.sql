-- 1. Lista los nombres y los precios de todos los productos de la tabla producto
SELECT nombre, precio FROM tienda.producto;

-- 2. Devuelve una lista de Producto completa con el precio de euros convertido a dólares .
SELECT nombre, precio * 1.09 as precio FROM tienda.producto;

-- 3. Lista los nombres y los precios de todos los productos, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre) as nombre, precio FROM tienda.producto;

-- 4. Lista el nombre de todos los fabricantes y a continuación en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT CONCAT(nombre, ' (', UPPER(SUBSTR(nombre, 1, 2)) , ')') as nombre FROM tienda.fabricante;

-- 5. Lista el código de los fabricantes que tienen productos.
SELECT codigo  FROM tienda.fabricante WHERE codigo IN (SELECT DISTINCT codigo_fabricante FROM tienda.producto);

-- 6. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;

-- 7. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre FROM tienda.producto ORDER BY nombre, precio DESC;

-- 8. Devuelve una lista con los 5 primeros fabricantes.
SELECT * FROM tienda.fabricante LIMIT 5;

-- 9. Devuelve una lista con 2 fabricantes a partir del cuarto fabricante. El cuarto fabricante también se debe incluir en la respuesta.
SELECT * FROM tienda.fabricante LIMIT 2 OFFSET 3;

-- 10. Lista el nombre y el precio del producto más barato
SELECT nombre, precio FROM tienda.producto WHERE precio = (SELECT MIN(precio) FROM tienda.producto);

-- 11. Lista el nombre y el precio del producto más caro
SELECT nombre, precio FROM tienda.producto WHERE precio = (SELECT MAX(precio) FROM tienda.producto);

-- 12. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM tienda.producto WHERE codigo_fabricante = 2;

-- 13. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre FROM tienda.producto WHERE precio <= 120;

-- 14. Lista los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM tienda.producto WHERE precio >= 400;

-- 15. Lista todos los productos que tengan un precio entre 80€ y 300€.
SELECT nombre FROM tienda.producto WHERE precio > 80 AND precio < 300;

-- 16. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT nombre FROM tienda.producto WHERE precio > 200 AND codigo_fabricante = 6;

-- 17. Lista todos los productos donde el código de fabricante sea 1, 3 o 5 utilizando un Set de codigos de fabricantes para filtrar.
SELECT nombre FROM tienda.producto WHERE codigo_fabricante IN (1, 3, 5);

-- 18. Lista el nombre y el precio de los productos en céntimos.
SELECT nombre, precio * 100 as precio FROM tienda.producto;

-- 19. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S
SELECT nombre FROM tienda.fabricante WHERE nombre LIKE 'S%';

-- 20. Devuelve una lista con los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM tienda.producto WHERE nombre LIKE '%Portátil%';

-- 21. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre FROM tienda.producto WHERE nombre LIKE '%Monitor%' AND precio < 215;

-- 22. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio FROM tienda.producto WHERE precio >= 180 ORDER BY precio DESC, nombre;

-- 23. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre, p.precio, f.nombre FROM tienda.producto as p INNER JOIN tienda.fabricante as f on p.codigo_fabricante = f.codigo ORDER BY f.nombre;

-- 24. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT p.nombre, p.precio, f.nombre FROM tienda.producto as p INNER JOIN tienda.fabricante as f on p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MAX(precio) FROM tienda.producto) ORDER BY f.nombre;

-- 25. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT p.nombre, p.precio, f.nombre FROM tienda.producto as p INNER JOIN tienda.fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- 26. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate.
SELECT p.* FROM tienda.producto as p INNER JOIN tienda.fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 27. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre.
SELECT p.nombre, p.precio, f.nombre FROM tienda.producto as p INNER JOIN tienda.fabricante as f on p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre;

-- 28. Devuelve un listado de los nombres fabricantes que existen en la base de datos, junto con los nombres productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT f.nombre AS fabricante, GROUP_CONCAT(p.nombre SEPARATOR ', ') AS productos FROM tienda.fabricante as f LEFT JOIN tienda.producto as p ON f.codigo = p.codigo_fabricante GROUP BY f.nombre ORDER BY f.nombre;

-- 29. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT f.* FROM tienda.fabricante as f LEFT JOIN tienda.producto as p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;

-- 30. Calcula el número total de productos que hay en la tabla productos. Utiliza la api de stream.
SELECT COUNT(*) as count FROM tienda.producto;

-- 31. Calcula el número de fabricantes con productos, utilizando un stream de Productos.
SELECT COUNT(DISTINCT codigo_fabricante) as count FROM tienda.producto;

-- 32. Calcula la media del precio de todos los productos
SELECT AVG(precio) as precio FROM tienda.producto;

-- 33. Calcula el precio más barato de todos los productos. No se puede utilizar ordenación de stream.
SELECT MIN(precio) as precio FROM tienda.producto;

-- 34. Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) as precio FROM tienda.producto;

-- 35. Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(*) as count FROM tienda.producto as p INNER JOIN tienda.fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';

-- 36. Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(p.precio) as count FROM tienda.producto as p INNER JOIN tienda.fabricante as f on p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';

-- 37. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial. Realízalo en 1 solo stream principal. Utiliza reduce con Double[] como "acumulador".
SELECT MAX(precio) as max, MIN(precio) as min, AVG(precio) as average, COUNT(*) as count FROM tienda.producto as p INNER JOIN tienda.fabricante as f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial';

-- 38. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT f.nombre, COUNT(p.nombre) FROM tienda.producto as p LEFT JOIN tienda.fabricante as f ON p.codigo_fabricante = f.codigo GROUP BY f.nombre;

-- 39. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan. Realízalo en 1 solo stream principal. Utiliza reduce con Double[] como "acumulador".


-- 40. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
-- 41. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
-- 42. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. Ordenado de mayor a menor número de productos.
-- 43. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €
-- 44. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €. Ordenado de menor a mayor por cuantía de precio de los productos.
-- 45. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
-- 46. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante. Se ordenará por fabricante en orden alfabético ascendente y los productos de cada fabricante tendrán que estar ordenados por precio descendente.