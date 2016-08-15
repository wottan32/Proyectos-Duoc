CREATE TABLE empleado(
	num_emp INT PRIMARY KEY,
	nombre VARCHAR2(100) NOT NULL, 
	tarifa_hora NUMBER, profesion VARCHAR2(50)
	);

CREATE TABLE edificio(
	num_edi INT PRIMARY KEY, 
	direccion VARCHAR2(50)NOT NULL,
	tipo VARCHAR2(50) NOT NULL, 
	nivel CHAR 
	);

CREATE TABLE asignacion(
	num_edi INT, 
	CONSTRAINT edi_fk FOREIGN KEY(num_edi) REFERENCES edificio(num_edi), 
	num_emp INT, 
	CONSTRAINT num_fk FOREIGN KEY(num_emp) 
	REFERENCES empleado(num_emp),
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

	INSERT INTO ASIGNACION VALUES (1,1235,TO_DATE('10/20/2013','MM-DD-YYYY'),30);
	INSERT INTO ASIGNACION VALUES (2,1311,TO_DATE('10/22/2013','MM-DD-YYYY'),65);
	INSERT INTO ASIGNACION VALUES (1,2920,TO_DATE('10/18/2013','MM-DD-YYYY'),17);
	INSERT INTO ASIGNACION VALUES (2,1412,TO_DATE('10/17/2013','MM-DD-YYYY'),25);
	INSERT INTO ASIGNACION VALUES (3,1520,TO_DATE('10/20/2013','MM-DD-YYYY'),14);
	INSERT INTO ASIGNACION VALUES (2,3231,TO_DATE('10/14/2013','MM-DD-YYYY'),12);
	INSERT INTO ASIGNACION VALUES (3,3001,TO_DATE('10/18/2013','MM-DD-YYYY'),7);
END;

/*b*/


DECLARE
	v_calleEdificio edificio.direccion%TYPE :='San Andres';
 	v_calleEdificio2 edificio.direccion%TYPE;

BEGIN
	SELECT edificio.direccion INTO v_calleEdificio2 FROM edificio WHERE edificio.direccion LIKE v_calleEdificio||'%';

	IF SQL%FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Direccion actualizada');
		UPDATE edificio
    	SET direccion='San Alfonso'
    WHERE edificio.direccion LIKE v_calleEdificio||'%';
	END IF;

EXCEPTION
	WHEN no_data_found THEN
	DBMS_OUTPUT.PUT_LINE('NO EXISTE NUNGUN EDIFICIO EN LA CALLE ' ||v_calleEdificio);
END;

/*c*/

BEGIN
SELECT fecha_ini into data FROM asignacion WHERE fecha_ini = '04/17/2013';

IF SQL%FOUND THEN
	DELETE FROM asignacion WHERE fecha_ini=data;
	dbms_output.put_line('Linea borrada');
END IF;

EXCEPTION
	
	WHEN no_data_found THEN
	DBMS_OUTPUT.PUT_LINE('No hay asignaciones de empleados en la Fecha 17/04/2013');

END;
DECLARE
	v_maxNumDias numeric;
	error1 EXCEPTION;
	error2 EXCEPTION;

BEGIN
	SELECT MAX(num_dias) into v_maxNumDias FROM asignacion;

	IF v_maxNumDias>=20 THEN
	 RAISE error1;
   ELSE
   RAISE error2;
	END IF;

EXCEPTION

	WHEN error1 THEN
		UPDATE asignacion
			SET num_dias=19
			WHERE num_dias>=20;

	WHEN error2 THEN
	DBMS_OUTPUT.PUT_LINE('Todos los empleados asignados a los departamentos han trabajado menos de 20 dias');

END;

/*d*/

DECLARE
	v_maxNumDias numeric;
	error1 EXCEPTION;
	error2 EXCEPTION;

BEGIN
	SELECT MAX(num_dias) into v_maxNumDias FROM asignacion;

	IF v_maxNumDias>=20 THEN
	 RAISE error1;
   ELSE
   RAISE error2;
	END IF;

EXCEPTION

	WHEN error1 THEN
		UPDATE asignacion
			SET num_dias=19
			WHERE num_dias>=20;

	WHEN error2 THEN
	DBMS_OUTPUT.PUT_LINE('Todos los empleados asignados a los departamentos han trabajado menos de 20 dias');

END;









