
create table empleado( 
NUM_EMP int primary key, 
nombre varchar2(20), 
tarifa_hora int, 
profesion varchar2(20)
);     

create table edificio( 
NUM_EDI int primary key,
direccion varchar2(20),
tipo varchar2(10), 
nivel varchar2(20)
);     

create table asignacion (
num_edi int , 
num_emp int, fecha_ini varchar(15), num_dias int, 
foreign key  (num_edi) references edificio(num_edi), 
foreign key  (num_emp) references empleado(num_emp) 
); 

begin
insert into empleado values(1235, 'M.Perez',3000,'Electricista');
insert into empleado values(1412, 'C.Garcia',2500,'Fontanero');
insert into empleado values(2920, 'R.Gomez',2800,'Carpintero');
insert into empleado values(3231, 'P.Moran',2300,'Pintor');
insert into empleado values(1520, 'H.Fuentes',2500,'Fontanero');
insert into empleado values(1311, 'C.Carrera',3500,'Electricista');
insert into empleado values(3001, 'S.Mendez',2300,'Pintor');

insert into edificio values(1, 'Alamos 23','Oficina','A');
insert into edificio values(2, 'lOS Alpes 455','Tienda','B');
insert into edificio values(3, 'San Andres 56','Vivienda','A');

insert into asignacion values(1, 1235, '20/09/2014',10);
insert into asignacion values(2, 1311, '22/10/2014',15);
insert into asignacion values(1, 2920, '18/07/2014',17);
insert into asignacion values(2, 1412, '17/10/2014',25);
insert into asignacion values(3, 1520, '20/05/2014',14);
insert into asignacion values(2, 3231, '14/10/2014',12);
insert into asignacion values(3, 3001, '18/10/2014',7);
end;


Consultas en una tabla
----------------------------

1.- Mostrar el promedio de las tarifas hora de los empleados
SELECT AVG(TARIFA_HORA) "Promedio tarifa Hora" FROM EMPLEADO;

2.- mostrar cuantos empleados de profesion electricista hay en la base de datos
SELECT COUNT(NUM_EMP) "Cantidad de empleados" FROM EMPLEADO WHERE PROFESION='Electricista';

3.- Mostrar el nombre y sueldo liquido de cada empleado
SELECT NOMBRE, (TARIFA_HORA *40 * 4) * 0.81 "Sueldo Liquido" FROM EMPLEADO;

4.- Mostrar el nombre, descuento de salud y descuento de afp de cada empleado
SELECT NOMBRE, (TARIFA_HORA *40 * 4) * 0.07 "Descuento de Salud", (TARIFA_HORA *40 * 4) * 0.12 "Descuento AFP" FROM EMPLEADO;

5.- Mostrar las asignaciones del mes de octubre del 2014
como no hay clave primaria en la tabla asignacion, debo trabajar con count *, ademas debo transformar la fecha desde varchar hacia date
SELECT COUNT(*) "Cantidad de asignaciones" FROM asignacion WHERE fecha_ini BETWEEN TO_DATE('01/10/2014','DD/MM/YYYY') AND TO_DATE('31/10/2014' , 'DD/MM/YYYY');

6.- Mostrar la TARIFA_HORA maxima y minima de los empleados
SELECT MAX(TARIFA_HORA) "Tarida Maxima", min (TARIFA_HORA) "Tarifa Minima" from empleado;

7.- Mostrar el nombre de los empleados cuyas profesiones empiecen con la letra p
SELECT NOMBRE FROM EMPLEADO WHERE PROFESION LIKE 'P%';

Consultas multitablas
------------------------------------------------------------------------------------
Existen 3 tipos de consultas multitablas diferentes
Los 3 tipos de consultas son equivalentes


1.- Consultas multitablas relacionales o consultas multitablas simples

	Mostrar el nombre de los empleados que estan asignados a los edificios de tipo oficina
	
	SELECT EMPLEADO.NOMBRE FROM EMPLEADO, ASIGNACION , EDIFICIO WHERE empleado.num_emp= asignacion.num_emp AND asignacion.num_edi= edificio.num_edi AND edificio.tipo='Oficina';
	SELECT E.NOMBRE FROM EMPLEADO E, ASIGNACION A , EDIFICIO ED WHERE E.num_emp= A.num_emp AND A.num_edi= ED.num_edi AND ED.tipo='Oficina';
	
	9.-  Mostrar el nombre ed los empleados asignados en el mes de octubre del 2014
			
			SELECT EMPLEADO.NOMBRE FROM EMPLEADO, ASIGNACION WHERE EMPLEADO.NUM_EMP=ASIGNACION.NUM_EMP AND FECHA_INI BETWEEN TO_DATE('01/10/2014','DD/MM/YYYY') AND TO_DATE('31/10/2014','DD/MM/YYYY');


2.- Subconsultas
	10.- Mostrar el nombre de lose mpleados que esten asignados a los edificios de tipo oficina
	
			SELECT NOMBRE FROM EMPLEADO WHERE NUM_EMP IN(SELECT NUM_EMP FROM ASIGNACION WHERE NUM_EDI IN(SELECT NUM_EDI FROM EDIFICIO WHERE TIPO='Oficina'));
	11.- Mostrar el nombre de los empleados asignados en el mes de octubre del 2014
	
			SELECT NOMBRE FROM EMPLEADO WHERE NUM_EMP IN (SELECT NUM_EMP FROM ASIGNACION WHERE FECHA_INI BETWEEN TO_DATE('01/10/2014','DD/MM/YYYY'))
			
			
3.- Operador JOIN

Los 3 tipos de consultas son equivalentes






















