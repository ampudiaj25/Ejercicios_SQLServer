/*Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.*/
select *
from cliente c
WHERE NOT EXISTS (select codigo_cliente
                  from pago p
				  where c.codigo_cliente = p.codigo_cliente)

/*Muestra el nombre de los clientes que hayan realizado pagos junto
con el nombre de sus representantes de ventas.*/

select c.nombre_cliente, e.nombre
from cliente c
JOIN pago p on c.codigo_cliente = p.codigo_cliente
JOIN empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado

/*Muestra el nombre de los clientes que no hayan realizado pagos
junto con el nombre de sus representantes de ventas.*/
select c.nombre_cliente, e.nombre
from cliente c
JOIN empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
where NOT EXISTS (select codigo_cliente
                  from pago p
				  where c.codigo_cliente = p.codigo_cliente);

/*Devuelve el nombre de los clientes que han hecho pagos y el nombre
de sus representantes junto con la ciudad de la oficina a la que
pertenece el representante.*/
select c.nombre_cliente, e.nombre, o.ciudad
from cliente c
JOIN pago p on c.codigo_cliente = p.codigo_cliente
JOIN empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
JOIN oficina o on e.codigo_oficina = o.codigo_oficina;

/*Devuelve un listado que muestre el nombre de cada empleados,
el nombre de su jefe y el nombre del jefe de sus jefe.*/
select e.nombre as Nombre_Empleado, j.nombre as Nombre_Jefe_Empleado, 
	   f.nombre as Nombre_Jefe_de_su_Jefe
from empleado e
LEFT JOIN empleado j on e.codigo_jefe = j.codigo_empleado
LEFT JOIN empleado f on j.codigo_jefe = f.codigo_empleado