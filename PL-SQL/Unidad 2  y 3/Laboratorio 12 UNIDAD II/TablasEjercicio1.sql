DROP TABLE arriendo;
DROP TABLE pelicula;
DROP TABLE socio;

CREATE table socio(
	rut VARCHAR2(50)PRIMARY KEY,
	nombre varchar2(50)NOT NULL,
	direccion VARCHAR2(50)NOT NULL,
	telefono int NOT NULL
	);

CREATE table pelicula(
	codigo VARCHAR2(50)PRIMARY KEY,
	nombre VARCHAR2(50)NOT NULL,
	genero VARCHAR2(50)NOT NULL
	);

CREATE table arriendo(
	rut VARCHAR2(50)REFERENCES socio(rut),
	codigo VARCHAR2(50)REFERENCES pelicula(codigo),
	fecha_inicio VARCHAR2(50)NOT NULL,
	fecha_devolucion VARCHAR2(50)NOT NULL
	);


/*1*/
CREATE OR REPLACE PACKAGE PK_InsercionDatos IS
	PROCEDURE InsertarInformacion;
END PK_InsercionDatos;

CREATE OR REPLACE PACKAGE BODY PK_InsercionDatos IS
	PROCEDURE InsertarInformacion IS
		BEGIN
			INSERT INTO SOCIO VALUES('12345546-6', 'Jorge López', 'alamos 1234', 7456784);
			INSERT INTO SOCIO VALUES('15346646-8', 'Ana Rojas', 'Los paltos 33', 672484);
			INSERT INTO SOCIO VALUES('10365789-2', 'Felipe Fuentes', 'Ecuador 25678', 3184336);
			INSERT INTO SOCIO VALUES('8456782-7', 'José Miranda', 'Paris 66', 778654);
			INSERT INTO PELICULA VALUES('TE 01', 'El exorcista', 'terror');
			INSERT INTO PELICULA VALUES('AC 03', 'XMEN 3', 'acción');
			INSERT INTO ARRIENDO VALUES('12345546-6', 'TE 01', '15/04/2011', '20/04/2011');
			INSERT INTO ARRIENDO VALUES('12345546-6', 'TE 01', '15/04/2011', '20/04/2011');

		END InsertarInformacion;
END PK_InsercionDatos;

BEGIN
PK_InsercionDatos.InsertarInformacion;
END;

select * from arriendo;

/*2*/

CREATE OR REPLACE PACKAGE PK_ej2 IS
	PROCEDURE BuscarPeliculaPorCodigo(iCodigoPelicuala pelicula.codigo%TYPE);
	FUNCTION BuscarPeliculaPorFecha(iFechArriendo arriendo.fecha_inicio%TYPE) RETURN VARCHAR2;
	PROCEDURE BuscarTelefonoDireccionPorRut(iRutSocio socio.rut%TYPE);
	FUNCTION BuscarNombrePorRut(iRutSocio socio.rut%TYPE) RETURN VARCHAR2;
END PK_ej2;

CREATE OR REPLACE PACKAGE BODY PK_ej2 IS

	PROCEDURE BuscarPeliculaPorCodigo(iCodigoPelicuala pelicula.codigo%TYPE) IS
	v_NombPelicula pelicula.nombre%TYPE;

		BEGIN
			SELECT pelicula.nombre INTO v_NombPelicula FROM pelicula WHERE pelicula.codigo=iCodigoPelicuala;
			DBMS_OUTPUT.PUT_LINE('El nombre de la pelicula de codigo "' ||iCodigoPelicuala ||'" es: ' ||v_NombPelicula);

		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				DBMS_OUTPUT.PUT_LINE('El codigo no existe');
	END BuscarPeliculaPorCodigo;



	FUNCTION BuscarPeliculaPorFecha(iFechArriendo arriendo.fecha_inicio%TYPE) RETURN VARCHAR2 AS var VARCHAR2(100);
		BEGIN

			SELECT  DISTINCT(pelicula.nombre)INTO var FROM pelicula
			JOIN arriendo USING(codigo)
			WHERE fecha_inicio=iFechArriendo;

			RETURN var;

		EXCEPTION
			WHEN NO_DATA_FOUND THEN
            	var:='No existen peliculas en para esa fecha de arriendo';
            	RETURN var;

            WHEN TOO_MANY_ROWS THEN
                var:='ERROR: Hay mas de una salida';
            	RETURN var;
	END BuscarPeliculaPorFecha;

	PROCEDURE BuscarTelefonoDireccionPorRut(iRutSocio socio.rut%TYPE) IS

		TYPE  rDatos IS RECORD(
			telefono socio.telefono%TYPE,
			direccion socio.direccion%TYPE		
			);
		datos rDatos;

		BEGIN
			SELECT telefono, direccion INTO datos FROM socio WHERE rut=iRutSocio;
			DBMS_OUTPUT.PUT_LINE('Para el socio de rut '||iRutSocio);
			DBMS_OUTPUT.PUT_LINE('El telefono es: '||datos.telefono);
			DBMS_OUTPUT.PUT_LINE('La direccion es: ' ||datos.direccion);

		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				DBMS_OUTPUT.PUT_LINE('No existen socios con ese rut');

	END BuscarTelefonoDireccionPorRut;

	FUNCTION BuscarNombrePorRut(iRutSocio socio.rut%TYPE) RETURN VARCHAR2 AS var socio.nombre%TYPE;
		BEGIN 
			SELECT nombre INTO var FROM socio WHERE rut=iRutSocio;
			RETURN var;

		EXCEPTION
			WHEN NO_DATA_FOUND THEN
			 var:='No existen socios con ese rut';
       return var;			 

	END BuscarNombrePorRut;

END PK_ej2;





  BEGIN
 	 DBMS_OUTPUT.PUT_LINE(PK_ej2.BuscarPeliculaPorFecha('15/04/2011'));
  END;

--EJERCICIO 2
-------------------------------------------------------------------------------------------------------------------------------
DROP TABLE asignacion;
DROP TABLE edificio;
DROP TABLE empleado;

CREATE TABLE empleado (
	num_emp int, CONSTRAINT num_emp_pk PRIMARY KEY(num_emp),
	nombre varchar2(20),
	tarifa_hora int,
	profesion varchar2(20)
	);

CREATE TABLE edificio(
	num_edi int, CONSTRAINT num_edi PRIMARY KEY (num_edi),
	direccion varchar2(30),
	tipo varchar2(20),
	nivel varchar2(5)
	);

CREATE TABLE asignacion(
	num_edi int, CONSTRAINT num_edi_fk FOREIGN KEY (num_edi)REFERENCES edificio(num_edi),
	num_emp int, CONSTRAINT num_emp_fk FOREIGN KEY (num_emp)REFERENCES empleado(num_emp),
	fecha_ini varchar2(20),
	num_dias int
	);



CREATE OR REPLACE PACKAGE PK_InsertDatos IS
	PROCEDURE InsertarDatos;
END PK_InsertDatos;

CREATE OR REPLACE PACKAGE BODY PK_InsertDatos IS

	PROCEDURE InsertarDatos IS
		BEGIN
			INSERT INTO empleado VALUES(1235, 'Mario Pérez',3000,'Eletricista');
			INSERT INTO empleado VALUES(1412, 'Carlos García', 2500, 'Fontanero');
			INSERT INTO empleado VALUES(2920, 'Ricardo Gómez', 2800, 'Carpintero');
			INSERT INTO empleado VALUES(3231, 'Pablo Morán', 2300, 'Pintor');
			INSERT INTO empleado VALUES(1520, 'Hugo Fuentes', 2500, 'Fontanero');
			INSERT INTO empleado VALUES(1311, 'Cristian Barrera', 3500, 'Eletricista');
			INSERT INTO empleado VALUES(3001, 'Álvaro Méndez', 2300, 'Pintor');

			INSERT INTO edificio VALUES(1, 'Álamos 23', 'Oficina', 'A');
			INSERT INTO edificio VALUES(2, 'Los Alpes 455', 'Tienda', 'B');
			INSERT INTO edificio VALUES(3, 'San Andrés 56', 'Vivienda', 'A');

			INSERT INTO asignacion VALUES(1, 1235, '20/10/2006', 30);
			INSERT INTO asignacion VALUES(2, 1311, '22/10/2005', 65);
			INSERT INTO asignacion VALUES(1, 2920, '18/10/2007', 17);
			INSERT INTO asignacion VALUES(2, 1412, '17/10/2006', 25);
			INSERT INTO asignacion VALUES(3, 1520, '20/10/2007', 14);
			INSERT INTO asignacion VALUES(2, 3231, '14/10/2006', 12);
			INSERT INTO asignacion VALUES(3, 3001, '18/10/2007', 7);


	END InsertarDatos;



END PK_InsertDatos;


/*2*/

CREATE OR REPLACE PACKAGE PK_ej2 IS
	FUNCTION BuscarProfesionPorNombre(iNombreEmpleado empleado.nombre%TYPE) RETURN VARCHAR2;
	FUNCTION BuscrFechaAsignPorNumEmp(iNumEmp asignacion.num_emp%TYPE) RETURN VARCHAR2;
END PK_ej2;

CREATE OR REPLACE PACKAGE BODY PK_ej2 IS

	FUNCTION BuscarProfesionPorNombre(iNombreEmpleado empleado.nombre%TYPE) RETURN VARCHAR2 AS var varchar2(100);
    BEGIN
      SELECT profesion INTO var FROM empleado WHERE nombre=iNombreEmpleado;
      return var;

      EXCEPTION
      	WHEN NO_DATA_FOUND THEN
          var:='No se encuentra el empelado';
          return var;
	END BuscarProfesionPorNombre;


	FUNCTION BuscrFechaAsignPorNumEmp(iNumEmp asignacion.num_emp%TYPE) RETURN VARCHAR2 AS var VARCHAR2(100);
		BEGIN
			SELECT fecha_ini INTO var FROM asignacion WHERE num_emp=iNumEmp;
			return var;

		EXCEPTION
      		WHEN NO_DATA_FOUND THEN
        		var:='No se encuentra fecha de asignacion para ese numero de empleado';
        		return var;
	END BuscrFechaAsignPorNumEmp;

END PK_ej2;


CREATE OR REPLACE PROCEDURE 12_2_C(iNumEmp) IS
	v_nombreEmpelado empleado.nombre%TYPE;

	BEGIN
		SELECT nombre INTP v_nombreEmpelado FROM empleado WHERE num_emp=iNumEmp;

		DBMS_OUTPUT.PUT_LINE('La profesion del empleado es: '||PK_ej2.BuscarProfesionPorNombre(v_nombreEmpelado));
		DBMS_OUTPUT.PUT_LINE('La fecha de asignacion del empleado es : ' ||PK_ej2.BuscrFechaAsignPorNumEmp(iNumEmp));
END;


CREATE OR REPLACE PROCEDURE ej12_2_c(iNumEmp empleado.num_emp%TYPE) IS
	v_nombreEmpelado empleado.nombre%TYPE;

	BEGIN
		SELECT nombre INTO v_nombreEmpelado FROM empleado WHERE num_emp=iNumEmp;

		DBMS_OUTPUT.PUT_LINE('La profesion del empleado es: '||PK_ej2.BuscarProfesionPorNombre(v_nombreEmpelado));
		DBMS_OUTPUT.PUT_LINE('La fecha de asignacion del empleado es : ' ||PK_ej2.BuscrFechaAsignPorNumEmp(iNumEmp));
    
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encuentra el empleado con ese numero');
END;
  
BEGIN
	ej12_2_c(1235);
END;

/*3*/
CREATE OR REPLACE PACKAGE PK_guia12_2_3 IS
	CURSOR cNombEmpleados IS SELECT nombre FROM empleado;
	NombEmpleados cNombEmpleados%ROWTYPE;
	PROCEDURE MostrarNombEmpleados;


    CURSOR cDireccionEdificio(d edificio.num_edi%TYPE) IS SELECT direccion FROM edificio WHERE num_edi=d;
    DireccionEdificio cDireccionEdificio%ROWTYPE;
    PROCEDURE ActualizarDireccionEdificio(antiguo VARCHAR2, nuevo VARCHAR2);


END PK_guia12_2_3;



CREATE OR REPLACE PACKAGE BODY PK_guia12_2_3 IS

	PROCEDURE MostrarNombEmpleados IS
		BEGIN
			FOR NombEmpleados IN cNombEmpleados
				LOOP			
					DBMS_OUTPUT.PUT_LINE(NombEmpleados.nombre);
				END LOOP;
	END MostrarNombEmpleados;

	PROCEDURE ActualizarDireccionEdificio(antiguo VARCHAR2, nuevo VARCHAR2) IS
      
    	v_numEdif number;
    
		BEGIN
    		SELECT num_edi INTO v_numEdif FROM edificio WHERE direccion=antiguo;
			UPDATE edificio SET direccion = nuevo WHERE direccion = antiguo;
        	FOR DireccionEdificio IN cDireccionEdificio(v_numEdif)
        		LOOP
          			DBMS_OUTPUT.PUT_LINE(DireccionEdificio.direccion);
        		END LOOP;

	END ActualizarDireccionEdificio;

END PK_guia12_2_3;



CREATE OR REPLACE PROCEDURE(num int, nombNuevo varchar2) ad IS
	CURSOR c1 IS SELECT num_edif FROM edificio;
	var c1%rowtype;

	BEGIN
		UPDATE edificio
			SET direccion=nombNuevo WHERE num_edif=num;

END;














/*4*/

CREATE OR REPLACE PACKAGE PK_guia12_2_4 IS
	FUNCTION sumTarifasHora RETURN INT;
	FUNCTION avgTarifasHora RETURN INT;
	FUNCTION maxTarifasHora RETURN INT;
	FUNCTION minTarifasHora RETURN INT;
	CURSOR C1
	CURSOR c2


END PK_guia12_2_4;

CREATE OR REPLACE PACKAGE BODY PK_guia12_2_4 IS

	FUNCTION sumTarifasHora RETURN INT AS var INT;
		SELECT SUM(tarifa_hora) INTO var FROM empleado;
		return var;
	END SumTarifasHora;

	FUNCTION avgTarifasHora RETURN INT AS var INT;
		SELECT AVG(tarifa_hora) INTO var FROM empleado;
		return var;
	END avgTarifasHora;

	FUNCTION maxTarifasHora RETURN INT AS var INT;
		SELECT MAX(tarifa_hora) INTO var FROM empleado;
		return var;
	END maxTarifasHora;

	FUNCTION minTarifasHora RETURN INT AS var INT;
		SELECT MIN(tarifa_hora) INTO var FROM empleado;
		return var;
	END minTarifasHora;

	PROCEDURE 

END PK_guia12_2_4;
	



	














