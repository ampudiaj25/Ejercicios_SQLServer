
-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
select p.nombre, p.precio, f.nombre
from producto p
JOIN fabricante f on  p.id_fabricante = f.id;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
select p.nombre, p.precio, f.nombre
from producto p
JOIN fabricante f on  p.id_fabricante = f.id
order by f.nombre;

-- 3. Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
select p.id, p.nombre, f.id, f.nombre
from producto p
JOIN fabricante f on p.id_fabricante = p.id_fabricante;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
select p.nombre, p.precio, f.nombre
from producto p
JOIN fabricante f on p.id_fabricante = f.id
where precio = (select MIN(precio) from producto);

-- 5.Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
select p.nombre, p.precio, f.nombre
from producto p
JOIN fabricante f on p.id_fabricante = f.id
where precio = (select MAX(precio) from producto);

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
select *
from producto p
JOIN fabricante f on p.id_fabricante = f.id
WHERE f.nombre = 'Lenovo';

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
select *
from producto p
JOIN fabricante f on p.id_fabricante = f.id
WHERE f.nombre = 'Crucial' and p.precio > 200;

-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
select * 
from producto p
JOIN fabricante f on p.id_fabricante = f.id
WHERE f.nombre = 'Asus' or  f.nombre = 'Hewlett-Packard' or f.nombre = 'Seagate'

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
select * 
from producto p
JOIN fabricante f on p.id_fabricante = f.id
WHERE f.nombre in('Asus', 'Hewlett-Packard', 'Seagate');

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
select *
from producto p
JOIN fabricante f on p.id_fabricante = f.id
WHERE RIGHT(f.nombre,1) = 'e';

-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
select * 
from producto p
JOIN fabricante f on p.id_fabricante = f.id
WHERE f.nombre LIKE '%w%'; 