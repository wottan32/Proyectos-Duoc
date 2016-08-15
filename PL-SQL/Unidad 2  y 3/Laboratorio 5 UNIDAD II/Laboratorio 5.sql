--EJERCICIO 1
---------------------------------------

CREATE TABLE cliente (
	rut VARCHAR2(15) PRIMARY KEY,
	nombre VARCHAR2(50), 
	direccion VARCHAR2(30), 
	telefono VARCHAR2(12)
	);
 
CREATE TABLE cuenta (
	numero NUMBER PRIMARY KEY,
	saldo INT, tipo VARCHAR2(20), rut VARCHAR2(15),
	foreign KEY(rut) REFERENCES cliente(rut)
	);

BEGIN

	INSERT INTO cliente VALUES('12564890-0','Julio Vera','Las cruces 567','6789889');
	INSERT INTO cliente VALUES('11564534-8','Carlos Guzmán','El monte 4300',NULL);
	INSERT INTO cliente VALUES('10878654-4','María Fierro','La reina 556',NULL);
                                                                                                 

	INSERT INTO cuenta VALUES(102030,50000,	'corriente','11564534-8');
	INSERT INTO cuenta VALUES(607090,63000,	'corriente','10878654-4');
	INSERT INTO cuenta VALUES(809050,0,'ahorro','11564534-8');
	INSERT INTO cuenta VALUES(507080,7800,'corriente','12564890-0');
	INSERT INTO cuenta VALUES(408070,23000,'ahorro','12564890-0');
END;

set serveroutput on;

/*1.- Crear un bloque con un cursor explícito que muestra todos los nombres de los clientes.*/

DECLARE
	CURSOR nombres IS SELECT nombre FROM cliente;
	var1 cliente.nombre%TYPE;
BEGIN
	DBMS_OUTPUT.PUT_LINE('-------------------------------');
	DBMS_OUTPUT.PUT_LINE('Los nombres de los clientes son:');
	DBMS_OUTPUT.PUT_LINE('-------------------------------');
	OPEN nombres;
		FETCH nombres INTO var1;
		WHILE nombres%FOUND
			LOOP				
				DBMS_OUTPUT.PUT_LINE(var1);
				FETCH nombres INTO var1;
			END LOOP;
	CLOSE nombres;
    DBMS_OUTPUT.PUT_LINE('-------------------------------');
END;

/*2.- Crear un bloque que borre al cliente Carlos Guzmán, luego con un cursor explícito mostrar 
todos los nombres y direcciones de los clientes que quedan registrados en la base de datos.*/

DECLARE
	CURSOR nombres IS SELECT nombre FROM cliente;
	var1 cliente.nombre%TYPE;
	v_rut cliente.rut%TYPE;
BEGIN
	SELECT rut INTO v_rut FROM cliente WHERE nombre='Carlos Guzmán';
	DELETE cuenta WHERE cuenta.rut=v_rut;
	DELETE cliente WHERE cliente.rut=v_rut; 

	DBMS_OUTPUT.PUT_LINE('-------------------------------');
	DBMS_OUTPUT.PUT_LINE('Los nombres de los clientes son:');
	DBMS_OUTPUT.PUT_LINE('-------------------------------');
	OPEN nombres;
		FETCH nombres INTO var1;
		WHILE nombres%FOUND
			LOOP				
				DBMS_OUTPUT.PUT_LINE(var1);
				FETCH nombres INTO var1;
			END LOOP;
	CLOSE nombres;
    DBMS_OUTPUT.PUT_LINE('-------------------------------');
END;

/*3.- Crear un bloque que actualice el saldo de los clientes sumando el 10% a cada uno, luego 
con un cursor explícito mostrar los nombres y los nuevos saldos de los clientes*/

DECLARE
	CURSOR c1 IS SELECT nombre, SUM(saldo) AS saldo FROM cliente
	JOIN cuenta USING(rut)
	GROUP BY nombre;
	
  var1 c1%ROWTYPE;
  
BEGIN
	UPDATE cuenta SET saldo =saldo*1.1;

	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Los nombres y los saldos de los clientes son:');
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP				
				DBMS_OUTPUT.PUT_LINE('Nombre: ' ||var1.nombre ||' ' ||var1.saldo);
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	
END;

/*4. Crear un bloque con un cursor explícito que muestre todos los nombres y saldos de los 
clientes con cuenta de tipo corriente.*/

DECLARE
	CURSOR c1 IS SELECT nombre, SUM(saldo) AS saldo FROM cliente
	JOIN cuenta USING(rut)
	WHERE cuenta.tipo='corriente'
	GROUP BY nombre;
	
  var1 c1%ROWTYPE;
  
BEGIN

	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Los nombres y los saldos de los clientes con ');
	DBMS_OUTPUT.PUT_LINE('cuenta corriente son						   ');
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP				
				DBMS_OUTPUT.PUT_LINE('Nombre: ' ||var1.nombre ||' Saldo: $' ||var1.saldo);
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	
END;

--EJERCICIO 2
---------------------------------------
CREATE TABLE cliente(
	codigo INT CONSTRAINT codigo_pk PRIMARY KEY,
	nombre VARCHAR2(50) CONSTRAINT nombre_nn NOT NULL,
	direccion VARCHAR2(50) CONSTRAINT direccion_nn NOT NULL,
	telefono INT CONSTRAINT telefono_chk CHECK (telefono>0)
	);

CREATE TABLE vehiculo(
	patente VARCHAR2(10) CONSTRAINT patente_pk PRIMARY KEY,
	marca VARCHAR2(20) CONSTRAINT marca_nn NOT NULL,
	modelo VARCHAR2(20) CONSTRAINT modelo_nn NOT NULL,
	fecha_arriendo DATE CONSTRAINT fecha_ar_chk CHECK (TO_DATE(fecha_arriendo,'dd-mm-yyyy')>TO_DATE('01/01/0001','dd-mm-yyyy')),
	valor_por_dia NUMBER CONSTRAINT vpd_chhk CHECK (valor_por_dia>0),
	rut INT
	);

ALTER TABLE vehiculo ADD CONSTRAINT rut_fk FOREIGN KEY(rut) REFERENCES cliente(codigo);

BEGIN
	INSERT INTO cliente VALUES(1133455,'Ana Mora','Las morros 56',86634234);
	INSERT INTO cliente VALUES(2244565,'Carlos Fredes','Las torres 560',98765345);
	INSERT INTO cliente VALUES(6677545,'Marta Cardenas','Portales 6700',76545345);

	INSERT INTO vehiculo VALUES('AM-5678','Fiat','Palio',TO_DATE('05/03/2011','dd-mm-yyyy'),20000,1133455);
	INSERT INTO vehiculo VALUES('BP-9871','Mazda','2 SPORT',TO_DATE('21/03/2011','dd-mm-yyyy'),25000,6677545);
	INSERT INTO vehiculo VALUES('AZ-7098','Nissan','Sentra 2.0',TO_DATE('01/04/2011','dd-mm-yyyy'),27000,2244565);
	INSERT INTO vehiculo VALUES('MN-7085','Mazda','3 SEDAN',TO_DATE('03/04/2011','dd-mm-yyyy'),30000,6677545);
	INSERT INTO vehiculo VALUES('TS-9843','Nissan','TIIDA Sport',TO_DATE('05/04/2011','dd-mm-yyyy'),32000,1133455);
END;

/*1. Cree un bloque con un cursor explícito que muestre el rut y nombre de todos los clientes
 que tiene vehículos de marca Mazda.*/
 DECLARE
 	CURSOR c1 IS SELECT DISTINCT(nombre), rut FROM cliente
 	JOIN vehiculo ON (codigo=rut)
 	where vehiculo.marca='Mazda';

 	var1 c1%ROWTYPE;

 BEGIN
 	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Los nombres y ruts de los clientes con un    ');
	DBMS_OUTPUT.PUT_LINE('vehiculo marca mazda son:					   ');
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP
				DBMS_OUTPUT.PUT_LINE('Nombre: ' ||var1.nombre ||' || Rut: ' ||var1.rut);
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
END;



/*2. Cree un bloque con un cursor explícito que muestra todas las marcas y modelos de los 
vehículos.*/

 DECLARE
 	CURSOR c1 IS SELECT vehiculo.MARCA, vehiculo.MODELO FROM vehiculo;

 	var1 c1%ROWTYPE;

 BEGIN
 	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Las marcas y modelos de los vehiculos son:   ');
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP
				DBMS_OUTPUT.PUT_LINE('Marca: ' ||var1.marca||' || Modelo: ' ||var1.modelo);
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
END;

/*3. Cree un bloque con un cursor explícito que muestre la patente y cuantos días llevan de 
arriendo a cada vehículo a la fecha.*/
 DECLARE
 	CURSOR c1 IS SELECT patente, (trunc(sysdate) - fecha_arriendo) AS diasArriendo FROM vehiculo;

 	var1 c1%ROWTYPE;

 BEGIN
 	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('La patente y sus dias de arriendo son    :   ');
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP
				DBMS_OUTPUT.PUT_LINE('Patente: ' ||var1.patente||' || Dias Arriendo: ' ||var1.diasArriendo);
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
END;

/*4. Cree un bloque con un cursor muestre el nombre y cuanto lleva gastado en arriendo cada cliente.*/


 DECLARE
 	CURSOR c1 IS SELECT nombre, SUM((trunc(sysdate) - fecha_arriendo)*valor_por_dia) AS costoArriendo FROM cliente
 	JOIN vehiculo ON (codigo=rut)
 	group by nombre;
 	
 	var1 c1%ROWTYPE;

 BEGIN
 	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('El nombre del cliente  y el costo de su      ');
	DBMS_OUTPUT.PUT_LINE('arriendo es:							       ');
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP
				DBMS_OUTPUT.PUT_LINE('Nombre: ' ||var1.nombre||' || Costo Arriendo: ' ||var1.costoArriendo);
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
END;

/*5. Crear un bloque que actualice el valor hora diario descontando 5% a cada vehículo, luego
 con un cursor explícito mostrar los marca, modelo y nuevo valor hora.*/

 DECLARE
 	CURSOR c1 IS SELECT marca, modelo, valor_por_dia FROM vehiculo; 	
 	var1 c1%ROWTYPE;

 BEGIN
 	UPDATE vehiculo SET valor_por_dia=valor_por_dia*0.95;

 	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('La marca, modelo y el nuevo costo de los     ');
	DBMS_OUTPUT.PUT_LINE('vehiculos es:							       ');
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP
				DBMS_OUTPUT.PUT_LINE('Marca: ' ||var1.marca||' || Modelo: ' ||var1.modelo ||' || Nuevo valor: $' ||var1.valor_por_dia);
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
END;