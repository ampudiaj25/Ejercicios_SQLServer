/*Devuelve un listado con los datos de todas las alumnas que se
han matriculado alguna vez en el Grado en Ingeniería Informática
(Plan 2015).
*/
select p.*, g.nombre
from persona p
JOIN alumno_se_matricula_asignatura a on p.id = a.id_alumno
JOIN asignatura ag on a.id_asignatura = ag.id
JOIN grado g on ag.id_grado = g.id
WHERE p.sexo = 'M' AND g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'

/*Devuelve un listado con todas las asignaturas ofertadas en
el Grado en Ingeniería Informática (Plan 2015).*/
select *
from asignatura a
JOIN grado g on a.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'

/*Devuelve un listado con el nombre de las asignaturas, año de
inicio y año de fin del curso escolar del alumno con 
nif 26902806M.*/
select ag.nombre, c.anyo_inicio, c.anyo_fin
from persona p
JOIN alumno_se_matricula_asignatura a on p.id = a.id_alumno
JOIN asignatura ag on a.id_asignatura = ag.id
JOIN curso_escolar c on a.id_curso_escolar = c.id
WHERE p.nif = '26902806M'

/*Devuelve un listado con todos los alumnos que se han 
matriculado en alguna asignatura durante el curso escolar
2018/2019.*/
select p.*
from persona p
JOIN alumno_se_matricula_asignatura a on p.id = a.id_alumno
JOIN asignatura ag on a.id_asignatura = ag.id
JOIN curso_escolar c on a.id_curso_escolar = c.id
WHERE p.tipo = 'alumno' AND YEAR(c.anyo_inicio) in (2018,2019)






































select * from asignatura



















select * from grado