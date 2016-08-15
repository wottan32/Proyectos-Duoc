--EJERCICIO 1
---------------------------------------
DROP TABLE Ventas;

CREATE TABLE ventas(
	numero INT CONSTRAINT numero_pk PRIMARY KEY,
	fecha DATE CONSTRAINT fecha_chk CHECK (fecha>TO_DATE('01/01/0001','dd-mm-yyyy')),
	monto NUMBER CONSTRAINT monto_chk CHECK (monto>0)
);

BEGIN
	INSERT INTO ventas VALUES(1,TO_DATE('04/01/2013','dd-mm-yyyy'),15000);
	INSERT INTO ventas VALUES(2,TO_DATE('01/03/2013','dd-mm-yyyy'),3000);
	INSERT INTO ventas VALUES(3,TO_DATE('24/03/2013','dd-mm-yyyy'),7000);
	INSERT INTO ventas VALUES(4,TO_DATE('13/02/2013','dd-mm-yyyy'),10000);
	INSERT INTO ventas VALUES(5,TO_DATE('04/01/2013','dd-mm-yyyy'),11000);
END;


/*Habilita la salida en sqldeveloper*/
set serveroutput on;

/*
1. Crear un bloque PL/SQL que muestre el mensaje “Ventas Insuficientes” 
si la cantidad de ventas realizadas en una determinada fecha es menor a 3, 
en caso contrario deberá mostrar el mensaje “Ventas suficientes”
*/

--No requiere un if, pero aun asi, lo agrege para contar con una salida mas limpia

DECLARE
  v_numVentas NUMBER(10);
  v_fecha VARCHAR(10) :='04/01/13'; --El sistema hace la comparacion automatica entre TO_DATE y VARCHAR, pero debe estar escrita con el  formato mm/dd/yyyy, en este caso, se hace referencia a la venta nª 5 (no la Nª1) || La otra forma, seria definir esta variable directamente como TO_DATE

BEGIN 
  SELECT count(numero) INTO v_numVentas FROM ventas WHERE fecha=v_fecha;

  IF v_numVentas<3 THEN   
      DBMS_OUTPUT.PUT_LINE('Ventas Insuficinetes (' ||v_numVentas ||')');
    ELSE
    DBMS_OUTPUT.PUT_LINE('Ventas Sufucuentes (' ||v_numVentas ||')');
  END IF;
  
END;

/*
2. Crear un bloque PL/SQL que muestre el mensaje “Montos Insuficientes” si la suma 
de los montos de una determinada fecha es menor a 50000, en caso contrario deberá 
mostrar el mensaje “Montos Suficientes”.
*/

DECLARE
  v_sumMontos NUMBER(10);
  v_fecha VARCHAR(10) :='04/01/13';

BEGIN 
  SELECT SUM(monto) INTO v_sumMontos FROM ventas WHERE fecha=v_fecha;

  IF v_sumMontos<50000 THEN   
      DBMS_OUTPUT.PUT_LINE('Montos Insuficientes (' ||v_sumMontos ||')');
    ELSE
    DBMS_OUTPUT.PUT_LINE('Montos Suficientes (' ||v_sumMontos ||')');
  END IF;
  
END;

/*
3. Crear un bloque PL/SQL que muestre el monto de la venta. Si la venta es mayor 
a 10000, deberá mostrar el mensaje “VENTA MAYOR BAJA”. en caso contrario deberá 
mostrar el mensaje “VENTA MAYOR NORMAL”.
*/

DECLARE
  v_Monto NUMBER(10);
  v_numVenta NUMBER(10) := 1;


BEGIN 
  SELECT monto INTO v_Monto FROM ventas WHERE numero=v_numVenta;

  IF v_Monto>10000 THEN   
      DBMS_OUTPUT.PUT_LINE('Venta Mayor Baja (' ||v_Monto ||')');
    ELSE
    DBMS_OUTPUT.PUT_LINE('Venta Mayor Normal (' ||v_Monto ||')');
  END IF;
  
END;

/*
4. Crear un bloque PL/SQL que muestre el promedio de montos dentro de un rango 
de fecha (utilizar operador between).
*/

DECLARE
  v_fecha1 VARCHAR2(10):= '04/01/2013';
  v_fecha2 VARCHAR2(10):= '13/02/2013';
  v_PromMontos NUMBER(10);



BEGIN 
  SELECT AVG(monto) INTO v_PromMontos FROM ventas WHERE fecha BETWEEN v_fecha1 AND v_fecha2;
  DBMS_OUTPUT.PUT_LINE('El Promedio de las ventas es : ' ||v_PromMontos);
 
END;

--EJERCICIO 2
---------------------------------------------
DROP TABLE Producto;

CREATE TABLE producto(
	codprod VARCHAR2(10) CONSTRAINT codprod_pk PRIMARY KEY,
	nomprod VARCHAR2(50) CONSTRAINT nomprod_nn NOT NULL,
	marca VARCHAR2(50) CONSTRAINT marca_nn NOT NULL,
	precio NUMBER CONSTRAINT precio_chk CHECK (precio>0)
);

BEGIN
	INSERT INTO producto VALUES ('101','mantequilla','soprole',900);
	INSERT INTO producto VALUES ('201','aceite','miraflores',1250);
	INSERT INTO producto VALUES ('301','leche','soprole',470);
	INSERT INTO producto VALUES ('401','arroz','Miraflores',450);
END;

/*
1. Crear bloque PL/SQL que muestre el precio del producto arroz; luego borré el producto 
arroz de la tabla Producto por el código.
*/

DECLARE
	v_precioProducto NUMBER;
	v_nombreProducto VARCHAR2(50) :='arroz';
	v_codProducto  VARCHAR2(10);

BEGIN
	SELECT precio, codprod INTO v_precioProducto, v_codProducto FROM producto WHERE nomprod=v_nombreProducto;
	DBMS_OUTPUT.PUT_LINE('El precio del producto "' ||v_nombreProducto ||'" es :' ||v_precioProducto);

	DELETE FROM producto WHERE codprod=v_codProducto;
	DBMS_OUTPUT.PUT_LINE('Se ha borrado el producto "' ||v_nombreProducto ||'" cuyo codigo era :' ||v_codProducto );
END;

/*
2. Crear un bloque PL/SQL que muestre el promedio, suma máximo y mínimo de los productos 
registrados en la tabla productos.
*/
DECLARE
	v_avgPrecio NUMBER(10);
	v_sumPrecio NUMBER(10);
	v_maxPrecio NUMBER(10);
	v_minPrecio NUMBER(10);

BEGIN
	SELECT  AVG(precio), SUM(precio), MAX(precio), MIN(precio) INTO v_avgPrecio, v_sumPrecio, v_maxPrecio, v_minPrecio FROM producto;
	
	DBMS_OUTPUT.PUT_LINE('El Promedio de los precios es: ' ||v_avgPrecio);
	DBMS_OUTPUT.PUT_LINE('La suma de los precios es: ' ||v_sumPrecio);
	DBMS_OUTPUT.PUT_LINE('El Precio mayor es: ' ||v_maxPrecio);
	DBMS_OUTPUT.PUT_LINE('El precio menor es: ' ||v_minPrecio);
	
END;

/*
3. Crear bloque PL/SQL que por medio del código de producto actualice su precio según las siguientes indicaciones. 
Si el producto tiene un precio menor a 500 pesos, su precio debe ser aumentado en 50 pesos. Si está entre 500 y 1000 
pesos su precio subirá 20 pesos y si excede los 1000 pesos., el precio del producto debe subir 25 pesos. Si el precio 
fuese NULL, el aumento sería 0.
*/


DECLARE
	v_codProducto  VARCHAR2(10) := '101';
	v_precioProducto NUMBER;

BEGIN
	SELECT precio INTO v_precioProducto FROM producto WHERE codprod=v_codProducto;
	
	IF v_precioProducto<500 THEN
		UPDATE producto
		SET precio=v_precioProducto+50
		WHERE codprod=v_codProducto;
		DBMS_OUTPUT.PUT_LINE('El precio de "' ||v_codProducto  ||'" aumento 50"');
		
		ELSIF v_precioProducto>=500 AND  v_precioProducto<=1000 THEN
			UPDATE producto
			SET precio=v_precioProducto+20
			WHERE codprod=v_codProducto;
			DBMS_OUTPUT.PUT_LINE('El precio de "' ||v_codProducto  ||'" aumento 20"');
				
		ELSIF v_precioProducto>1000 THEN
			UPDATE producto
			SET precio=v_precioProducto+25
			WHERE codprod=v_codProducto;
			DBMS_OUTPUT.PUT_LINE('El precio de "' ||v_codProducto  ||'" aumento 25"');
							
		ELSIF v_precioProducto IS NULL THEN
			UPDATE producto
			SET precio=0
			WHERE codprod=v_codProducto;
			DBMS_OUTPUT.PUT_LINE('El precio de "' ||v_codProducto  ||'" aumento 0"');
	
	END IF;
	
END;

-- EJERCICIO 3
--------------------------------------
DROP TABLE Deposito;
DROP TABLE cajero;
DROP TABLE Cuenta;
DROP TABLE cliente;

CREATE TABLE cliente(
	rut VARCHAR2(15) CONSTRAINT rut_pk PRIMARY KEY,
	nombre VARCHAR2(50) CONSTRAINT nombre_nn NOT NULL,
	direccion VARCHAR2(30) CONSTRAINT direccion_nn NOT NULL,
	comuna VARCHAR2(20) CONSTRAINT comuna_nn NOT NULL,
	telefono INT CONSTRAINT tel_nn NOT NULL
);

CREATE TABLE cuenta( 
	numeroc INT CONSTRAINT numeroc_pk PRIMARY KEY,
	tipo VARCHAR2(15) CONSTRAINT tipo_nn NOT NULL,
	saldo NUMBER CONSTRAINT saldo_chk CHECK (saldo>0),
	rut VARCHAR2(15),
	CONSTRAINT rut_fk foreign KEY(rut) REFERENCES cliente(rut)
);

CREATE TABLE cajero (
	codigoc INT CONSTRAINT codigoc_pk PRIMARY KEY,
	nombre VARCHAR2(50) CONSTRAINT nombrec_nn NOT NULL,
	direccion VARCHAR2(30) CONSTRAINT direccionc_nn NOT NULL,
	telefono INT CONSTRAINT telc_nn NOT NULL
);

CREATE TABLE deposito(
	numerod INT CONSTRAINT numerod_pk PRIMARY KEY,
	cantidad NUMBER CONSTRAINT cantidad_chk CHECK (cantidad>0),
	numeroc INT,
	codigoc INT,
	CONSTRAINT numeroc_fkd foreign KEY(numeroc) REFERENCES cuenta(numeroc),
	CONSTRAINT codigoc_fkd foreign KEY(codigoc) REFERENCES cajero(codigoc)
);

BEGIN

	INSERT INTO cliente VALUES('10114567','Antonio Vera','Ecuador 456','La Florida','6543234');
	INSERT INTO cliente VALUES('9867543','Jorge Pérez','Salamanca 486','La Florida','7654345');
	INSERT INTO cliente VALUES('8456567','Ana muñoz','San Francisco 77','Macul','8325678');
	INSERT INTO cliente VALUES('12345654','Ricardo Jerez','San Juan 44','La Florida','6753456');

	INSERT INTO cuenta VALUES('10111111','corriente',700000,'10114567');
	INSERT INTO cuenta VALUES('10123333','ahorro',545000,'8456567');
	INSERT INTO cuenta VALUES('10134444','corriente',890000,'9867543');
	INSERT INTO cuenta VALUES('10145555','ahorro',450000,'10114567');
	INSERT INTO cuenta VALUES('10157777','ahorro',370000,'12345654');

	INSERT INTO cajero VALUES('10','Alejandro Cofre','Porto Seguro 88','5674343');
	INSERT INTO cajero VALUES('20','Mauricio Yañez','Los presidentes 345','6754323');
	INSERT INTO cajero VALUES('30','Alejandra Vera','Los Sauces 55','7654343');
	INSERT INTO cajero VALUES('40','Claudia Perez','Alpes 345','8643245');

	INSERT INTO deposito VALUES(10,54000,'10111111','30');
	INSERT INTO deposito VALUES(11,100000,'10123333','10');
	INSERT INTO deposito VALUES(12,75000,'10157777','30');
	INSERT INTO deposito VALUES(13,95000,'10123333','20');
	INSERT INTO deposito VALUES(14,20000,'10145555','40');


END;

/*
Dada las tablas que está en el archivo Tablas Ejercicios que se encuentra en la 
Carpeta Laboratorio II, realizar los siguientes bloques:
/*/

/*1. Crear un bloque PL/SQL que muestre la cantidad y promedio de los depósitos 
realizados por Jorge Pérez.
*/

DECLARE
	v_nombre cliente.nombre%TYPE := 'Jorge Pérez';
	v_cantidDepoaitos NUMBER :=0;
	v_promDepositos NUMBER;

BEGIN
	SELECT  count(numerod), avg(deposito.cantidad) INTO v_cantidDepoaitos, v_promDepositos FROM deposito
	JOIN cuenta USING (numeroc)
	JOIN cliente USING (rut)	
	WHERE cliente.nombre=v_nombre;

	IF v_cantidDepoaitos=0 THEN
		DBMS_OUTPUT.PUT_LINE('El cliente no registra depósitos');

		ELSE
		DBMS_OUTPUT.PUT_LINE('El cliente registra ' ||v_cantidDepoaitos ||' depósitos, cuyo promedio es de $' ||v_promDepositos);

	END IF;
  
  END;


/*2. Crear bloque PL/SQL que muestre el nombre del cajero que atendió al cliente 
Jorge Pérez.
*/

DECLARE

	v_nombCliente cliente.nombre%TYPE :='Jorge Pérez';
	v_nombCajero cajero.nombre%TYPE;

BEGIN
	SELECT cajero.nombre INTO v_nombCajero FROM cajero
	JOIN deposito USING (codigoc)
	JOIN cuenta USING (numeroc)
	JOIN cliente USING (rut)
	WHERE cliente.nombre=v_nombCliente;
	DBMS_OUTPUT.PUT_LINE('El nombre del cajero es ' ||v_nombCajero);
END;





/*3. Crear un bloque PL/SQL que muestre el número, tipo y saldo de la cuenta de 
Ricardo Jerez.
*/

DECLARE
	v_nombre cliente.nombre%TYPE := 'Ricardo Jerez';
	v_numeroC cuenta.numeroc%TYPE;
	v_tipo cuenta.tipo%TYPE;
	v_saldo cuenta.saldo%TYPE;

BEGIN
	SELECT numeroc, tipo, saldo INTO v_numeroC, v_tipo, v_saldo FROM cuenta
	JOIN cliente using (rut)
	where cliente.nombre='Ricardo Jerez';

	DBMS_OUTPUT.PUT_LINE('El numero de la cuenta es ' ||v_numeroC);
	DBMS_OUTPUT.PUT_LINE('El tipo de cuenta es ' ||v_tipo);
	DBMS_OUTPUT.PUT_LINE('El saldo de la cuenta es ' ||v_saldo);

END;



/*4. Crear un bloque PL/SQL que muestre el promedio, número y tipo de cuenta de 
los depósitos hechos por Ana Muñoz.
*/

declare
	promDeposito Number;
	NumbCuenta Number;
	TipoCuenta varchar2(20);

begin
	select avg(deposito.cantidad)
	into promDeposito
	from deposito join cuenta using(numeroc) join cliente using(rut)
	where cliente.nombre = 'Ana muñoz';
	
	select cuenta.numeroc, cuenta.tipo 
	into  NumbCuenta, TipoCuenta
	from cliente  join cuenta using(rut)
	where cliente.nombre = 'Ana muñoz';
	
	
	dbms_output.put_line('Respuesta 4 Ejercicio 3');
	dbms_output.put_line(' ');
	dbms_output.put_line('Ana Muñoz');
	dbms_output.put_line(' ');
	dbms_output.put_line('Promedio: ' || promDeposito);
	dbms_output.put_line('Numero de Deposito: ' || NumbCuenta);
	dbms_output.put_line('Tipo de Cuenta: ' || TipoCuenta);
end
