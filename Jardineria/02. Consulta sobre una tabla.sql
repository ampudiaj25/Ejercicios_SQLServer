use jardineria
/* 1.Devuelve un listado con el código de oficina y 
la ciudad donde hay oficinas.*/
select codigo_postal, ciudad from oficina;

/*Devuelve un listado con la ciudad y el teléfono de las 
oficinas de España.*/
select ciudad, telefono
from oficina where pais = 'España';

/*Devuelve un listado con el nombre, apellidos y email de
los empleados cuyo jefe tiene un código de jefe igual a 7.*/
select nombre, apellido1, email 
from empleado
where codigo_jefe = 7

/*Devuelve el nombre del puesto, nombre, apellidos y email
del jefe de la empresa.*/
select puesto, nombre, apellido1, email
from empleado
where puesto = 'Director General'

/*Devuelve un listado con el nombre, apellidos y puesto de
aquellos empleados que no sean representantes de ventas.*/
select nombre, apellido1, puesto
from empleado
where puesto != 'Representante Ventas'

/*Devuelve un listado con el nombre de los todos los clientes
españoles.*/
select nombre_cliente
from cliente
where pais = 'Spain'

/*Devuelve un listado con los distintos estados por los que puede
pasar un pedido.*/
select DISTINCT estado
from pedido

/*Devuelve un listado con el código de cliente de aquellos clientes
que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
Utilizando la función YEAR de MySQL.
Utilizando la función DATE_FORMAT de MySQL.
Sin utilizar ninguna de las funciones anteriores.*/
select DISTINCT p.codigo_cliente
from pago p
JOIN cliente c on p.codigo_cliente = c.codigo_cliente
WHERE YEAR(p.fecha_pago) = 2008;

/*Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.*/
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega, comentarios
from pedido
where fecha_entrega > fecha_esperada;

/*Devuelve un listado con el código de pedido, código de cliente, fecha esperada
y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos 
días antes de la fecha esperada.
Utilizando la función ADDDATE de MySQL.
Utilizando la función DATEDIFF de MySQL.
¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?*/
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where DATEDIFF(DAY,fecha_esperada, fecha_entrega) = 2;

/*Devuelve un listado de todos los pedidos que fueron rechazados en 2009.*/
select *
from pedido
WHERE estado = 'Rechazado' and YEAR(fecha_pedido) = 2009; 

/*Devuelve un listado de todos los pedidos que han sido 
entregados en el mes de enero de cualquier año.*/
select *
from pedido
where estado = 'Entregado' and MONTH(fecha_entrega) = 1;

/*Devuelve un listado con todos los pagos que se realizaron en el año 2008 
mediante Paypal. Ordene el resultado de mayor a menor.*/
select *
from pago
where YEAR(fecha_pago) = 2008 and forma_pago = 'PayPal'

/*Devuelve un listado con todos los clientes que sean de la ciudad de Madrid
y cuyo representante de ventas tenga el código de empleado 11 o 30.*/
select *
from cliente
where ciudad = 'Madrid' and codigo_empleado_rep_ventas in(11,30);

