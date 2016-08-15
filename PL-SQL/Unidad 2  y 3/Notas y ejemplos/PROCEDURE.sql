

CREATE TABLE Empleados(
	emp_no VARCHAR2(12) constraint
	Pk_emp_no primary key, 
	nombre VARCHAR2(50) constraint
	nn_nombre not null,  
	oficio VARCHAR2 (20) 
	constraint nn_oficio not null
	);



BEGIN
	INSERT INTO empleados values ('1010', 'Juan Perez', 'director');
	INSERT INTO empleados values ('1011', 'jose Donoso', 'inspector');
	INSERT INTO empleados values ('1012', 'Juan Vera', 'docente');
	INSERT INTO empleados values ('1013', 'Ana Moya', 'docente');
	INSERT INTO empleados values ('1014', 'Marta Canales', 'docente');
	INSERT INTO empleados values ('1015', 'Miguel Lara', 'docente');
END;

set serveroutput on;


--EJEMPLO 1
--------------------------------------------------------------------------------

 CREATE OR REPLACE PROCEDURE mostrar1(p VARCHAR2) IS
	nom empleados.nombre%TYPE;
	ofi empleados.oficio%TYPE;



BEGIN
	SELECT nombre, oficio INTO nom, ofi FROM empleados WHERE emp_no=p;

	DBMS_OUTPUT.PUT_LINE('Nombre: '||nom);
	DBMS_OUTPUT.PUT_LINE('Oficio: '||ofi);

EXCEPTION
	WHEN no_data_found THEN
	DBMS_OUTPUT.PUT_LINE('No existe el empleado');
END;

--------------
BEGIN
	mostrar1('1013');
END;


--EJEMPLO 2  PROCEDIMINRO ALMACENADO CON CURSOR SIN PARAMETRO
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrar2 IS
	CURSOR muestra IS SELECT * from empleados;
	var muestra%ROWTYPE;
	i INT:=1;

	BEGIN
		DBMS_OUTPUT.PUT_LINE('Los empleados son:');
		DBMS_OUTPUT.PUT_LINE('------------------');

		FOR var IN muestra
			LOOP
				DBMS_OUTPUT.PUT_LINE('Empleado: ' ||i);
				DBMS_OUTPUT.PUT_LINE('Numero: ' ||var.emp_no);
				DBMS_OUTPUT.PUT_LINE('Nombre: ' ||var.nombre);
				DBMS_OUTPUT.PUT_LINE('Cargo: ' ||var.oficio);
				DBMS_OUTPUT.PUT_LINE('----------------------------');
				i:=i+1;
			END LOOP;
END;

BEGIN
 mostrar2;
END;

--EJEMPLO 3  PROCEDIMINRO ALMACENADO CON CURSOR Y PARAMETRO
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE mostrar3(ofi VARCHAR2) IS
	CURSOR muestra IS SELECT nombre FROM empleados WHERE oficio=ofi;
	VAR muestra%ROWTYPE;

	BEGIN
		DBMS_OUTPUT.PUT_LINE('Los empleados de cargo '||ofi ||' son: ');
		DBMS_OUTPUT.PUT_LINE('---------------------------------------------');

		FOR var in muestra
		LOOP
			DBMS_OUTPUT.PUT_LINE(var.nombre);
		END LOOP;
	DBMS_OUTPUT.PUT_LINE('------------------------');
END;

BEGIN
mostrar3('docente');
END;


--EJEMPLO 4  
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE llamada IS
	CURSOR buscar IS SELECT oficio FROM empleados GROUP BY oficio;
	var buscar%ROWTYPE;
	BEGIN
		DBMS_OUTPUT.PUT_LINE('INFORMACION EMPLEADOS');
		DBMS_OUTPUT.PUT_LINE('------------------------');
		mostrar2;
		DBMS_OUTPUT.PUT_LINE('INFORMACION EPMPLEADOS POR CARGO');
		DBMS_OUTPUT.PUT_LINE('------------------------');

		FOR var in buscar
			LOOP
				mostrar3(var.oficio);
			END LOOP;
END;
BEGIN
	llamada;
END;

