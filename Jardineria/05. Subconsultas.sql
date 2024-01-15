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

/*Devuelve el nombre, los apellidos y el email de los 
empleados que están a cargo de Alberto Soria.*/
select e.nombre, e.apellido1, e.apellido2, e.email
from empleado e
JOIN empleado em on e.codigo_jefe = em.codigo_empleado
WHERE em.nombre = 'Alberto' AND em.apellido1 = 'Soria';

/*Devuelve el nombre del cliente con mayor límite de crédito.*/
select c.nombre_cliente, c.limite_credito
from cliente c
WHERE c.limite_credito >= all (select limite_credito
                              from cliente)
/*Devuelve el nombre del producto que tenga el precio de venta 
más caro.*/
select p.nombre 
from producto p
WHERE p.precio_venta >= all (select precio_venta
                         from producto);
/*Devuelve el producto que menos unidades tiene en stock.*/
select *
from producto p
WHERE p.cantidad_en_stock <= all (select cantidad_en_stock
                                  from producto)

/*Devuelve el nombre, apellido1 y cargo de los empleados que
no representen a ningún cliente.*/
select e.nombre, e.apellido1, e.puesto
from empleado e
WHERE e.codigo_empleado NOT IN (select c.codigo_empleado_rep_ventas
                                from cliente c);

/*Devuelve un listado que muestre solamente los clientes que
no han realizado ningún pago.*/
select c.*
from cliente c
WHERE c.codigo_cliente NOT IN (select p.codigo_cliente
                               from pago p);

/*Devuelve un listado que muestre solamente los clientes que
sí han realizado algún pago.*/
select c.*
from cliente c
WHERE c.codigo_cliente IN (select p.codigo_cliente
                           from pago p);

/*Devuelve un listado de los productos que nunca han aparecido
en un pedido.*/
select *
from producto p
WHERE p.codigo_producto NOT IN (select d.codigo_producto
                                from detalle_pedido d);

/*Devuelve el nombre, apellidos, puesto y teléfono de la oficina
de aquellos empleados que no sean representante de ventas de
ningún cliente.*/
select e.nombre, e.apellido1, e.puesto, o.telefono
from empleado e
JOIN oficina o on e.codigo_oficina = o.codigo_oficina
WHERE e.codigo_empleado NOT IN (select c.codigo_empleado_rep_ventas
                                from cliente c);

/*Devuelve las oficinas donde no trabajan ninguno de los empleados
que hayan sido los representantes de ventas de algún cliente que haya
realizado la compra de algún producto de la gama Frutales.*/
SELECT *
FROM oficina o
WHERE o.codigo_oficina NOT IN (
    SELECT DISTINCT e.codigo_oficina
    FROM empleado e
    JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
    JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
    JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
    WHERE pr.gama = 'Frutales'
);

/*EXISTS Y NOT EXISTS*/
/*Devuelve un listado que muestre solamente los clientes que no han 
realizado ningún pago.*/
select *
from cliente c
WHERE NOT EXISTS(select p.codigo_cliente
                  from pago p
				  WHERE c.codigo_cliente = p.codigo_cliente);

/*Devuelve un listado que muestre solamente los clientes que sí 
han realizado algún pago.*/
select *
from cliente c
WHERE EXISTS(select p.codigo_cliente
                  from pago p
				  WHERE c.codigo_cliente = p.codigo_cliente);

/*Devuelve un listado de los productos que nunca han aparecido
en un pedido.*/
select *
from producto p
WHERE NOT EXISTS (select d.codigo_producto
                  from detalle_pedido d
				  where p.codigo_producto = d.codigo_producto);

/*Devuelve un listado de los productos que han aparecido en un
pedido alguna vez.*/
select *
from producto p
WHERE EXISTS (select d.codigo_producto
                  from detalle_pedido d
				  where p.codigo_producto = d.codigo_producto);


























































select * from producto
select * from cliente
select * from empleado












select * from producto
select * from pago