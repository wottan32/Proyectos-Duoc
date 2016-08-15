--EJERCICIO 1
---------------------------------------

CREATE TABLE departamento(
	codigo VARCHAR2(20) PRIMARY KEY, 
	nombre VARCHAR2(20) CONSTRAINT nombre_nn NOT NULL, 
	telefono VARCHAR2(20) CONSTRAINT telefono_nn NOT NULL
	);

set serveroutput on;

/*
1. Crear un bloque PL/SQL que inserte en la tabla Departamento tres 
filas de información.
*/
BEGIN
	INSERT INTO departamento VALUES('0', 'Informática', '11111111');
	INSERT INTO departamento VALUES('1', 'Contabilidad', '22222222');
	INSERT INTO departamento VALUES('2', 'Informática', '11111111');
END;

/*
2. Crear un bloque PL/SQL que actualice el nombre de un departamento 
con alguna condición que Ud. escoja, el bloque debe mostrar tanto el 
antiguo nombre como el nuevo nombre del departamento.
*/

DECLARE
	v_nomAntig departamento.nombre%TYPE;
	v_nomNuev departamento.nombre%TYPE:='Gerencia';
	v_codDep departamento.codigo%TYPE := '1';

BEGIN
	SELECT nombre INTO v_nomAntig FROM departamento WHERE 
	codigo=v_codDep;

	UPDATE departamento
	SET nombre=v_nomNuev 
	WHERE codigo=v_codDep;

	DBMS_OUTPUT.PUT_LINE('El nombre antiguo era: ' ||v_nomAntig);
	DBMS_OUTPUT.PUT_LINE('El nombre nuevo es: ' ||v_nomNuev);
END;

/*
3. Crear un bloque que borre una fila de información mediante el código 
del departamento.
*/

DECLARE

	v_codDep departamento.codigo%TYPE := '1';
	v_nomDep departamento.nombre%TYPE;

BEGIN
	SELECT nombre INTO v_nomDep FROM departamento WHERE 
	codigo=v_codDep;

	DELETE FROM departamento
	WHERE codigo=v_codDep;

	DBMS_OUTPUT.PUT_LINE('Se ha borrado el departamento: ' ||v_nomDep);

END;

--EJERCICIO 2
---------------------------------------

CREATE TABLE articulos(
	codarticulo INT PRIMARY KEY, 
	nomarticulo VARCHAR2(20) CONSTRAINT nomarticulo_nn NOT NULL, 
	precio INT CONSTRAINT precio_nn NOT NULL
	);

/*
1. Insertar los siguientes datos a la tabla mediante un bloque PL/SQL:

1, zapatilla, 20990
2, buzo, 15000
3, polera, 8500
*/

BEGIN
	INSERT INTO articulos VALUES(1, 'zapatilla', 20990);
	INSERT INTO articulos VALUES(2, 'buzo', 15000);
	INSERT INTO articulos VALUES(3, 'polera', 8500);
END;

/*
3. Crear un bloque PL/SQL que muestre el promedio y la suma de los precios de los artículos.
*/
DECLARE
	v_avgPrec articulos.precio%TYPE;
	v_sumPrec articulos.precio%TYPE;

BEGIN
	SELECT AVG(precio), SUM(precio) INTO v_avgPrec, v_sumPrec FROM articulos;
	DBMS_OUTPUT.PUT_LINE('El promedio de los precios de los articulos es: '||v_avgPrec);
	DBMS_OUTPUT.PUT_LINE('La suma de los precios de los articulos es: ' ||v_sumPrec);
END;

/*4. Crear un bloque PL/SQL que muestre el precio mínimo y máximo de los precios de los artículos.*/

DECLARE
	v_minPrec articulos.precio%TYPE;
	v_maxPrec articulos.precio%TYPE;

BEGIN
	SELECT MIN(precio), MAX(precio) INTO v_minPrec, v_maxPrec FROM articulos;
	DBMS_OUTPUT.PUT_LINE('El precio minimo de los articulos es: '||v_minPrec);
	DBMS_OUTPUT.PUT_LINE('El precio mas alto de los articulos es: ' ||v_maxPrec);
END;

/*
5. Crear un bloque PL/SQL que muestre el precio del artículo cuyo nombre comienza con Z.
*/

DECLARE
	v_prec articulos.precio%TYPE;

BEGIN
	SELECT precio INTO v_prec FROM articulos WHERE nomarticulo LIKE'z%';
	DBMS_OUTPUT.PUT_LINE('El precio del articulo es: '||v_prec);
END;

/*
6. Crear un bloque PL/SQL que muestre el precio de 3 buzos con un 30% de descuento.
*/

DECLARE
	v_prec articulos.precio%TYPE;
	v_nomArtic articulos.nomarticulo%TYPE :='buzo';
	v_cantArtic NUMBER := 3;
	v_descArtic NUMBER := 30;
	v_descAeticFin NUMBER :=(100-v_descArtic)/100;

BEGIN
	SELECT (precio*v_cantArtic)*v_descAeticFin INTO v_prec FROM articulos WHERE nomarticulo=v_nomArtic;
	DBMS_OUTPUT.PUT_LINE('El precio del articulo "'||v_nomArtic ||'" x' ||v_cantArtic ||' con un '||v_descArtic ||'% de descuento es: ' ||v_prec);
END;

--EJERCICIO 3
---------------------------------------

CREATE TABLE departamento(
	coddep INT PRIMARY KEY, 
	nombredep VARCHAR2(30)
	CONSTRAINT nombredep_nn NOT NULL
	);

CREATE TABLE profesor(
	codprof INT PRIMARY KEY,
	nomprof VARCHAR2(30) CONSTRAINT 
	nomprof_nn NOT NULL, 
	coddep INT, 
	CONSTRAINT coddep_fk FOREIGN KEY(coddep) REFERENCES departamento(coddep)
	);

CREATE TABLE asignatura(
	cod VARCHAR2(10) PRIMARY KEY, 
	nomasig VARCHAR2(30) CONSTRAINT nomasig_nn NOT NULL, 
	coddep INT, codprof INT, 
	CONSTRAINT coddep_fk2 FOREIGN KEY(coddep) REFERENCES departamento(coddep), 
	CONSTRAINT codprof_fk FOREIGN KEY(codprof) REFERENCES profesor(codprof)
	);

BEGIN
	INSERT INTO departamento VALUES(12,'Informática');
	INSERT INTO departamento VALUES(14,'Ventas');
	INSERT INTO departamento VALUES(16,'Publicidad');
	INSERT INTO departamento VALUES(18,'Diseño Gráfico');

	INSERT INTO profesor VALUES(125,'Juan Soto',12);
	INSERT INTO profesor VALUES(136,'Cesar Quiroz',12);
	INSERT INTO profesor VALUES(139,'Camila Lara',18);
	INSERT INTO profesor VALUES(124,'Ana Muñoz',14);

	INSERT INTO asignatura VALUES('PGB 240','Programación Básica',12,125);
	INSERT INTO asignatura VALUES('BD 330','Base de datos I',12,136);
	INSERT INTO asignatura VALUES('DSB 500','Diseño Web',18,124);
END;

/*
1. Crear un bloque PL/SQL que muestre el código y nombre de la asignatura 
que dicta la profesora Camila Lara.
*/

DECLARE
	v_codAsig asignatura.cod%TYPE;
	v_asig asignatura.nomasig%TYPE;
	v_nomProf profesor.nomprof%TYPE :='Camila Lara'; --Nota: camila lara no tiene asignaturas, por lo que no retorna datos, probar con Ana Muñoz

BEGIN
	SELECT asignatura.cod, nomasig INTO v_codAsig, v_asig FROM asignatura 
	JOIN profesor USING(codprof)
	WHERE  profesor.nomprof=v_nomProf;

	DBMS_OUTPUT.PUT_LINE('El codigo de la asignatura es: '||v_codAsig);
	DBMS_OUTPUT.PUT_LINE('El nombre de la asignatura es: '||v_asig);
END;



/*
2. Crear un bloque PL/SQL que muestre el código y nombre del profesor que 
pertenece al departamento de diseño grafico.
*/

DECLARE
	v_codProf profesor.codprof%TYPE;
	v_nomProf profesor.nomprof%TYPE;
	v_nomDep departamento.nombredep%TYPE :='Diseño Gráfico';

BEGIN
	SELECT profesor.codprof, profesor.nomprof INTO v_codProf, v_nomProf FROM profesor
	JOIN departamento USING(coddep)
	WHERE  departamento.nombredep=v_nomDep ;

	DBMS_OUTPUT.PUT_LINE('El codigo del profesor es : '||v_codProf);
	DBMS_OUTPUT.PUT_LINE('El nombre del profesor es: '||v_nomProf);
END;

/*
3. Crear un bloque PL/SQL que muestre el código y nombre del departamento al 
que pertenece la profesora Ana Muñoz.
*/

DECLARE
	v_codDep departamento.coddep%TYPE;
	v_nomDep departamento.nombredep%TYPE;
	v_nomProf profesor.nomprof%TYPE:= 'Ana Muñoz';

BEGIN
	SELECT coddep, departamento.nombredep INTO v_codDep , v_nomDep FROM departamento
	JOIN profesor USING(coddep)
	WHERE  profesor.nomprof=v_nomProf ;

	DBMS_OUTPUT.PUT_LINE('El codigo del departamento es : '||v_codDep);
	DBMS_OUTPUT.PUT_LINE('El nombre del departamento es : '||v_nomDep);
END;

/*
4. Crear un Bloque PL/SQL que muestre la cantidad de profesores que dictan la 
asignatura Programación Básica.
*/

DECLARE
	v_cantProf NUMBER;
	v_nomDep departamento.nombredep%TYPE :='Programación Básica';

BEGIN
	SELECT COUNT(codprof) INTO v_cantProf FROM profesor
	JOIN departamento USING(coddep)
	WHERE nombredep=v_nomDep;
	DBMS_OUTPUT.PUT_LINE('La cantidad de profesores en el departamento "'||v_nomDep ||'" es ' ||v_cantProf);
END;