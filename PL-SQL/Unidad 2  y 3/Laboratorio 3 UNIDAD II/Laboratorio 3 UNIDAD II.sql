--EJERCICIO 1
---------------------------------------

CREATE TABLE AUTOR (
	cod_autor NUMBER PRIMARY KEY, 
	nombre_autor VARCHAR2 (50) NOT NULL, 
	fecha_nacimiento VARCHAR2 (10), 
	nacionalidad VARCHAR2 (30)
	);

CREATE TABLE LIBRO (
	cod_libro NUMBER primary key, 
	titulo VARCHAR2 (70) NOT NULL, 
	id_autor NUMBER, 
	año NUMBER, 
	nom_editorial VARCHAR2(40), 
	precio NUMBER,  
	FOREIGN KEY (id_autor) REFERENCES autor(cod_autor)
	);

BEGIN
	INSERT INTO autor VALUES (10,'Alejandro Dumas',	'10-10-1802','Francesa');
	INSERT INTO autor VALUES (12,'Ruben Dario','05-12-1867','Nicaraguense');
	INSERT INTO autor VALUES (11,'Mark Twain','11-06-1835','Estadounidense');
	INSERT INTO autor VALUES (13,'Victor Hugo','04-10-1802','Francesa');

	INSERT INTO libro VALUES (102,'Los tres mosqueteros',10,2003,'Altazor',	15700);
	INSERT INTO libro VALUES (101,'El conde de Montecristo',10,2004,'Antares',12500);
	INSERT INTO libro VALUES (103,'Las Aventuras de Tom Sawyer',11,	2002,'Contrapunto',17800);
	INSERT INTO libro VALUES (104,'cantos de Vida y Esperanza',12,2002,'Antares',19800);
	INSERT INTO libro VALUES (105,'Los Miserables',13,2003,'Contrapunto',16700);
END;

set serveroutput on;

/*
1. Crear un Bloque con un registro PL/SQL que muestre el nombre del autor y nacionalidad de la 
fecha de nacimiento 05-12-1867.
*/

DECLARE
	TYPE datos IS RECORD(
	v_nomAutor autor.nombre_autor%TYPE,
	v_nacAutor autor.nacionalidad%TYPE	
	);

	collectionDatos datos;
	v_fechNac autor.fecha_nacimiento%TYPE := '05-12-1867';

BEGIN
	SELECT nombre_autor, nacionalidad INTO collectionDatos FROM autor WHERE 
	fecha_nacimiento=v_fechNac;
	DBMS_OUTPUT.PUT_LINE('El nombre del autor es: '||collectionDatos.v_nomAutor);
	DBMS_OUTPUT.PUT_LINE('La nacionalidad del autor es: '||collectionDatos.v_nacAutor);
END;

/*
2. Crear un Bloque con un registro PL/SQL que muestre la suma y promedio de los precios que tiene 
registrado un determinado autor. Utilice el nombre del autor para la condición de la consulta.
*/

DECLARE
	v_sumPrecios libro.precio%TYPE;
	v_avgPrecios libro.precio%TYPE;
	v_nomAutor autor.nombre_autor%TYPE :='Alejandro Dumas';

BEGIN
	SELECT SUM(libro.precio), AVG(libro.precio) INTO v_sumPrecios, v_avgPrecios FROM LIBRO
	JOIN autor ON id_autor=cod_autor
	WHERE nombre_autor=v_nomAutor;
	DBMS_OUTPUT.PUT_LINE('La suma de los precios es: ' ||v_sumPrecios);
	DBMS_OUTPUT.PUT_LINE('El promedio de los precos es: '||v_avgPrecios);
END;

/*
3. Crear un Bloque con un registro PL/SQL que muestre el título y editorial del libro que esté 
registrado en la editorial Altazor.
*/
DECLARE
	v_titulo libro.titulo%TYPE;
	v_editorial libro.nom_editorial%TYPE :='Altazor';

BEGIN
	SELECT titulo, nom_editorial INTO v_titulo, v_editorial FROM libro  WHERE nom_editorial=v_editorial;

	DBMS_OUTPUT.PUT_LINE('El titulo del libro es: ' ||v_titulo);
	DBMS_OUTPUT.PUT_LINE('El nombre de la editorial es: ' ||v_editorial);
END;

/*
4. Crear un Bloque con un registro PL/SQL que muestre la cantidad de libros editados el año 2002.
*/

DECLARE
	v_cantLibros NUMBER;
	v_año libro.año%TYPE :=2002;

BEGIN
	SELECT COUNT(cod_libro) INTO v_cantLibros FROM libro WHERE año=v_año;
	DBMS_OUTPUT.PUT_LINE('La ncatidad de libros editados el año '||v_año ||' es ' ||v_cantLibros);
END;



--EJERCICIO 2
---------------------------------------

CREATE TABLE empleados(
	numemp INT PRIMARY KEY, 
	nombre VARCHAR2(40) CONSTRAINT nombre_nn NOT NULL,
	tarifa_hora INT CONSTRAINT tarifa_hora_nn NOT NULL , 
	profesion VARCHAR2(30) CONSTRAINT profesion_nn NOT NULL
	); 

CREATE TABLE edificio(
	num_edi INT PRIMARY KEY, 
	direccion VARCHAR2(30) CONSTRAINT direccion_nn NOT NULL, 
	tipo VARCHAR2(30) CONSTRAINT tipo_nn NOT NULL
	);

CREATE TABLE asignacion(
	num_edi INT, CONSTRAINT num_edi_fk FOREIGN KEY(num_edi) REFERENCES edificio(num_edi), 
	numemp INT, CONSTRAINT numemp_fk FOREIGN KEY(numemp) REFERENCES empleados(numemp),  
	fecha_ini DATE CONSTRAINT fecha_ini_nn NOT NULL, 
	num_dias INT CONSTRAINT num_dias_nn NOT NULL
	);

BEGIN
	INSERT INTO empleados VALUES(1235,'Marco Pérez',3000,'Electricista');
	INSERT INTO empleados VALUES(1412,'Carlos García',2500,'Fontanero');
	INSERT INTO empleados VALUES(2920,'Juan Gómez',2800,'Carpintero');
	INSERT INTO empleados VALUES(3231,'Pedro Morán',2300,'Pintor');
	INSERT INTO empleados VALUES(1520,'Hugo Fuentes',2500,'Fontanero');
	INSERT INTO empleados VALUES(1311,'Cristobal Barrera',3500,'Electricista');
	INSERT INTO empleados VALUES(3001,'Antonio Méndez',2300,'Pintor');

	INSERT INTO edificio VALUES(1,'Álamos 23','Oficina');
	INSERT INTO edificio VALUES(2,'Los Alpes 455','Tienda');
	INSERT INTO edificio VALUES(3,'San Andrés 56','Vivienda');

	INSERT INTO asignacion VALUES(2,1311,TO_DATE('03/22/2012','MM/DD/YYYY'),25);
	INSERT INTO asignacion VALUES(1,2920,TO_DATE('02/18/2012','MM/DD/YYYY'),17);
	INSERT INTO asignacion VALUES(2,1412,TO_DATE('04/17/2012','MM/DD/YYYY'),25);
END;


/*
1. Crear un Bloque con un registro PL/SQL que permita mostrar el nombre y tarifa 
del empleado de profesión Carpintero.
*/
DECLARE
	v_nomEmp empleados.nombre%TYPE;
	v_tarifaEmp empleados.tarifa_hora%TYPE;
	v_profesion empleados.profesion%TYPE :='Carpintero'; 

BEGIN
	SELECT nombre, tarifa_hora INTO v_nomEmp, v_tarifaEmp FROM empleados WHERE profesion=v_profesion;
	DBMS_OUTPUT.PUT_LINE('El nombre del empelado es ' ||v_nomEmp);
	DBMS_OUTPUT.PUT_LINE('La tarifa del empelado es ' ||v_tarifaEmp);

END;

/*
2. Crear un Bloque con un registro PL/SQL que muestre la dirección del edificio, 
el nombre y profesión de los empleados que están asignados al edificio 1.
*/
DECLARE
	TYPE datos IS RECORD(
		v_dirEdif edificio.direccion%TYPE,
		V_nombEdif edificio.tipo%TYPE,
		v_nomEmp empleados.nombre%TYPE,
		v_prfEmp empleados.profesion%TYPE
		);

	collectionDatos datos;
	v_numEdif edificio.num_edi%TYPE := 1 ;

BEGIN
	SELECT edificio.direccion, edificio.tipo, empleados.nombre, empleados.profesion INTO collectionDatos FROM empleados
	JOIN asignacion USING(numemp)
	JOIN edificio USING(num_edi)
	WHERE num_edi=v_numEdif;

	DBMS_OUTPUT.PUT_LINE('La direccion del edificio ' ||v_numEdif ||' es: '||collectionDatos.v_dirEdif);
	DBMS_OUTPUT.PUT_LINE('El nombre del edificio ' ||v_numEdif ||' es: '||collectionDatos.V_nombEdif);
	DBMS_OUTPUT.PUT_LINE('El nombe del empleado del edificio ' ||v_numEdif ||' es: '||collectionDatos.v_nomEmp);
	DBMS_OUTPUT.PUT_LINE('La profesión del empleado del edificio ' ||v_numEdif ||' es: '||collectionDatos.v_prfEmp);
END;



/*3. Crear un Bloque con un registro PL/SQL que muestre el nombre, tarifa_hora y 
profesión del empleado que tiene una asignación de 17 días.
*/

DECLARE
	TYPE datos IS RECORD(
		v_nomEmp empleados.nombre%TYPE,
		v_tarifaEmp empleados.tarifa_hora%TYPE,
		v_prfEmp empleados.profesion%TYPE
		);
	collectionDatos datos;
	v_diasAsig asignacion.num_dias%TYPE :=17;

BEGIN
	SELECT empleados.nombre, empleados.tarifa_hora, empleados.profesion INTO collectionDatos FROM empleados
	JOIN asignacion USING(numemp)
	WHERE num_dias=v_diasAsig;

	DBMS_OUTPUT.PUT_LINE('El nombre del empleado es: '||collectionDatos.v_nomEmp);
	DBMS_OUTPUT.PUT_LINE('La tarifa del empleado es: '||collectionDatos.v_tarifaEmp);
	DBMS_OUTPUT.PUT_LINE('La profesion del empleado es: '||collectionDatos.v_prfEmp);

END;


/*
4. Crear un Bloque con un registro PL/SQL con la suma y el promedio de las tarifa_hora 
de todos los empleados.
*/

DECLARE
	v_sumTarif NUMBER;
	v_promTarif NUMBER;

BEGIN	
	SELECT SUM(tarifa_hora), AVG(tarifa_hora) INTO v_sumTarif, v_promTarif FROM empleados;
	DBMS_OUTPUT.PUT_LINE('La suma de las tarifas/hora de los empleados es: ' ||v_sumTarif);
	DBMS_OUTPUT.PUT_LINE('El promedio de las tarifas/hora de los empleados es: ' ||v_promTarif);
END;

