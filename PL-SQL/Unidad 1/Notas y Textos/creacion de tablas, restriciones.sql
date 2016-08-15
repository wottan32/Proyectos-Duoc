Creación de tabla con restricciones
--------------------------------------
Create table productos(
codigo integer, constraint pk_cod primary key(codigo),
nombre varchar2(40) constraint nom_nn not null,
descripcion varchar2(60) constraint des_nn not null,
cantidad integer, constraint can_chk check(cantidad >0),
precio integer, constraint pre_chk check(precio>0)
);   

Insertar datos
-----------------------
insert into productos values (10, 'leche','producto lacteo', 50, 500);

Mostrar toda la información
------------------------------
select * from productos; 

Ver la estructura de una tabla
-------------------------------
describe productos;

Agregar una columna a una tabla
--------------------------------
alter table productos add proveedor varchar2(40);

Actualizar información en la columna proveedor 
-------------------------------------------------
update productos 
set proveedor ='Soprole'
where codigo=10;

Eliminar una columna de una tabla
---------------------------------------
alter table productos drop column descripcion;

Agregar una restricción a la columna proveedor
-----------------------------------------------
alter table productos modify proveedor constraint pro_nn not null;

ver las contraints de un usuario
------------------------------------
select * from user_constraints;

Modificar el tipo de dato de una columna de una tabla
-------------------------------------------------------
alter table productos modify nombre varchar2(60); 

Actualizar la columna precio para que este vacía
--------------------------------------------------
update productos
set precio=null
where codigo=10;

Modificar el tipo de dato de la columna precio
-----------------------------------------------
alter table productos modify precio number(20,0);

Borrar una fila de una tabla
-------------------------------
delete from productos where codigo=10;

----------------------------------------------------------
create table cliente(rut varchar2(15), 
nombre varchar2(50), email varchar2(20), genero varchar2(1),
fecha_nacimiento date, estado varchar2(1));

alter table cliente add constraint rut_pk primary key(rut);
alter table cliente modify nombre constraint nome_nn not null;
alter table cliente add constraint email_uq unique(email) ;
alter table cliente modify fecha_nacimiento constraint fec_nn not null;
alter table cliente add constraint chk_genero check(genero in('M','F'));
alter table cliente add constraint est_chk check(estado in('A','R')); 

Eliminar una constraint 
----------------------------
alter table cliente drop constraint nome_nn;

Deshabilitar una constraint 
------------------------------
alter table cliente disable constraint fec_nn;

Habiltar una constraint 
------------------------------
alter table cliente enable  constraint fec_nn;

insertar datos 
----------------------------------
insert into cliente values('14335567-0','Fabiola Venegas',
'fab.vene@gmail.com','F',to_date('10/10/1980','dd/mm/yyyy'),'A');  

 

 
CREATE TABLE CUENTA(
NUMERO VARCHAR2(20),
SALDO NUMBRT(20,0),
TIPO VARCHAR2(30),
RUT VARCHAR2(15);
)

ALTER TABLE CUENTA ADD CONSTRAINT RUT_FK FOREIGN KEY(RUT) REFERENCES CLIENTE(RUT);
ALTER TABLE CUENTA MODIFY SALDO CONSTRAINT SAL_NN NOT NULL;
ALTER TABLE CUENTA MODIFY TIPO CONSTRAINT TIPO_NN NOT NULL;

ALTER TABLE CUENTA ADD CONSTRAINT NUM_PK PRIMARY KEY(NUMERO);







 




  








