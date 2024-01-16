/*Devuelve un listado con el primer apellido, segundo apellido
y el nombre de todos los alumnos. El listado deberá estar ordenado
alfabéticamente de menor a mayor por el primer apellido, segundo
apellido y nombre.*/
select p.apellido1, p.apellido2, p.nombre
from persona p
WHERE p.tipo = 'alumno'
ORDER BY p.apellido1, p.apellido2, p.nombre;

/*Averigua el nombre y los dos apellidos de los alumnos 
que no han dado de alta su número de teléfono en la base
de datos.*/
select p.nombre, p.apellido1, p.apellido2
from persona p
WHERE p.tipo = 'alumno' and p.telefono IS NULL;

/*Devuelve el listado de los alumnos que nacieron en 1999.*/
select *
from persona p
WHERE  p.tipo = 'alumno' AND YEAR(p.fecha_nacimiento) = 1999;

/*Devuelve el listado de profesores que no han dado de alta
su número de teléfono en la base de datos y además su nif
termina en K.*/
select *
from persona p
WHERE p.tipo = 'profesor' AND
      p.telefono IS NULL AND 
	  p.nif LIKE '%k';

/*Devuelve el listado de las asignaturas que se imparten en
el primer cuatrimestre, en el tercer curso del grado que tiene
el identificador 7.*/
















