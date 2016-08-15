--EJERCICIO 1
---------------------------------------------------------------------------------------------------

CREATE TABLE ventas (
	numero INT CONSTRAINT numero_pk PRIMARY KEY,
	fecha DATE CONSTRAINT fecha_chk CHECK (fecha>TO_DATE('01/01/0001','dd-mm-yyyy')),
	monto NUMBER CONSTRAINT monto_chk CHECK (monto>0)
	);

BEGIN
	INSERT INTO ventas VALUES(01,TO_DATE('01/10/2013','dd-mm-yyyy'),7000);
	INSERT INTO ventas VALUES(02,TO_DATE('10/07/2012','dd-mm-yyyy'),9000);
	INSERT INTO ventas VALUES(03,TO_DATE('04/08/2013','dd-mm-yyyy'),15000);
	INSERT INTO ventas VALUES(04,TO_DATE('22/04/2013','dd-mm-yyyy'),9800);
	INSERT INTO ventas VALUES(05,TO_DATE('30/12/2013','dd-mm-yyyy'),22000);
END;

set serveroutput on;

/*1. Crear un procedimiento almacenado que muestre la cantidad de ventas realizadas y la suma de 
los montos de una determinada fecha. La fecha será el parámetro del procedimiento. Crear el bloque de llamada.*/


CREATE OR REPLACE PROCEDURE ej11(ifecha DATE) IS
	CURSOR c1 IS SELECT COUNT(*) AS nVentas, SUM(monto) AS sumMontos FROM ventas WHERE fecha=ifecha;
	VAR c1%ROWTYPE;
  noDatos EXCEPTION;



	BEGIN
		DBMS_OUTPUT.PUT_LINE('------------------------');
		FOR var in c1
		LOOP
			if var.nVentas=0 THEN
				RAISE noDatos;
			END IF;
			DBMS_OUTPUT.PUT_LINE('Durante el '||TO_CHAR(ifecha, 'DD "de" month "del" YYYY'));
			DBMS_OUTPUT.PUT_LINE('La cantidad de ventas fue: '||var.nVentas);
			DBMS_OUTPUT.PUT_LINE('La Suma de los montos fue: '||var.sumMontos);
		END LOOP;
		DBMS_OUTPUT.PUT_LINE('------------------------');
  
	EXCEPTION
		WHEN noDatos THEN
		DBMS_OUTPUT.PUT_LINE('No se encontró la fecha ');
    DBMS_OUTPUT.PUT_LINE('------------------------');
END;

BEGIN
ej11(TO_DATE('01/10/2013', 'DD-MM-YYYY'));
END;



/*2. Crear un procedimiento almacenado que muestre el monto de la venta mayor y menor de la tabla. 
Crear el bloque de llamada.*/

CREATE OR REPLACE PROCEDURE ej12 IS
	TYPE datos IS RECORD(
		mayor ventas.monto%TYPE,
		menor ventas.monto%TYPE
	);

	RecDatos datos;
	BEGIN
		SELECT MAX(monto), MIN(monto) INTO RecDatos	FROM ventas;
		DBMS_OUTPUT.PUT_LINE('Ventas');
		DBMS_OUTPUT.PUT_LINE('Máxima: '||RecDatos.mayor);
		DBMS_OUTPUT.PUT_LINE('Minima: '||RecDatos.menor);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No existen ventas');
  
	END;

BEGIN
j12;
END;


/*3. Crear un procedimiento almacenado que muestre el promedio de montos dentro de un rango (utilizar
 operador between). Crear el bloque de llamada.*/

CREATE OR REPLACE PROCEDURE ej13 (monto1 INT, monto2 INT) IS

	v_avgMonto int;

	BEGIN

		SELECT AVG(monto) AS avgMontos INTO v_avgMonto FROM ventas WHERE monto BETWEEN monto1 AND monto2;
		DBMS_OUTPUT.PUT_LINE('El promedio de los montos cuyo rango va desde $'||monto1 ||' hasta $' ||monto2 ||' es:');
		DBMS_OUTPUT.PUT_LINE('$'||v_avgMonto);
  
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No existen ventas');
END;

BEGIN
ej13(9000, 15000);
END;

--EJERCICIO 2
---------------------------------------------------------------------------------------------------

CREATE TABLE producto(
	codprod VARCHAR2(10) CONSTRAINT codprod_pk PRIMARY KEY,
	nomprod VARCHAR2(50) CONSTRAINT nomprod_nn NOT NULL,
	marca VARCHAR2(50) CONSTRAINT marca_nn NOT NULL,
	precio NUMBER CONSTRAINT precio_chk CHECK (precio>0)
	);

BEGIN
	INSERT INTO producto VALUES ('101','mantequilla','soprole',900);
	INSERT INTO producto VALUES ('201','aceite','miraflores',1250);
	INSERT INTO producto VALUES ('301','leche','soprole',470);
	INSERT INTO producto VALUES ('401','arroz','Miraflores',450);
END;


/*1. Crear un procedimiento almacenado para borrar el producto arroz de la tabla 
Producto por el código. El código será el parámetro del procedimiento. Crear el 
bloque de llamada.*/

CREATE OR REPLACE PROCEDURE ej21 (cod VARCHAR2) IS

	BEGIN
		DELETE FROM producto WHERE codprod=cod;
		IF SQL%NOTFOUND THEN
			DBMS_OUTPUT.PUT_LINE('No existe el producto con dicho código');
      
      ELSE
            DBMS_OUTPUT.PUT_LINE('El producto ' ||cod ||' ha sido borrado');
		END IF;
END;

BEGIN
	ej21('101');
END;


/*2. Crear un procedimiento almacenado que muestre el nombre y precio de un producto. 
El código del producto será en parámetro del procedimiento. Crear el bloque de llamada.*/


CREATE OR REPLACE PROCEDURE ej22 (cod VARCHAR2) IS

		TYPE datos IS RECORD(
			nombre producto.nomprod%TYPE,
			precio producto.precio%TYPE
			);

		recDatos datos;

	BEGIN

		SELECT nomprod, precio INTO recDatos FROM producto WHERE codprod=cod;
		DBMS_OUTPUT.PUT_LINE('El nombre del producto es: '||recDatos.nombre);
		DBMS_OUTPUT.PUT_LINE('El precio del producto es: $' ||recDatos.precio);

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('No existe el producto');
END;

BEGIN
	ej22('101');
END;





/*3. Crear un procedimiento almacenado PL/SQL que por medio del código de producto actualice 
su precio según las siguientes indicaciones. Si el producto tiene un precio menor a 500 pesos, 
su precio debe ser aumentado en 50 pesos. Si está entre 500 y 1000 pesos su precio subirá 20 
pesos y si excede los 1000 pesos., el precio del producto debe subir 25 pesos. Si el precio fuese NULL, 
el aumento sería 0. El código del producto será en parámetro del procedimiento. Crear el bloque de llamada.*/

CREATE OR REPLACE PROCEDURE ej23 (cod VARCHAR2) IS

	v_precio producto.precio%TYPE;
	v_aumento NUMERIC := 0;

	BEGIN
		SELECT precio INTO v_precio FROM producto WHERE codprod=cod;

		IF v_precio<500 THEN
			v_aumento:=v_precio+50;

			ELSIF v_precio>=500 AND v_precio<=1000 THEN
				v_aumento:=v_precio+20;

			ELSIF v_precio>1000 THEN
				v_aumento:=v_precio+25;

			ELSIF v_precio IS NULL THEN
				v_aumento:=NULL;
		END IF;

		UPDATE producto
			SET precio=v_aumento 
			WHERE codprod=cod;
		DBMS_OUTPUT.PUT_LINE('Precio de ' ||cod ||' actualizado');

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('No se ha encontró producto');
END;

BEGIN
	ej23('500');
END;





--EJERCICIO 3
---------------------------------------------------------------------------------------------------
CREATE TABLE cliente(
	rut VARCHAR(30) PRIMARY KEY, 
	nombre VARCHAR(30) CONSTRAINT nombre_nn NOT NULL, 
	direccion VARCHAR(30) CONSTRAINT direccion_nn NOT NULL, 
	comuna VARCHAR(30) CONSTRAINT comuna_nn NOT NULL, 
	telefono VARCHAR(30) CONSTRAINT telefono_nn NOT NULL
	);

BEGIN
	INSERT INTO cliente VALUES('10114567','Antonio Vera','Ecuador 456','La Florida', '6543234');
	INSERT INTO cliente VALUES('9867543','Jorge Pérez','Salamanca 486','La Florida', '7654345');
	INSERT INTO cliente VALUES('8456567','Ana Muñoz','San Francisco 77','Macul', '8325678');
	INSERT INTO cliente VALUES('12345654','Ricardo Jerez','San Juan 44','La Florida', '6753456');
END;

CREATE TABLE cuenta(
	numeroc VARCHAR2(15) PRIMARY KEY,
	tipo VARCHAR(15) CONSTRAINT tipo_nn NOT NULL, 
	saldo INT CONSTRAINT saldo_nn NOT NULL, 
	rut VARCHAR(15), 
	CONSTRAINT rut_fk FOREIGN KEY(rut) REFERENCES cliente(rut)
	);

BEGIN
	INSERT INTO cuenta VALUES('10111111','corriente',700000,'10114567');
	INSERT INTO cuenta VALUES('10123333','ahorro',545000,'8456567');
	INSERT INTO cuenta VALUES('10134444','corriente',890000,'9867543');
	INSERT INTO cuenta VALUES('10145555','ahorro',450000,'10114567');
	INSERT INTO cuenta VALUES('10157777','ahorro',370000,'12345654');
END;

CREATE TABLE cajero(
	codigoc INT PRIMARY KEY,
	nombre VARCHAR(20) CONSTRAINT nombreCajero_nn NOT NULL,
	direccion VARCHAR(30) CONSTRAINT direccionCajero_nn NOT NULL,
	telefono INT CONSTRAINT telefonoCajero_nn NOT NULL
	);

BEGIN
	INSERT INTO cajero VALUES(10,'Alejandro Cofre','Porto Seguro 88',5674343);
	INSERT INTO cajero VALUES(20,'Mauricio Yáñez','Los presidentes 345',6754323);
	INSERT INTO cajero VALUES(30,'Alejandra Vera','Los Sauces 55',7654343);
	INSERT INTO cajero VALUES(40,'Claudia Pérez','Alpes 345',8643245);
END;

CREATE TABLE deposito(
	numerod INT PRIMARY KEY,
	cantidad INT CONSTRAINT cantidad_nn NOT NULL,
	numeroc VARCHAR2(15), 
	CONSTRAINT numeroc_fk FOREIGN KEY(numeroc) REFERENCES cuenta(numeroc),
	codigoc INT, 
	CONSTRAINT codigoc_fk FOREIGN KEY(codigoc) REFERENCES cajero(codigoc)
	);

BEGIN
	INSERT INTO deposito VALUES(10,54000,'10111111',30);
	INSERT INTO deposito VALUES(11,100000,'10123333',10);
	INSERT INTO deposito VALUES(12,75000,'10157777',30);
	INSERT INTO deposito VALUES(13,95000,'10123333',20);
	INSERT INTO deposito VALUES(14,20000,'10145555',40);
END;


/*1. Crear un procedimiento almacenado que muestre la cantidad y promedio de los 
depósitos realizados por un determinado cliente. El nombre del cliente será el parámetro 
del procedimiento. Crear el bloque de llamada.*/

CREATE OR REPLACE PROCEDURE ej31 (inombre VARCHAR2) IS
	
	TYPE datos IS RECORD(
		cantDep NUMERIC,
		avgDep NUMERIC
		);
	
	recDatos datos;
	noDatos EXCEPTION;

	BEGIN
		SELECT COUNT(numerod), AVG(cantidad) INTO recDatos FROM deposito 
		JOIN cuenta USING(numeroc)
		JOIN cliente USING(rut)
		WHERE cliente.nombre=inombre;

		IF recDatos.cantDep<=0 THEN
			RAISE noDatos;
		END IF;

		DBMS_OUTPUT.PUT_LINE('La cantidad de depositos es: '||recDatos.cantDep);
		DBMS_OUTPUT.PUT_LINE('El promedio de sus depositos es: $' ||recDatos.avgDep);

	EXCEPTION
		WHEN noDatos THEN
		DBMS_OUTPUT.PUT_LINE('El cliente no existe o no tiene depositos');
END;

BEGIN
	ej31('Antonio Vera');
END;


/*2. Crear un procedimiento almacenado que muestre el nombre del cajero que atendió a un 
determinado cliente. El rut del cliente será el parámetro del procedimiento Cree el 
bloque de llamada.*/

CREATE OR REPLACE PROCEDURE ej32 (irut VARCHAR2) IS
	
	CURSOR c1 IS SELECT cajero.nombre AS nomC FROM cajero
		JOIN deposito USING(codigoc)
		JOIN cuenta USING(numeroc)
		JOIN cliente USING(rut)
		WHERE rut=irut;

	var1 c1%ROWTYPE;
	noDatos EXCEPTION;


	BEGIN
	DBMS_OUTPUT.PUT_LINE('Los cajeros que atendieron a ' ||irut ||' son: ');

	FOR var1 IN c1
  	LOOP
		DBMS_OUTPUT.PUT_LINE(var1.nomC);
	END LOOP;


END;

BEGIN
  ej32('12345654');
END;



/*3. Crear un procedimiento almacenado que muestre el número, tipo y saldo de la cuenta 
de un determinado cliente. El nombre del cliente será el parámetro del procedimiento. 
Cree el bloque de llamada.*/

CREATE OR REPLACE PROCEDURE ej33 (inombre VARCHAR2) IS
	CURSOR c1 IS SELECT numeroc, tipo, saldo FROM cuenta 
	JOIN cliente USING(rut)
	WHERE nombre=inombre;

	var c1%ROWTYPE;

	BEGIN
		FOR var IN c1
		LOOP
			DBMS_OUTPUT.PUT_LINE('----------------------------');
			DBMS_OUTPUT.PUT_LINE('N° cuenta: '||var.numeroc);
			DBMS_OUTPUT.PUT_LINE('Tipo cuenta: '||var.tipo);
			DBMS_OUTPUT.PUT_LINE('Saldo cuenta: $'||var.saldo);
			DBMS_OUTPUT.PUT_LINE('----------------------------');
		END LOOP;
END;

BEGIN
	ej33('Antonio Vera');
END;


/*4. Crear un procedimiento almacenado que muestre el promedio, número y tipo de cuenta 
de los depósitos hechos por Ana Muñoz. El nombre del cliente será el parámetro del 
procedimiento. Cree el bloque de llamada.*/


CREATE OR REPLACE PROCEDURE ej34 (inombre VARCHAR2) IS

	CURSOR c1 IS SELECT numeroc, tipo FROM cuenta 
	JOIN cliente USING(rut)
	WHERE nombre=inombre;

	var c1%ROWTYPE;

	v_avgSaldo NUMERIC;

	BEGIN
	
		SELECT AVG(saldo) INTO v_avgSaldo FROM cuenta 
		JOIN cliente USING(rut)
		WHERE nombre=inombre;

		FOR var IN c1
			LOOP
				DBMS_OUTPUT.PUT_LINE('Numero de la cuenta: ' ||var.numeroc  ||' || Tipo de Cuenta: ' ||var.tipo);
			END LOOP;
		DBMS_OUTPUT.PUT_LINE('El Promedio de los saldos es: $' ||v_avgSaldo);
END;

BEGIN
	ej34('Antonio Vera');
END;


SQL NVL(SUM(MONTO_TOTAL),0) funcion