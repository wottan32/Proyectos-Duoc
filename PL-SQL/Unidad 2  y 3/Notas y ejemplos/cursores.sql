CREATE table libro(
	codlibro varchar2(10) primary key,
	nombre varchar2(50), 
	autor varchar2(50), 
	numejemplares int

);

BEGIN
	INSERT INTO libro VALUES ('1011','Papelucho','Marcela Paz',3);
	INSERT INTO libro VALUES ('1012','Quijote de la mancha','Miguel de Cervantes',5);
	INSERT INTO libro VALUES ('1013','Eva Luna','Isabel Allende',2);
	INSERT INTO libro VALUES ('1014','La Odisea','Homero',5);
END;

--CURSOR :Zona de memoria asignada a oracle
/*
CURSOR mostrar is SELECT rut,nombre, direccion 
VALUES empleado;
*/

/*
CURSOR SIN PARAMETRO
--------------------------

Ejemplo 1
Crear un bloque PL/SQL que muestre la cantidad y los nombres de los libros registrados en la base de datos.
*/

--Ciclo LOOP
---------------------
DECLARE
	CURSOR mostrar IS SELECT nombre FROM libro;
	var1 libro.nombre%TYPE;
	cont INT;

BEGIN
	SELECT COUNT(nombre) INTO cont FROM libro;
	DBMS_OUTPUT.PUT_LINE('La cantidad de libros es: '||cont);
	DBMS_OUTPUT.PUT_LINE('-----------------------------------');
	DBMS_OUTPUT.PUT_LINE('Nombre Libros: ');
	OPEN mostrar;
		FETCH mostrar INTO var1;
		WHILE mostrar%FOUND
			LOOP				
				DBMS_OUTPUT.PUT_LINE(var1);
				FETCH mostrar INTO var1;
			END LOOP;
		CLOSE mostrar;
END;

	
--Ciclo WHILE
---------------------
DECLARE
	CURSOR mostrar IS SELECT nombre FROM libro;
	var1 libro.nombre%TYPE;
	cont INT;

BEGIN
	SELECT COUNT(nombre) INTO cont FROM libro;
	DBMS_OUTPUT.PUT_LINE('La cantidad de libros es: '||cont);
	DBMS_OUTPUT.PUT_LINE('-----------------------------------');
	DBMS_OUTPUT.PUT_LINE('Nombre Libros: ');
	OPEN mostrar;
		FETCH mostrar INTO var1;
		WHILE mostrar%FOUND
			LOOP
				FETCH mostrar INTO var1;
				DBMS_OUTPUT.PUT_LINE(var1);
				FETCH mostrar INTO var1;
			END LOOP;
		CLOSE mostrar;
END;

--Ciclo FOR
DECLARE
	CURSOR mostrar IS SELECT nombre FROM libro;
	var1 libro.nombre%TYPE;
	cont INT;

BEGIN
	SELECT COUNT(nombre) INTO cont FROM libro;
	DBMS_OUTPUT.PUT_LINE('La cantidad de libros es: '||cont);
	DBMS_OUTPUT.PUT_LINE('-----------------------------------');
	DBMS_OUTPUT.PUT_LINE('Nombre Libros: ');
	FOR var1 IN mostrar
			LOOP
				DBMS_OUTPUT.PUT_LINE(var1.nombre);
			END LOOP;
END;

/*
CURSOR con parámetro
--Ejemplo 2: crear un bloque PL/SQL que muestre el nombre y autor de los libros con 5 ejemplares

Ciclo LOOP
-----------
*/
DECLARE
	CURSOR mostrar(p int) IS SELECT nombre, autor FROM libro
	WHERE numejemplares=P;

	var1 mostrar%ROWTYPE;

BEGIN
	OPEN mostrar(5);
		LOOP
			FETCH mostrar INTO var1;
			EXIT WHEN mostrar%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE('Nombre Libro: ' ||var1.nombre);
			DBMS_OUTPUT.PUT_LINE('Autor: ' ||var1.autor);
			DBMS_OUTPUT.PUT_LINE('------------------------------------------');
		END LOOP;
	CLOSE mostrar;
END;

--Ciclo WHILE
-----------

DECLARE
	CURSOR mostrar(p int) IS SELECT nombre, autor FROM libro
	WHERE numejemplares=P;

	var1 mostrar%ROWTYPE;

BEGIN
	OPEN mostrar(5);
		FETCH mostrar INTO var1;
		WHILE mostrar%FOUND
			LOOP
				DBMS_OUTPUT.PUT_LINE('Nombre Libro: ' ||var1.nombre);
				DBMS_OUTPUT.PUT_LINE('Autor: ' ||var1.autor);
				DBMS_OUTPUT.PUT_LINE('------------------------------------------');
				FETCH mostrar INTO var1;
			END LOOP;
	CLOSE mostrar;
END;

--Ciclo FOR
-----------

DECLARE
	CURSOR mostrar(p int) IS SELECT nombre, autor FROM libro
	WHERE numejemplares=P;

	var1 mostrar%ROWTYPE;

BEGIN
	FOR var1 IN mostrar(5)
		LOOP
			DBMS_OUTPUT.PUT_LINE('Nombre Libro: ' ||var1.nombre);
			DBMS_OUTPUT.PUT_LINE('Autor: ' ||var1.autor);
			DBMS_OUTPUT.PUT_LINE('------------------------------------------');
	END LOOP;
END;

/*
--CURSOR con parámetro y registro
EJEMPLO3: Crear un bloque PL/SQL que muestre el código y nombre ed los libros con mas de 2 ejemplares

Ciclo LOOP
------------
*/

DECLARE
 	CURSOR mostrar(p int) IS SELECT codlibro, nombre FROM libro
 	WHERE numejemplares>p;
 	TYPE datos IS RECORD(
 		cod libro.codlibro%TYPE,
 		nom libro.nombre%TYPE);
 	var1 datos;

 BEGIN
 	OPEN mostrar(2);
 		LOOP
 			FETCH mostrar INTO var1;
 			EXIT WHEN mostrar%NOTFOUND;
 			DBMS_OUTPUT.PUT_LINE('Codigo Libro: '||var1.cod);
 			DBMS_OUTPUT.PUT_LINE('Nombre: '||var1.nom);
 			DBMS_OUTPUT.PUT_LINE('---------------------');
 		END LOOP;
 	CLOSE mostrar;
 END;


--Ciclo WHILE
------------


DECLARE
 	CURSOR mostrar(p int) IS SELECT codlibro, nombre FROM libro
 	WHERE numejemplares>p;
 	TYPE datos IS RECORD(
 		cod libro.codlibro%TYPE,
 		nom libro.nombre%TYPE);
 	var1 datos;

 BEGIN
 	OPEN mostrar(2);
 		FETCH mostrar INTO var1;
 		WHILE mostrar%FOUND
 			LOOP
 				DBMS_OUTPUT.PUT_LINE('Codigo Libro: '||var1.cod);
 				DBMS_OUTPUT.PUT_LINE('Nombre: '||var1.nom);
 				DBMS_OUTPUT.PUT_LINE('---------------------');
 				FETCH mostrar INTO var1;
 			END LOOP;
 		CLOSE mostrar;
 	END;

--Ciclo FOR
------------


DECLARE
 	CURSOR mostrar(p int) IS SELECT codlibro, nombre FROM libro
 	WHERE numejemplares>p;
 	TYPE datos IS RECORD(
 		cod libro.codlibro%TYPE,
 		nom libro.nombre%TYPE);
 	var1 datos;
 	varcur mostrar%ROWTYPE;

 BEGIN
 	FOR varcur IN mostrar(2)
 		LOOP
 		var1:=varcur;
 			DBMS_OUTPUT.PUT_LINE('Codigo Libro: '||var1.cod);
 			DBMS_OUTPUT.PUT_LINE('Nombre: '||var1.nom);
 			DBMS_OUTPUT.PUT_LINE('---------------------');
 		END LOOP;

 END;




