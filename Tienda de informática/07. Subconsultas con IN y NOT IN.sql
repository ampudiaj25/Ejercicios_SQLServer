
-- 1. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
select nombre
from fabricante f
where EXISTS (select * from producto p 
               where f.id = p.id_fabricante);

-- 2. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select nombre
from fabricante f
where NOT EXISTS(select * from producto p
                 where f.id = p.id_fabricante);
