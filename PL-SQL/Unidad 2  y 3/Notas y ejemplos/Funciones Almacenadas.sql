--FUNCIONES ALMACENADAS
---------------------------


--Formato :


CREATE OR REPLACE FUNCTION (nombre_parametro tipo_dato)
RETURN tipo_dato
AS
declaraciones variables, registros, CURSOR, etc
BEGIN
--------
------
----
--
RETURN variable
EXCEPTION
------
----
--
END;




CREATE TABLE libro(cod NUMBER(5), nombre VARCHAR2(30));

BEGIN
	INSERT INTO libro VALUES (1,'Papelucho');
	INSERT INTO libro VALUES (2,'100 años de soledad');
	INSERT INTO libro VALUES (3,'Caballo de Troya');
END;


Ejemplo1
-------------------------------
CREATE OR REPLACE FUNCTION cantidad RETURN INT AS cant INT;

	BEGIN
		SELECT COUNT(cod) INTO cant FROM libro;
		RETURN cant;

END;

--llamado de funcione en un bloque
BEGIN
	DBMS_OUTPUT.PUT_LINE('La cantidad de libros es :'||cantidad);
END;



--usar la funcion de procedimiento alamcenado
CREATE OR REPLACE PROCEDURE insertar(c libro.cod%TYPE, n libro.nombre%TYPE) IS
BEGIN 
	IF cantidad <5 THEN
		INSERT INTO libro VALUES(c, n);
		DBMS_OUTPUT.PUT_LINE('Libro Ingresado');
		ELSE
			DBMS_OUTPUT.PUT_LINE('Ha sobrepasado la cantidad de libros premitidos');
	END IF;
END;

BEGIN
	insertar(4,'los miserables');
END;

BEGIN
	insertar(5, 'la odisea');
END;

BEGIN
	insertar(6, 'paplelucho en la clinica');
END;

-EJEMPLO2
----------------------------------------------------------------
CREATE OR REPLACE FUNCTION verificar (n libro.nombre%TYPE) RETURN VARCHAR2 AS var INT;
	mensaje1 VARCHAR2(30):= 'EL libro esta registrado';
	mensaje2 VARCHAR2(30):= 'El libro no esta registrado';
	
	BEGIN
		SELECT cod INTO var FROM libro WHERE nombre=n;

		if var IS NOT NULL THEN
			RETURN mensaje1;
		END IF;

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		RETURN mensaje2;
END;

--llamada mediante bloque
BEGIN
	DBMS_OUTPUT.PUT_LINE(verificar('Papelucho'));
END;

--uso de la funcion de un procedimiento almacenado
CREATE OR REPLACE PROCEDURE mostrar(n libro.nombre%TYPE) IS

	CURSOR mostrar1 IS SELECT nombre FROM libro;
	var mostrar1%ROWTYPE;

	BEGIN
		DBMS_OUTPUT.PUT_LINE(verificar(n));
		DBMS_OUTPUT.PUT_LINE('Los libros son: ');
		DBMS_OUTPUT.PUT_LINE('----------------');
		
		FOR var IN mostrar1
			LOOP
				DBMS_OUTPUT.PUT_LINE(var.nombre);
			END LOOP;
END;

BEGIN
	mostrar('Papelucho');
END;