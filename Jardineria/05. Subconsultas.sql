/*Devuelve el nombre del cliente con mayor límite de crédito.*/
select TOP 1 c.nombre_cliente, c.limite_credito
from cliente c
order by c.limite_credito DESC

/*Devuelve el nombre del producto que tenga el precio de venta más caro.*/
select TOP 1 p.nombre, p.precio_venta
from producto p
order by p.precio_venta DESC

/*Devuelve el nombre del producto del que se han vendido más unidades.
(Tenga en cuenta que tendrá que calcular cuál es el número total de 
unidades que se han vendido de cada producto a partir de los datos de la
tabla detalle_pedido)*/
select TOP 1 p.nombre, COUNT(d.cantidad) as cantidad
from producto p
JOIN detalle_pedido d on p.codigo_producto = d.codigo_producto
GROUP BY p.nombre
ORDER BY cantidad DESC

/*Los clientes cuyo límite de crédito sea mayor que los pagos que haya
realizado. (Sin utilizar INNER JOIN).*/
select c.*
from cliente c 
WHERE c.limite_credito > (select SUM(p.total) as total
                              from pago p
							  where c.codigo_cliente = p.codigo_cliente)

/*Devuelve el producto que más unidades tiene en stock.*/
select TOP 1 p.nombre, MAX(p.cantidad_en_stock) as STOCK
from producto p
GROUP BY p.nombre
ORDER BY STOCK DESC


select * from producto
select * from pago