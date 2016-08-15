CREATE TABLE empleado
	num_emp INT PRIMARY KEY,
	nombre VARCHAR2(100) NOT NULL, 
	tarifa_hora NUMBER, 
	profesion VARCHAR2(50)
	);

CREATE TABLE edificio(
	num_edi INT PRIMARY KEY, 
	direccion VARCHAR2(50)NOT NULL,
	tipo VARCHAR2(50) NOT NULL, 
	nivel CHAR 
	);

CREATE TABLE asignacion(
	num_edi INT, 
	constraint edi_fk FOREIGN KEY(num_edi) REFERENCES edificio(num_edi), 
	num_emp INT, 
	constraint num_fk FOREIGN KEY(num_emp) REFERENCES empleado(num_emp),
	fecha_ini DATE, 
	num_dias INT
	);

BEGIN
	INSERT INTO empleado VALUES (1235,'Mario Pérez',3000,'Eletricista');
	INSERT INTO empleado VALUES (1412,'Carlos García',2500,'Fontanero');
	INSERT INTO empleado VALUES (2920,'Ricardo Gómez',2300,'Pintor');
	INSERT INTO empleado VALUES (3231,'Pablo Morán',2800,'Carpintero');
	INSERT INTO empleado VALUES (1520,'Hugo Fuentes',2500,'Fontanero');
	INSERT INTO empleado VALUES (1311,'Cristian Barrera',3500,'Eletricista');
	INSERT INTO empleado VALUES (3001,'Álvaro Méndez',2300,'Pintor');

	INSERT INTO edificio VALUES (1,'Alamos 23','Oficina','A');
	INSERT INTO edificio VALUES (2,'Los Alpes 455','Tienda','B');
	INSERT INTO edificio VALUES (3,'San Andres 56','Vivienda','A');

	INSERT INTO ASIGNACION VALUES (1,1235,TO_DATE('10/20/2013','MM/DD/YYYY'),30);
	INSERT INTO ASIGNACION VALUES (2,1311,TO_DATE('10/22/2013','MM/DD/YYYY'),65);
	INSERT INTO ASIGNACION VALUES (1,2920,TO_DATE('10/18/2013','MM/DD/YYYY'),17);
	INSERT INTO ASIGNACION VALUES (2,1412,TO_DATE('10/17/2013','MM/DD/YYYY'),25);
	INSERT INTO ASIGNACION VALUES (3,1520,TO_DATE('10/20/2013','MM/DD/YYYY'),14);
	INSERT INTO ASIGNACION VALUES (2,3231,TO_DATE('10/14/2013','MM/DD/YYYY'),12);
	INSERT INTO ASIGNACION VALUES (3,3001,TO_DATE('10/18/2013','MM/DD/YYYY'),7);
END;
/*1*/

CREATE OR REPLACE FUNCTION buscarFechaIniAsignacion (nEmpleado asignacion.num_emp%TYPE) RETURN DATE AS var DATE;
	BEGIN
		SELECT fecha_ini INTO var FROM asignacion WHERE num_emp=nEmpleado;
		RETURN var;
END;

BEGIN
	DBMS_OUTPUT.PUT_LINE('fecha es : '||buscarFechaIniAsignacion(1235) );
END;

/*2*/

CREATE OR REPLACE FUNCTION avgTarifasHora RETURN INT AS var INT;
	BEGIN
		SELECT AVG(tarifa_hora) INTO var FROM empleado; 
		RETURN var;

END;

BEGIN
	DBMS_OUTPUT.PUT_LINE('El pormedio de las tarifas hora es : '||avgTarifasHora );
END;


/*3*/
CREATE OR REPLACE FUNCTION buscarNumeroDiasAsignacion(nomEmp empleado.nombre%TYPE) RETURN INT AS var INT;
	BEGIN
		SELECT num_dias INTO var FROM asignacion 
		JOIN empleado USING(num_emp)
		WHERE nombre=nomEmp;
		RETURN var;

END;

BEGIN
	DBMS_OUTPUT.PUT_LINE('El numero de dias de la asignacion es : '||buscarNumeroDiasAsignacion('Mario Pérez') );		
END;

/*4*/
CREATE OR REPLACE FUNCTION BuscarEdifDeEmp(numEmp asignacion.num_emp%TYPE) RETURN VARCHAR2 AS var VARCHAR2(20);
	BEGIN
		SELECT edificio.tipo INTO var FROM edificio 
		JOIN asignacion USING (num_edi)
		WHERE num_emp=numEmp;
		RETURN var;
END;

BEGIN
	DBMS_OUTPUT.PUT_LINE('El edificio del empleado es : '||BuscarEdifDeEmp(1412) );		
END;

/*5*/


/*6*/
CREATE OR REPLACE FUNCTION buscarEmpeladoPorNumero(numEmp empleado.num_emp%TYPE) RETURN VARCHAR2 AS var VARCHAR2(20);
	BEGIN
		SELECT empleado.nombre INTO var FROM empleado WHERE num_emp=numEmp;
		RETURN var;
END;

BEGIN
	DBMS_OUTPUT.PUT_LINE('El nombre del empleado es : '||buscarEmpeladoPorNumero(1412) );	
END;

/*7*/
CREATE OR REPLACE FUNCTION contarNumeroEmpleados RETURN INT AS var INT;
	BEGIN
		SELECT COUNT(*) INTO var FROM empleado;
		RETURN var;
END;

BEGIN
	DBMS_OUTPUT.PUT_LINE('El numero de empleados es: '||contarNumeroEmpleados );	
END;

/*8*/

CREATE OR REPLACE FUNCTION BuscEmpDeProfC RETURN VARCHAR2 AS var VARCHAR2(20);
  BEGIN
	SELECT nombre INTO var FROM empleado WHERE profesion LIKE 'C%';
	RETURN var;
END;

BEGIN
	DBMS_OUTPUT.PUT_LINE('El nombre del empleados cuya profesion comienza con C es: '||BuscEmpDeProfC );	
END;


--EJERCICIO 2
-------------------------------------------------------------------------------------------------------------------------------


TABLA FUNCIONARIO

CREATE TABLE funcionario(
	rut VARCHAR2(20), 
	nombre VARCHAR2(20), 
	direccion VARCHAR2(45), 
	sueldo D(10), 
	tipo VARCHAR2(20), 
	especialidad VARCHAR2(45), 
	fecha_contrato VARCHAR2(20), 
	PRIMARY KEY(rut));

TABLA LIBRO

CREATE TABLE libro(
	codigo NUMBER(6), 
	funcionario_rut VARCHAR2(20),
	nombre_libro VARCHAR2(20),
	PRIMARY KEY(codigo),
	FOREIGN KEY(funcionario_rut) REFERENCES funcionario(rut));

Insertar los siguientes datos a las tablas

BEGIN
	INSERT INTO funcionario VALUES ('12456', 'Juan López', 'alamos 123', 450000, 'cajero', 'Finanzas',to_date('10/10/2005','dd/mm/yyyy'));
	INSERT INTO funcionario VALUES ('11345', 'José Torres', 'San pedro 146', 420000, 'contador', 'Finanzas',to_date('10/02/2004','dd/mm/yyyy'));
	INSERT INTO funcionario VALUES ('10778', 'Ana  Morales', 'San jose 10', 410000, 'Administrativa', 'Secretaria',to_date('10/03/2005','dd/mm/yyyy'));
	INSERT INTO libro VALUES (101, '11345','Las dos torres');
	INSERT INTO libro VALUES (105, '10778','El codigo Da Vinci');
	INSERT INTO libro VALUES (104, '12456','La quinta estrella');
	INSERT INTO libro VALUES (107, '11345','Caballo de troya III');
END;

/*1*/
CREATE OR REPLACE FUNCTION BuscarFuncionarioNombrePorRut(irut VARCHAR2) RETURN VARCHAR2 AS var VARCHAR2(100);
BEGIN
	SELECT nombre INTO var FROM funcionario WHERE rut=irut;
	RETURN var;
END;

BEGIN
	DBMS_OUTPUT.PUT_LINE(  BuscarFuncionarioNombrePorRut('12456'));
END;

/*2*/
CREATE OR REPLACE FUNCTION BuscarLibrosPedidosPorNombre(inombre VARCHAR2) RETURN VARCHAR2 AS var VARCHAR2(100);
	CURSOR c1 IS SELECT nombre_libro FROM libro
				JOIN funcionario ON (rut=funcionario_rut)
				WHERE nombre=inombre;
	var= c1%ROWTYPE;
	BEGIN
	DBMS_OUTPUT.PUT_LINE("Los nombres de los libros pedidos por " ||inombre ||" son:")
		FOR var in c1
			LOOP
				DBMS_OUTPUT.PUT_LINE(var.nombre_libro);
			END LOOP;
END;


https://stackoverflow.com/questions/5923741/how-can-i-create-and-return-a-cursor-from-a-plsql-function





	

