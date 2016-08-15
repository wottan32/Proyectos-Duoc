Disparadores
	Evento
		Insert
		Update
		DELETE
			Una tabla

		A nivel de  fila
		A nivel sentencia
			OLD
			NEW

TRIGGERS
----------------------------------
Formato para un Evento
	CREATE OR REPLACE TRIGGER nombre BEFORE|AFTER DELETE|INSERT|UPDATE [of columna1...columnan] <--(opcional)
		ON nombre_tabla
		for EACH row [statement][when condicion]

		DECLARE
			variables locales
		BEGIN
			sentencias ejecutables
		EXCEPTION
			manejo de errores
		END;

----------------------------------
Formato para mas de un evento
	CREATE OR REPLACE TRIGGER nombre BEFORE|AFTER DELETE or INSERT or UPDATE [of columna1...columnan] <--(opcional)
		ON nombre_tabla
		for EACH row [statement][when condicion]

		DECLARE
			variables locales
		BEGIN
			if inserting  THEN
				--------------
			if DELATING THEN
				--------------
			ELSIF updating[columna1] THEN
				--------------
			END IF;

		EXCEPTION
			manejo de errores
		END;

--------------------------------------------------------
		Evento		OLD				NEW
--------------------------------------------------------
		INSERT 		NULL 			valores
									nuevos
--------------------------------------------------------
		UPDATE 		valores			valores
					almacenados		nuevos
--------------------------------------------------------
		DELETE 		valores 		NULL
					almacenados 	
--------------------------------------------------------
eliminar un TRIGGER: 
	drop TRIGGER nombre;

activar/desactivar un TRIGGER:
	ALTER TRIGGER nombre ENABLE/DISABLE;
	ALTER TABLE nombre_tabla ENABLE/DISABLE ALL TRIGGERS;

---------------------------------------------------------------------------

--Ejemplo1

CREATE TABLE profesor(
	cod_prof int primary key, 
	nombre varchar2(50), 
	telefono varchar2(10)
	);

CREATE TABLE historico_profesores(
	cod_prof int primary key, 
	nombre varchar2(50), 
	telefono varchar2(10), 
	fecha date
	);

CREATE TABLE accesos(
	usuario varchar2(30),
	fecha date
	);

INSERT INTO profesor VALUES(101,'Julio Zuñiga','23456768');
INSERT INTO profesor VALUES(102,'Ana Morales','26789543');


--A nivel de fila

CREATE OR REPLACE TRIGGER tprof
	AFTER DELETE OR UPDATE ON profesor
	FOR EACH ROW --A nivel de fila

	BEGIN
		IF DELETING THEN
			INSERT INTO historico_profesores VALUES(:old.cod_prof,:old.nombre,:old.telefono,sysdate);
		ELSIF UPDATING THEN
			INSERT INTO accesos VALUES(user, sysdate);
		END IF;
	END;
SELECT * FROM historico_profesores;
DELETE from profesor WHERE cod_prof=101;

SELECT * from accesos;

UPDATE profesor
	SET telefono='226554499'
	WHERE cod_prof=102;


---------------------------------------------------------------------------
Ejemplo2

CREATE TABLE ventas(
	numero int, 
	monto int, 
	tipo varchar2(30)
	);

CREATE SEQUENCE sq_ventas
	minvalue 101
	maxValue 999999999
	START WITH 101
	INCREMENT BY 3;

CREATE OR REPLACE TRIGGER pk_ventas
	BEFORE INSERT ON ventas
	FOR each ROW
	DECLARE
	var int;
	BEGIN
		SELECT sq_ventas.nextval INTO var FROM  dual;
		:new.numero:=var;
END;

BEGIN 
INSERT INTO ventas(monto,tipo) VALUES(35000, 'contado');
INSERT INTO ventas(monto,tipo) VALUES(85000, 'credito');
END;

SELECT * FROM  ventas;


---------------------------------------------------------------------------
Ejemplo3 --a nivel de fila

CREATE TABLE DEPARTAMENTO(
	COD INT PRIMARY KEY, NOMBRE VARCHAR2(50)
	);

BEGIN
INSERT INTO DEPARTAMENTO VALUES (111,'INFORMATICA');
INSERT INTO DEPARTAMENTO VALUES (112,'FINANZAS');
INSERT INTO DEPARTAMENTO VALUES (113,'CONTABILIDAD');
INSERT INTO DEPARTAMENTO VALUES (114,'RECURSOS HUMANOS');
end;

CREATE TABLE EMPLEADOS (
	RUT VARCHAR2(15) PRIMARY KEY, 
	NOMBRE VARCHAR2(50),
	DEPARTAMENTO INT, 
	FOREIGN KEY(DEPARTAMENTO) REFERENCES DEPARTAMENTO(COD));  

BEGIN
	INSERT INTO EMPLEADOS VALUES('10897654-9','JOSE LOPEZ',112);
	INSERT INTO EMPLEADOS VALUES('11876454-7','LUIS FLORES',113);
	INSERT INTO EMPLEADOS VALUES('12654445-4','CARLA NUÑEZ',111);
	INSERT INTO EMPLEADOS VALUES('13765345-k','JUAN SOLIS',111);
	INSERT INTO EMPLEADOS VALUES('10443667-1','MARIA CESPEDES',114);
END

create historico_empleados(
	rut varchar2(15), 
	nombre varchar2(50), 
	fecha date);

CREATE OR REPLACE TRIGGER trborrar 
	AFTER DELETE ON DEPARTAMENTO
	FOR EACH row
	BEGIN
		DELETE FROM EMPLEADOS WHERE EMPLEADOS.DEPARTAMENTO=:old.cod;
END;
DELETE FROM DEPARTAMENTO WHERE cod=NULL;
SELECT* FROM EMPLEADOS;

---------------------------------------------------------------------------
Ejemplo4 --a nivel de fila


CREATE TABLE cliente (
rut VARCHAR(12) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
dir VARCHAR(100) NOT NULL,
tel VARCHAR(10) NOT NULL,
empresa VARCHAR(100) NOT NULL);


CREATE TABLE Prestamo (
num_prest NUMBER(5) NOT NULL PRIMARY KEY,
rut VARCHAR(12)UNIQUE REFERENCES cliente(rut),
tasa NUMBER(4,2) NOT NULL,
monto NUMBER(8)NOT NULL CHECK(monto > 0));



CREATE TABLE Cuota (
num_cuota NUMBER(2), 
num_prest NUMBER(5) NOT NULL ,
f_venc DATE NOT NULL,
f_pago DATE,
foreign key(num_prest) REFERENCES Prestamo(num_prest));

BEGIN
insert into cliente values('12345064-8','Ana Lopez', 'Las Rosas 1234','6544565','Aguas Andinas'); 
insert into cliente values('10254367-8','Juan Matus', 'Villa Aromos 456','6774433','Chilectra'); 
insert into cliente values('93875644-8','Miguel Jones', 'Paraguay 3345','3244455','Aguas Andinas'); 


insert into prestamo values(23345,'12345064-8',2.3,1000000);
insert into prestamo values(19876,'10254367-8',3.1,3000000); 
insert into prestamo values(14345,'93875644-8',2.8,2500000);

insert into cuota(num_cuota,num_prest,f_venc) values( 1,23345, '06/01/2015');
insert into cuota(num_cuota,num_prest,f_venc) values( 1,19876,'06/10/2015');
END;


CREATE OR REPLACE TRIGGER trcupta
	BEFORE UPDATE OF f_pago ON cuota
	FOR EACH ROW
	WHEN (new.f_pago>old.f_venc) --<---- no pongo : antes de new o old cuando esta antes de BEGIN

	BEGIN
		:new.f_pago:='';
		DBMS_OUTPUT.PUT_LINE('Cuota '||TO_CHAR(:old.num_cuota) ||' del prestamo ' ||TO_CHAR(:old.num_prest) ||' vencida, Favor dirigirse a gerencia');

END;
	UPDATE cuota
		SET f_pago='06/09/2015'
		WHERE num_prest=19876;
	UPDATE cuota
		SET f_pago='06/05/2015'
		WHERE num_prest=23345;

SELECT * FROM cuota;

---------------------------------------------------------------------------
ejemplo5 --aa nivel de sentencia
CREATE OR REPLACE FUNCTION cuantaprestamos
	RETURN int AS var int;

	BEGIN
		SELECT  COUNT (num_prest) INTO var FROM prestamo;
		RETURN var;
END;

CREATE OR REPLACE TRIGGER trprestamo
	AFTER INSERT ON prestamo

	DECLARE
		var int;

	BEGIN 
		var:=cuantaprestamos;
		DBMS_OUTPUT.PUT_LINE('La cantidad de prestamos registrados son: '||var);


END;
INSERT INTO cliente VALUES('14666111-2', 'Arturo Vidal', 'copa 2', '226557687', 'Aguas Andinas');
INSERT INTO prestamo VALUES(20776, '14666111-2', 2.5, 5000000);

---------------------------------------------------------------------------
ejemplo6 --a nivel de sentencia

CREATE OR REPLACE PROCEDURE mostrar_prestamos IS
	CURSOR mostrar IS SELECT cliente.rut, nombre, monto FROM cliente,prestamo
		WHERE cliente.rut=prestamo.rut;

	var mostrar%ROWTYPE;

	BEGIN
		DBMS_OUTPUT.PUT_LINE('Los prestamos registrados son: ');

		FOR var in mostrar
			LOOP
				DBMS_OUTPUT.PUT_LINE(var.rut ||' ' ||var.nombre ||' ' ||var.monto);
			END LOOP;

			DBMS_OUTPUT.PUT_LINE('-----------------------------------');
END;

CREATE OR REPLACE TRIGGER trprestamos
	AFTER INSERT ON prestamo

	BEGIN
	mostrar_prestamos;
END;

INSERT INTO cliente values ('13554332-8', 'Ana Moya', 'palermo 45', '226652321', 'Smapa');
INSERT INTO prestamo values (17665, '13554332-8', 1.5, 1500000);

