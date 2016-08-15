create table cliente (rut varchar2(15), 
nombre varchar2(50), 
direccion varchar2(50), 
comuna varchar2(15), 
telefono varchar2(12), 
edad varchar2(3)
);

create table cuenta (
numeroc varchar2(15), 
tipo varchar2(15), 
fecha_apertura varchar2(10), 
saldo varchar2(10), 
rut varchar2(15)
);

create table deposito (
numerod varchar2(10), 
cantidad varchar2(10), 
fecha varchar2(10), 
tipod varchar2(15), 
numeroc varchar2(15), 
codigoc varchar2(10)
);

create table cajero (
codigoc varchar2(10), 
nombrec varchar2(50), 
direccionc varchar2(50), 
telefonoc varchar2(12)
);

--Constraints
alter table cliente add constraint rut primary key(rut);
alter table cuenta add constraint rutFK foreign key(rut) references cliente(rut);
alter table cuenta add constraint numeroc primary key(numeroc);
alter table deposito add constraint numerod primary key(numerod);
alter table cajero add constraint codigoc primary key(codigoc);
alter table deposito add constraint numerocFK foreign key(numeroc) references cuenta(numeroc);
alter table deposito add constraint codigocFK foreign key(codigoc) references cajero(codigoc);

--Datos
begin
insert into cliente values ('10114567','Antonio Vera','Ecuador 456','La Florida','6543234','44');
insert into cliente values ('9867543','Jorge Pérez','Salamanca 486','La Florida','7654345','47');
insert into cliente values ('8456567','Ana Muñoz','San Francisco 77','Macul','8325678','48');
insert into cliente values ('12345654','Ricardo Perez','San Juan 44','La Florida','6753456','40');

insert into cuenta values ('10111111','Corriente','10/10/2010',700000,'10114567');
insert into cuenta values ('10123333','Ahorro','01/05/2012',545000,'8456567');
insert into cuenta values ('10134444','Corriente','09/06/2011',890000,'9867543');
insert into cuenta values ('10145555','Ahorro','10/04/2012',450000,'10114567');
insert into cuenta values ('10157777','Ahorro','06/04/2009',370000,'12345654');
insert into cuenta values ('11525888','vista','07/09/2008',56000,'9867543');

insert into cajero values ('10','Alejandro Cofre','Porto seguro 88','56789756');
insert into cajero values ('20','Mauricio Yañez','Los Presidente 345','67895466');
insert into cajero values ('30','Alejandra Vera','Los Sauces 55','123546546');
insert into cajero values ('40','Claudia Perez','Alpes 345','54687895');

insert into deposito values ('10',54000, '01/03/2014','Efectivo','10111111','30');
insert into deposito values ('11',100000,'10/02/2014','Cheque','10123333','10');
insert into deposito values ('12',75000,'05/03/2014', 'Efectivo','10157777','30');
insert into deposito values ('13',95000,'25/1/2014','Efectivo','10123333','20');
insert into deposito values ('14',20000,'26/03/2014','Cheque','10145555','40');
end;


1. Crear una consulta que muestre el nombre de los clientes que tienen cuentas de ahorro pero no cuentas corrientes. El resultado debe salir en Mayúsculas.

SELECT UPPER(tipo), UPPER(Nombre) from cliente
JOIN cuenta USING(rut)
where tipo='Ahorro' AND NOT tipo='Corriente';

2. Crear una consulta que muestre el nombre(s) y dirección(es) del o los cliente(s) cuya fecha de apertura de cuenta el mes de Marzo del año 2008. El resultado debe salir en Mayúsculas y debe usar operador JOIN.
SELECT UPPER(nombre), UPPER(direccion) FROM cliente 
JOIN cuenta USING(rut)
where fecha_apertura between TO_DATE('01-03-2008', 'DD-MM-YYYY') AND TO_DATE ('31-03-2008', 'DD-MM-YYYY')



3. Crear una consulta que muestre cuantos meses de apertura de cuenta tienen Antonio Vera y Jorge Pérez a la fecha de hoy. El resultado debe ser entero y debe crear un alias llamado MESES.
SELECT nombre, ROUND(MONTHS_BETWEEN(fecha_apertura, SYSDATE)*-1)"MESES" FROM cuenta
JOIN cliente USING(rut)
where nombre='Antonio Vera' OR nombre='Jorge Pérez'

4. Crear una consulta que muestre la cantidad de clientes agrupados por tipo de cuenta.
SELECT nombre, count(numeroc) FROM cliente 
JOIN cuenta USING(rut)
group by nombre

5. Crear una consulta que muestre la cantidad de clientes cuyo saldo es menor que el promedio de todos los saldos de los clientes registrados en la base de datos.
SELECT COUNT(rut) FROM cliente 
JOIN cuenta using(rut)
where saldo<(select avg(saldo) from cuenta)


6. Crear una consulta que muestre el nombre del cliente y nombre del cajero cuya fecha de depósito está entre el 01/01/2014 al 01/03/2014. El resultado debe salir en minúsculas. Debe usar subconsulta.


7. Crear una consulta que muestre el sueldo total de cada cajero de un determinado mes, sabiendo que trabajó 24 días, 6 horas diarias y su valor hora es de 5500 y tiene descuentos de 7% de Salud y 12% de AFP. El resultado debe ser entero. Debe crear un alias llamado SUELDO LÍQUIDO.


8. Crear una consulta que muestre el promedio de los saldos de las cuentas agrupadas por tipo de cuenta donde el promedio sea mayor a 500000 (debe mostrar el promedio con un alias)


INSTITUTO PROFESIONAL DuocUC
ESCUELA DE INFORMÁTICA Y TELECOMUNICACIONES
Profesor: Juan Cubillos G. Página 2 de 2
9. Crear una vista que muestre los nombres de los clientes cuya fecha de apertura de cuenta fue anterior al 01/02/2010. Debe usar subconsulta. El resultado debe salir en Minúsculas.


10. Crear una vista que muestre el promedio, la suma, el máximo y mínimo de los saldos de los clientes agrupados por tipo de cuenta. (Todos los campos de salida deben llevar alias)


11. Crear una vista que muestre la suma de los saldos de las cuentas más los depósitos de cada cliente. (Debe mostrar la salida con alias)


12. Crear una vista que muestre el nombre de los cajeros que han atendido menos de 2 clientes. El resultado debe salir en Mayúsculas.


13. Crear una vista que muestre el máximo y mínimo de los depósitos agrupados por tipo de cuenta. (Debe mostrar la salida con alias)


14. Crear una vista que muestre la suma de los depósitos en cuentas corrientes realizados el mes Marzo del 2014. (Debe mostrar la salida con alias)


15. Crear una vista que muestre cuantos clientes hay registrados con nombre que comience con la letra A. (debe mostrar la salida con alias)


16. Crear una vista que muestre los nombres de los clientes que tienes cuentas corrientes y cuentas de ahorro registradas en la base de datos (Debe usar operador intersección). El resultado debe salir en Mayúsculas.


EJERCICIO 2
Crear una consulta para cada una de las funciones