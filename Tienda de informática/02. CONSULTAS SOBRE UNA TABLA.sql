
-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre, precio from producto;

--3. Lista todas las columnas de la tabla producto.
select * from producto;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
select nombre, precio/3900 as Dolares, precio/5000 as Euros from producto;

-- 5. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
select UPPER(nombre) as nombre from producto;

-- 6. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
select nombre, LEFT(UPPER(nombre),2) as Caracter from fabricante;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre, precio, ROUND(precio,1) as Redondeo from producto;

-- 8. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre, CONVERT(INT, precio) as Precio from producto;

-- 9. Lista el identificador de los fabricantes que tienen productos en la tabla producto.
select f.id
from fabricante f
JOIN  producto t on t.id_fabricante = f.id;

-- 10. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
select DISTINCT f.id
from fabricante f
JOIN  producto t on t.id_fabricante = f.id;

-- 11. Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre 
from fabricante
ORDER BY nombre ASC;

-- 12 . Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre 
from fabricante
ORDER BY nombre DESC;

-- 13. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
select nombre, precio 
from producto
ORDER BY nombre ASC, precio DESC; 

-- 14. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select TOP 5 * from fabricante;

-- 15. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
select * 
from fabricante
ORDER BY id
OFFSET 3 ROWS
FETCH NEXT 2 ROWS ONLY;

-- 16. Lista el nombre y el precio del producto más barato.
select nombre, precio
from producto 
where precio = (select min(precio) from producto);

-- 17. Lista el nombre y el precio del producto más caro.
select nombre, precio
from producto
where precio = (select max(precio) from producto);

-- 18. Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
select nombre
from producto 
where producto.id_fabricante = 2;

-- 19. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select * 
from producto
where id_fabricante = 1 or id_fabricante = 2 or id_fabricante = 5
order by id_fabricante ASC;

-- 20. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select *
from producto
where id_fabricante in(1,2,5)
order by id_fabricante ASC;

-- 21. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
select nombre, precio, precio * 100 as Centimos
from producto;

-- 22. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre
from fabricante
where LEFT(nombre, 1) = 's';

-- 23. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre
from fabricante
where RIGHT(nombre, 1) = 'e';

-- 24. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre
from fabricante
where nombre LIKE '%w%';

-- 25. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre
from fabricante
where LEN(nombre) = 4;

-- 26. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
select nombre
from producto
where nombre LIKE '%Portátil%';

-- 27. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 230 €.
select nombre, precio
from producto
where nombre LIKE '%Monitor%' and precio >230;

-- 28. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
select nombre, precio
from producto
where precio >= 180
order by precio DESC, nombre ASC;