create table libro(codlibro varchar2(10) primary key,nombre varchar2(50), autor varchar2(50), numejemplares int);

begin
insert into libro values ('1011','Papelucho','Marcela Paz',3);
insert into libro values ('1012','Quijote de la mancha','Miguel de Cervantes',5);
insert into libro values ('1013','Eva Luna','Isabel Allende',2);
insert into libro values ('1014','La Odisea','Homero',5);
end;
set serveroutput on;
/*Ejemplo 1
-----------------------------------------
*/

DECLARE
	CURSOR mostrar IS SELECT nombre FROM libro;
	var libro.nombre%TYPE;
	
	p1 VARCHAR2(30):= 'Papelucho en la clinica';
	p2 VARCHAR2(10):= '1015';
	
BEGIN
	UPDATE libro 
		SET nombre=p1 WHERE codlibro=p2;

	IF SQL%NOTFOUND THEN
		DBMS_OUTPUT.PUT_LINE('NO EXISTE EL LIBRO');
		
		ELSE
			DBMS_OUTPUT.PUT_LINE('LIBRO ACTUALIZADO');
	END IF;

	DBMS_OUTPUT.PUT_LINE('------------------');
	DBMS_OUTPUT.PUT_LINE('LOS LIBROS SON:');
	
	FOR VAR IN mostrar
		LOOP
			DBMS_OUTPUT.PUT_LINE(var.nombre);
		END LOOP;
END;
/*Ejemplo 2
-----------------------------------------
*/

DECLARE

	vcod libro.codlibro%TYPE;
	vaunt libro.autor%TYPE;
	
BEGIN
	SELECT codlibro, autor into vcod, vaunt FROM libro
		WHERE nombre='100 años de soledad';
		DBMS_OUTPUT.PUT_LINE('Codigo: ' ||vcod);
		DBMS_OUTPUT.PUT_LINE('Autor: ' ||vaunt);
	
EXCEPTION
	WHEN no_data_found THEN
	DBMS_OUTPUT.PUT_LINE('NO EXISTE EL LIBRO');
	DBMS_OUTPUT.PUT_LINE('------------------');
	
	WHEN too_many_rows THEN
	DBMS_OUTPUT.PUT_LINE('NOMBRE DEL LIBRO DUPLICADO');
	DBMS_OUTPUT.PUT_LINE('------------------');
END;
		
/*Ejemplo 2.1
-----------------------------------------
*/

		
DECLARE
	CURSOR mostrar IS SELECT nombre FROM libro;
	vcod libro.codlibro%TYPE;
	vaunt libro.autor%TYPE;
	
BEGIN
	SELECT codlibro, autor into vcod, vaunt FROM libro
		WHERE nombre='100 años de soledad';
		DBMS_OUTPUT.PUT_LINE('Codigo: ' ||vcod);
		DBMS_OUTPUT.PUT_LINE('Autor: ' ||vaunt);
	
EXCEPTION
	WHEN no_data_found THEN
	DBMS_OUTPUT.PUT_LINE('NO EXISTE EL LIBRO');
	DBMS_OUTPUT.PUT_LINE('------------------');
	DBMS_OUTPUT.PUT_LINE('------------------');
	DBMS_OUTPUT.PUT_LINE('LOS LIBROS SON');
		FOR VAR IN mostrar
		LOOP
			DBMS_OUTPUT.PUT_LINE(var.nombre);
		END LOOP;
	
	WHEN too_many_rows THEN
	DBMS_OUTPUT.PUT_LINE('NOMBRE DEL LIBRO DUPLICADO');
	DBMS_OUTPUT.PUT_LINE('------------------');
END;

/*Ejemplo 3  ///FAILL
-----------------------------------------
*/

DECLARE
	CURSOR mostrar IS SELECT * FROM libro;
	
	var mostrar%ROWTYPE;
	cod libro.codlibro%TYPE:= '1014';
	
BEGIN
	DELETE FROM libro WHERE codlibro=cod;
	
	IF SQL%FOUND THEN
		DBMS_OUTPUT.PUT_LINE('LIBRO BORRADO');
		ELSE
			DBMS_OUTPUT.PUT_LINE('EL LIBRO NO PUDO SER BORRADO');
	END IF;
	
	DBMS_OUTPUT.PUT_LINE('------------------');
	DBMS_OUTPUT.PUT_LINE('LOS LIBROS SON');
	
	FOR var IN mostrar
		LOOP
			DBMS_OUTPUT.PUT_LINE(var.codlibro);
			DBMS_OUTPUT.PUT_LINE(var.nombre);
			DBMS_OUTPUT.PUT_LINE(var.autor);
			DBMS_OUTPUT.PUT_LINE(var.numejemplares);
			DBMS_OUTPUT.PUT_LINE('------------------');
		 END LOOP;
END;
			
/*Ejemplo 4*/

DECLARE
	c libro.codlibro%TYPE:='1014';
	n libro.nombre%TYPE:='Caballo de troya 1';
	a libro.autor%TYPE:='J. J. Benitez';
	num libro.numejemplares%TYPE := 6;
	contador int;
	ins EXCEPTION;
	mensaje EXCEPTION;
	
BEGIN
	SELECT COUNT(codlibro) INTO contador FROM libro;
	IF contador <5 THEN
		RAISE ins;
		
		ELSE
			RAISE mensaje;
	END IF;
	
EXCEPTION
	WHEN ins THEN
	INSERT INTO libro values(c,n,a,num);
	DBMS_OUTPUT.PUT_LINE('LIBRO INGRESADO');
	DBMS_OUTPUT.PUT_LINE('------------------');
	
	WHEN mensaje THEN
		DBMS_OUTPUT.PUT_LINE('Puede ingresar hasta 5 libros');
		DBMS_OUTPUT.PUT_LINE('------------------');
END;	