
-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
select * 
from fabricante f
LEFT JOIN producto p on f.id = p.id_fabricante;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
select f.id, f.nombre
from fabricante f
LEFT JOIN producto p on f.id = p.id_fabricante
WHERE p.id_fabricante IS NULL;

-- 1.1.6 Consultas resumen

-- 1. Calcula el número total de productos que hay en la tabla productos.
select COUNT(id) as total_productos from producto;

-- 2.Calcula el número total de fabricantes que hay en la tabla fabricante.
select COUNT(id) as total_fabricantes from fabricante;

-- 3. Calcula la media del precio de todos los productos.
select AVG(precio) as Promedio from producto;

-- 4. Calcula el precio más barato de todos los productos.
select MIN(precio) from producto;

-- 5. Calcula el precio más caro de todos los productos.
select MAX(precio) from producto;

-- 6. Lista el nombre y el precio del producto más barato.
select nombre, precio
from producto
WHERE precio = (select MIN(precio) from producto);

-- 7. Lista el nombre y el precio del producto más caro.
select nombre, precio
from producto
WHERE precio = (select MAX(precio) from producto);

-- 8. Calcula la suma de los precios de todos los productos.
select SUM(precio) as total_precio from producto;

-- 9. Calcula el número de productos que tiene el fabricante Asus.
select COUNT(p.id) as Total_ASUS
from producto p
RIGHT JOIN fabricante f on p.id_fabricante = f.id
WHERE f.nombre = 'Asus';

-- 10. Calcula la media del precio de todos los productos del fabricante Asus.
select AVG(p.precio) as Total_ASUS
from producto p
RIGHT JOIN fabricante f on p.id_fabricante = f.id
WHERE f.nombre = 'Asus';

-- 11. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
select MAX(p.precio) as precioMAX, MIN(p.precio) as precioMIN, 
       AVG(p.precio) as precioMedio, COUNT(p.id) as totalP,
	   f.nombre as nombreF
from fabricante f
LEFT JOIN producto p on f.id = p.id_fabricante
WHERE f.nombre = 'Crucial'
GROUP BY f.nombre;

-- 12. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
select f.nombre, COUNT(p.id) as TotalP
from fabricante f
LEFT JOIN producto p on f.id = p.id_fabricante
GROUP BY f.nombre
ORDER BY TotalP DESC;

-- 13. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
select f.nombre, COUNT(p.id) as Total
from fabricante f
JOIN producto p on f.id = p.id_fabricante
WHERE p.precio >= 220
GROUP BY f.nombre;