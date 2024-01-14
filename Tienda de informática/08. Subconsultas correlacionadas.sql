
-- 1. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
select f.nombre, p.nombre, p.precio
from fabricante f
JOIN producto p on f.id = p.id_fabricante
WHERE p.precio = (select MAX(precio) 
                  from producto
				  where id_fabricante = f.id);

-- 2. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
select *
from producto p
JOIN fabricante f on p.id_fabricante = f.id
WHERE p.precio >= (select AVG(precio)
                   from producto
				   where id_fabricante = f.id)
   
-- 3. Lista el nombre del producto más caro del fabricante Lenovo.
select *
from producto p
where p.precio = (select MAX(precio)
                  from producto
				  where id_fabricante =
				  (select id
				  from fabricante f
				  where f.nombre = 'Lenovo'));
