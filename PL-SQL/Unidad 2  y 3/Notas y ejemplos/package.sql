/*Package

	Contiene

	-Procedimientos
	-Funciones
	-Declaraciones

	Esta compuesto

	-header
	-body

	Todos los elementos declarados dentro de las estructuras son globales


Formato header:*/

CREATE OR REPLACE PACKAGE nombre is/as
	especificacion de Procedimientos
	especificacion de Funciones
	especificacion de variables globales
	especificacion de registros globales
	especificacion de cursores globales
	especificacion de variables de excepcion globales
	etc..
END nombre;


/*formato del cuerpo de la esreuctira(opcional)*/

CREATE OR REPLACE PACKAGE body nombre IS/as
	impleamentacion de Procedimientos
	impleamentacion de Funciones
END nombre;

/*llamada externa:*/
nombrePackage.nombreDelElemento;

--------------------------------------------------------------------------------------------------
--EJEMPLO 1

CREATE TABLE cliente (
	rut VARCHAR2(15) PRIMARY KEY, 
	nombre VARCHAR2(50), 
	direccion VARCHAR2(40), 
	telefono VARCHAR2(15)
	);

VALUES
	INSERT INTO cliente VALUES('10345654-3','Julio Leal','saturno 35','4567653');
	INSERT INTO cliente VALUES('14678987-5','Pamela Lara','miraflores 3500','7654356');
	INSERT INTO cliente VALUES('13378664-1','Carlos Riveros','alpes 5680','3267898');
END;


--cabecera
CREATE OR REPLACE PACKAGE pkl_cliente as
	
	PROCEDURE insertar_cliente(I_cliente cliente%ROWTYPE);
	FUNCTION buscar_cliente(r VARCHAR2) return VARCHAR2;
END pkl_cliente;

--cuerpo
CREATE OR REPLACE PACKAGE BODY pkl_cliente AS
	PROCEDURE insertar_cliente(I_cliente cliente%ROWTYPE) IS

		BEGIN
			INSERT INTO cliente VALUES (I_cliente.rut, I_cliente.nombre, I_cliente.direccion, I_cliente.telefono);
	END insertar_cliente;


	FUNCTION buscar_cliente(r VARCHAR2)
		return VARCHAR2 AS

		mensaje1 VARCHAR2(40):='El cliente esta registrado';
		mensaje2 VARCHAR2(40):='El cliente esta registrado';
		nom VARCHAR2(40);

			BEGIN
				SELECT nombre INTO nom FROM cliente WHERE rut=r;

				IF TRIM(nom) IS NOT NULL THEN
					RETURN mensaje1;
				END IF;

			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					RETURN mensaje2;
	END buscar_cliente;
				
END pkl_cliente;

/*Llamado simple*/

DECLARE 
	var cliente%ROWTYPE;

	BEGIN
		var.rut:='14667889-8';
		var.nombre:='Julio Morega';
		var.direccion:= 'pje uno 556';
		var.telefono:='226584474';
		pkl_cliente.insertar_cliente(var);
		DBMS_OUTPUT.PUT_LINE(pkl_cliente.buscar_cliente('14667889-8'));
END;


--------------------------------------------------------------------------------------------------
--EJEMPLO 2
---Cabecera
-------------

CREATE OR REPLACE PACKAGE pk2_cliente AS
	PROCEDURE mostrarclientes;
	PROCEDURE nuevo_cliente(p cliente%ROWTYPE);
	FUNCTION contar RETURN INT;
	CURSOR mostrar IS SELECT * FROM cliente;
	var mostrar%ROWTYPE;
	exp1 EXCEPTION;
	exp2 EXCEPTION;
END pk2_cliente;

---Cuerpo
CREATE OR REPLACE PACKAGE BODY pk2_cliente AS
	PROCEDURE mostrarclientes IS

		BEGIN 
			DBMS_OUTPUT.PUT_LINE('Los clientes son: ');

			FOR var IN mostrar
				LOOP
					DBMS_OUTPUT.PUT_LINE(var.nombre ||' - ' ||var.direccion);
				END LOOP;
	END mostrarclientes;

	FUNCTION contar
		RETURN INT AS TOTAL INT;

		BEGIN
			SELECT COUNT(RUT) INTO total FROM cliente;
			RETURN total;
	END contar;

	PROCEDURE nuevo_cliente(p cliente%ROWTYPE) IS
		cuenta INT;

		BEGIN
			cuenta:=contar;

			IF cuenta <5 THEN
				RAISE exp1;

				ELSE
					RAISE exp2;
			END IF;

		EXCEPTION
			WHEN exp1 THEN
				pkl_cliente.insertar_cliente(p);
				DBMS_OUTPUT.PUT_LINE('Cliente ingresado');
				DBMS_OUTPUT.PUT_LINE('------------------');
				mostrarclientes;
			WHEN exp2 THEN
				DBMS_OUTPUT.PUT_LINE('No es posible insertar el cliente');
				DBMS_OUTPUT.PUT_LINE('---------------------------------');
				mostrarclientes;
	END nuevo_cliente;
END pk2_cliente;




DECLARE 
	var cliente%ROWTYPE;

	BEGIN
		var.rut:='13554667-9';
		var.nombre:='Ana Saez';
		var.direccion:= 'los platos 445';
		var.telefono:='227765543';
		pk2_cliente.nuevo_cliente(var);
END;



















