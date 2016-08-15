create table cliente(
rut varchar2(15),
nombre varchar2(20), 
direccion varchar2(30), 
comuna varchar2(15), 
telefono varchar2(15), 
edad varchar2(5));

alter table cliente add constraint rut_pk primary key(rut);
alter table cliente modify nombre constraint nombreCliente_nn not null;
alter table cliente add constraint direccion_uniq unique(direccion);
alter table cliente modify comuna constraint comuna_nn not null;
alter table cliente add constraint telefono_uniq unique(telefono);
alter table cliente modify edad constraint edad_nn not null;

create table cuenta(
numeroC varchar2(15), 
tipo varchar2(15), 
fecha_apertura date, 
saldo integer, 
rut varchar2(15));

alter table cuenta add constraint numeroc_pk primary key(numeroC);
alter table cuenta modify tipo constraint tipo_nn not null;
alter table cuenta modify fecha_apertura constraint fecha_apertura_nn not null;
alter table cuenta add constraint chk_saldo check(saldo >=0);
alter table cuenta add constraint rut_fk foreign key(rut) references cliente(rut);



create table cajero(
codigoC varchar2(5),
nombre varchar2(25),
direccion varchar2(30),
telefono varchar2(15));

alter table cajero add constraint codigoC_pk primary key(codigoC);
alter table cajero modify nombre constraint nombreCajero_nn not null;
alter table cajero add constraint direccionCajero_uniq unique(direccion);
alter table cajero add constraint telefonoCajero_uniq unique(telefono);

create table deposito(
numeroD integer, 
cantidad integer, 
tipo varchar2(15), 
fecha_deposito varchar2(12), 
numeroC varchar2(15), 
codigoC varchar2(5));

alter table deposito add constraint numeroD_pk primary key(numeroD);
alter table deposito add constraint cantidad_chk check(cantidad>0);
alter table deposito modify tipo constraint tipoDeposito_nn not null;
alter table deposito modify fecha_deposito constraint fecha_deposito_nn not null;
alter table deposito add constraint numeroC_fk foreign key(numeroC) references cuenta(numeroC);
alter table deposito add constraint codigoC_fk foreign key(codigoC) references cajero(codigoC);
-----------------------------------------------------------------------------------------------------------------------------------------------
begin
insert into cliente(rut,nombre,direccion,comuna,telefono,edad) values('10114567','Antonio Vera','Ecuador 456','La florida','6543234','44');
insert into cliente(rut,nombre,direccion,comuna,telefono,edad) values('9867543','Jorge Perez','Salamanca 486','La florida','7654345','47');
insert into cliente(rut,nombre,direccion,comuna,telefono,edad) values('8456567','Ana Muñoz','San Francisco 77','Macul','8325678','48');
insert into cliente(rut,nombre,direccion,comuna,telefono,edad) values('12345654','Ricardo Jerez','San Juan 44','La florida','6753456','40');

insert into cuenta(numeroC,tipo,fecha_apertura,saldo,rut) values('10111111','corriente','10/10/2010',700000,'10114567');
insert into cuenta(numeroC,tipo,fecha_apertura,saldo,rut) values('10123333','ahorro','01/05/2012',545000,'8456567');
insert into cuenta(numeroC,tipo,fecha_apertura,saldo,rut) values('10134444','corriente','09/06/2011',890000,'9867543');
insert into cuenta(numeroC,tipo,fecha_apertura,saldo,rut) values('10145555','ahorro','10/04/2012',450000,'10114567');
insert into cuenta(numeroC,tipo,fecha_apertura,saldo,rut) values('10157777','ahorro','06/04/2009',370000,'12345654');
insert into cuenta(numeroC,tipo,fecha_apertura,saldo,rut) values('11525888','vista','07/09/2008',56000,'9867543');

insert into cajero(codigoC,nombre,direccion,telefono)  values('10','Alejandro Cofre','Porto Seguro 88','5674343');
insert into cajero(codigoC,nombre,direccion,telefono)  values('20','Mauricio Yañez','Los presidentes 345','6754323');
insert into cajero(codigoC,nombre,direccion,telefono)  values('30','Alejandra Vera','Los sauces 55','7654343');
insert into cajero(codigoC,nombre,direccion,telefono)  values('40','Claudia Perez','Alpes 345','8643245');

insert into deposito(numeroD,cantidad,tipo,fecha_deposito,numeroC,codigoC) values(10,54000,'efectivo','02/10/2015','10111111','30');
insert into deposito(numeroD,cantidad,tipo,fecha_deposito,numeroC,codigoC) values(11,100000,'cheque','03/05/2015','10123333','10');
insert into deposito(numeroD,cantidad,tipo,fecha_deposito,numeroC,codigoC) values(12,75000,'efectivo','03/10/2015','10157777','30');
insert into deposito(numeroD,cantidad,tipo,fecha_deposito,numeroC,codigoC) values(13,95000,'efectivo','01/20/2015','10123333','20');
insert into deposito(numeroD,cantidad,tipo,fecha_deposito,numeroC,codigoC) values(14,20000,'cheque','02/15/2015','10145555','40');
end;

1. Mostrar el nombre, dirección y comuna de los clientes que poseen cuentas corrientes en el banco.
SELECT distinct(cliente.nombre) "Nombre", cliente.direccion "Direccion", cliente.comuna "Comuna" 
from cuenta natural join cliente;

2. Mostrar el promedio de los depósitos hechos por Ana Muñoz.
select avg(deposito.cantidad) from deposito
join cuenta using(numeroC) join cliente using (rut)
where cliente.nombre='Ana Muñoz' 

3. Mostrar el nombre del cajero que atendió el depósito de Antonio Vera.
select cajero.nombre from cajero
join deposito using(codigoC)
join cuenta using(numeroC)
join cliente using(rut)
where cliente.nombre='Antonio Vera'

4. Mostrar la cantidad de clientes por cada tipo de cuenta.

---

5. Mostrar el nombre de los clientes que hicieron depósitos en Marzo del 2015.
select cliente.nombre from cliente
join cuenta using(rut)
join deposito using(numeroC)
where deposito.fecha_deposito between to_date('01-03-2015', 'dd-mm-yyyy') and to_date('31-03-2015', 'dd-mm-yyyy') 


6. Mostrar los números de depósitos de las cuentas de ahorro y vista.
--------------select numeroD from deposito
join cuenta using (numeroC)
where cuenta.tipo='ahorro' and cuenta.tipo='vista'


7. Mostrar la suma de los saldos de cada tipo de cuenta.
select cuenta.tipo, sum(cuenta.saldo) from cuenta
group by cuenta.tipo;

8. Mostrar todos los datos de los clientes que tienen saldos en sus cuentas menores de 55000.
select rut, nombre, direccion, comuna, telefono, edad 
from cliente natural join cuenta
where cuenta.saldo <55000;

9. Mostrar los nombre de los cajeros que atendieron depósitos en Febrero del 2015.
select cajero.nombre from cajero
join deposito using(codigoC)
where deposito.fecha_deposito between to_date('01-02-2015', 'dd-mm-yyyy') and to_date('28-02-2015', 'dd-mm-yyyy') 


10. Mostrar el promedio de los depósitos por tipo de depósito.
select tipo, avg(cantidad) from  deposito
group by tipo;

Realice las siguientes Vistas (utilice Group By si fuese necesario)

1. Mostrar el nombre, dirección y comuna de los clientes que poseen cuentas de ahorro en el banco.
create or replace view v1 as
select distinct(nombre), direccion, comuna from cliente
join cuenta using(rut)
where rut in (select cuenta.rut from cuenta)

2. Mostrar el promedio de los saldos por tipo de cuenta; cuyo promedio supere los 800000.
----select avg(saldo) from cuenta  where avg(saldo>800000)
group by tipo;

3. Mostrar el máximo y mínimo depósito realizados en marzo del 2015.
create or replace view v3 as
select max(deposito.cantidad), min(deposito.cantidad) from deposito
where deposito.fecha_deposito between to_date('01-03-2015', 'dd-mm-yyyy') and to_date('31-03-2015', 'dd-mm-yyyy') 

4. Mostrar el número y cantidad del o los depósitos de las cuentas de ahorro.
create or replace view v4 as
select numeroC, cantidad from deposito
group using(cuenta)
where cuenta.tipo='ahorro';

5. Mostrar el promedio de los saldos de Jorge Pérez y Ana Muñoz.
create view v5 as
select avg(saldo), rut from cuenta 
join cliente using(rut)
where nombre='Jorge Perez' or nombre='Ana Muñoz'
group by rut

6. Mostrar los nombre de los clientes que depositaron en febrero del 2015.
create or replace view v6 as
select distinct(nombre) from cliente
join cuenta using(rut)
join deposito using(numeroC)	
where deposito.fecha_deposito  between to_date('01-02-2015', 'dd-mm-yyyy') and to_date('28-02-2015', 'dd-mm-yyyy') 

7. Mostrar la cantidad de clientes por comuna donde la edad del cliente sea mayor de 42 años.
create or replace view v7 as
select count(rut) from cliente
where edad>42
join by comuna


8. Mostrar el nombre del cliente, el tipo de cuenta y la cantidad de meses de apertura de cada cuenta del banco.
select nombre, tipo,  MONTHS_BEETWEN(cuenta.fecha_apertura, SYSDATE) from cliente
join cuenta using(rut)



9. Mostrar los nombre de los cajeros que atendieron depósitos en Febrero del 2015.


10. Mostrar la cantidad de depósitos por cada tipo de depósito; realizados en marzo del 2015