
empleado
cod|nomre|profesion|edad

mostrar la cantidad de empleados por profesion 
select profesion, count (cod) "cantidad empleados"
select profesion, count (*) "cantidad empleados" from empleado
					where
opcionales			|group by profesion
					|having
					
-cuando se usa group by, puede utilizar having
-no puede haber un having sin un group by
-todas las condiciones que comprometan a los campos de las agrupaciones can en el having

mostrar la cantidad de empleados por profesion cuya edad sea mayor a 30 años
select profesion, count (cod) "cantidad empleados" from empleado group by profesion having profesion in('pintar','carpintero','electricista');

create view  vista1(Nombre) as 
select nombre_autor 
from autor 
where cod_autor in (
select id_autor
from libro
where nom_editorial = 'antares');

select * from vista1