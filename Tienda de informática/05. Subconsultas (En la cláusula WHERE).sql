-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
select *
from producto
WHERE id_fabricante =(select id from fabricante
               Where nombre = 'Lenovo');

-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
select * 
from producto
where precio = ( 
           select MAX(precio) 
		   from producto
                 where id_fabricante = 
			   (select id_fabricante from fabricante
			    where nombre = 'Lenovo'
				)
);

-- 3.Lista el nombre del producto más caro del fabricante Lenovo.
select *
from producto
where precio = (select MAX(precio) 
                from producto
				where id_fabricante=
				(select id 
				from fabricante
				where nombre = 'Lenovo')
				);

-- 4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
select nombre
from producto
where precio = (select MIN(precio)
                 from producto
				 where id_fabricante = 
			   (select id
			    from fabricante
				where nombre = 'Hewlett-Packard'));

-- 5.Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
select *
from producto
where precio >= (select MAX(precio)
                 from producto
				 where id_fabricante =
				 (select id
				 from fabricante
				 where nombre = 'Lenovo'));

-- 6.Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
select nombre, precio
from producto
where precio > (select AVG(precio)
                from producto
				where id_fabricante =
				(select id
				from fabricante
				where nombre = 'Asus'));
