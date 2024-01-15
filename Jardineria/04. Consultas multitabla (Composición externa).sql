/*Devuelve un listado que muestre solamente los clientes que no han realizado
ningún pago.*/
select c.*
from cliente c
LEFT JOIN pago p on c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL

/*Devuelve un listado que muestre solamente los clientes que no han realizado
ningún pedido.*/
select c.*
from cliente c
LEFT JOIN pedido p on c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL

/*Devuelve un listado que muestre los clientes que no han realizado ningún
pago y los que no han realizado ningún pedido.*/
select c.*
from cliente c
LEFT JOIN pago t on c.codigo_cliente = t.codigo_cliente
LEFT JOIN pedido p on c.codigo_cliente = p.codigo_cliente
WHERE t.codigo_cliente IS NULL and p.codigo_cliente IS NULL;

/*Devuelve un listado que muestre solamente los empleados que no tienen
una oficina asociada.*/
select e.*
from empleado e
LEFT JOIN oficina o on e.codigo_oficina = o.codigo_oficina
WHERE e.codigo_oficina IS NULL

/*Devuelve un listado que muestre solamente los empleados que no tienen
un cliente asociado.*/
select e.*
from empleado e
LEFT JOIN  cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.codigo_empleado_rep_ventas IS NULL

/*Devuelve un listado que muestre solamente los empleados que no tienen un
cliente asociado junto con los datos de la oficina donde trabajan.*/
select e.*, o.*
from empleado e
LEFT JOIN cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
JOIN oficina o on e.codigo_oficina = o.codigo_oficina
WHERE c.codigo_empleado_rep_ventas IS NULL;

/*Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan
sido los representantes de ventas de algún cliente que haya realizado la
compra de algún producto de la gama Frutales.*/
SELECT *
FROM oficina o
LEFT JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
LEFT JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
LEFT JOIN gama_producto gp ON pr.gama = gp.gama AND gp.gama = 'Frutales';


/*Devuelve un listado con los clientes que han realizado algún pedido pero
no han realizado ningún pago.*/
select c.*
from cliente c
JOIN pedido p on c.codigo_cliente = p.codigo_cliente
LEFT JOIN pago pg on p.codigo_pedido = pg.codigo_cliente
WHERE pg.codigo_cliente IS NULL;

/*Devuelve un listado con los datos de los empleados que no tienen clientes
asociados y el nombre de su jefe asociado.*/
select e.*, em.nombre as Nombre_JEFE
from empleado e
LEFT JOIN cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN empleado em on e.codigo_jefe = em.codigo_empleado
WHERE c.codigo_empleado_rep_ventas IS NULL;




















select * from gama_producto
select * from producto










select * from cliente
select * from empleado
select * from oficina
select * from gama_producto
select * from pedido
