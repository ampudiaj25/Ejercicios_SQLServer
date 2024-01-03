-- 1. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
select *
from producto
 where precio >= all (select precio from producto);

 -- 2.Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
 select *
from producto
 where precio <= all (select precio from producto);

-- 3. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
select *
from producto
where id_fabricante = any (select id from fabricante);

-- 4. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
select *
from fabricante
where id != all (select id_fabricante from producto);