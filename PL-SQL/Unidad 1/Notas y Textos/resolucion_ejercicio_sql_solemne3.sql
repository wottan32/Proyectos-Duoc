-- II. DESARROLLO.
-- IMPORTANTE:  TODOS LOS SCRIPTS DEBEN TERMINAR CON ; (PUNTO Y COMA)

--1. CREACION DE LAS TABLAS DEL MODELO CON CONSTRAINTS A TODOS SUS CAMPOS
-- -----------------------------------------------------------------------

-- se crean primero las tablas que no tienen claves foraneas en sus columnas
CREATE TABLE CLIENTE(
  RUT VARCHAR2(50) CONSTRAINT CLIENTE_PK PRIMARY KEY NOT NULL,
  NOMBRE VARCHAR2(50),
  DIRECCION VARCHAR2(40),
  TELEFONO VARCHAR2(12)
);
-- se crean primero las tablas que no tienen claves foraneas en sus columnas
CREATE TABLE AUTOMOVIL(
  PATENTE VARCHAR2(20) CONSTRAINT AUTOMOVIL_PK PRIMARY KEY NOT NULL,
  MARCA VARCHAR2(30),
  MODELO VARCHAR2(30),
  TIPO VARCHAR2(30),
  CARACTERISTICAS VARCHAR2(70)
);
-- luego las que tienen una clave foranea, tener cuidado que la tabla de la clave for�nea este creada
CREATE TABLE ARRIENDO(
  NUMERO INTEGER CONSTRAINT ARRIENDO_PK PRIMARY KEY NOT NULL,
  FECHA_INICIO DATE,
  FECHA_TERMINO DATE,
  PRECIO INTEGER,
   
);

-- luego las que tienen dos claves. Tener cuidado que la tabla de la clave for�nea este creada
CREATE TABLE DETALLE_ARRIENDO(
  ARRIENDO_NUMERO INTEGER CONSTRAINT FK_ARRIENDO REFERENCES ARRIENDO(NUMERO),
  AUTOMOVIL_PATENTE VARCHAR2(20) CONSTRAINT FK_AUTOMOVIL REFERENCES AUTOMOVIL(PATENTE),
  CONSTRAINT PK_DETALLEARRIENDO PRIMARY KEY(ARRIENDO_NUMERO,AUTOMOVIL_PATENTE)
);

--2. CREAR UNA SECUENCIA PARA LA TABLA DE ARRIENDO
-- -----------------------------------------------
CREATE SEQUENCE SEQ_ARRIENDO
INCREMENT BY 1
START WITH 1
MAXVALUE 100000
NOCACHE
NOCYCLE;

-- 3. CREAR DOS FILAS RELACIONALES POR TABLA. EN LA TABLA ARRIENDO DEBE INCLUIR FECHAS CON EL MES DE MARZO
-- -------------------------------------------------------------------------------------------------------
-- INSERTAMOS LOS AUTOMOVILES(CUIDAR REVISAR LOS TAMA�OS Y TIPOS DE LOS CAMPOS)
INSERT INTO AUTOMOVIL VALUES ('PX2025','CHEVROLET','RANGER','AUTOMOVIL','CAMIONETA PICKUP DOBLE CABINA');
INSERT INTO AUTOMOVIL VALUES ('KZ2845','HYUNDAI','NEW SANTA FE','SUV','CAMIONETA SUB DE 3 CORRIDAS ASIENTOS');

-- INSERTAMOS LOS CLIENTES(CUIDAR REVISAR LOS TAMA�OS Y TIPOS DE LOS CAMPOS)
INSERT INTO CLIENTE VALUES ('11111111-1','OSCAR ROJAS','LAS AMERICAS 25 �U�OA SANTIAGO','23232328');
INSERT INTO CLIENTE VALUES ('22222222-2','CARLA BENITEZ','LAS ACACIAS 86 LAS CONDES SANTIAGO','55525252');

-- INSERTAMOS LOS ARRIENDOS. VA EL RUT COMO CLAVE FORANEA(CUIDAR REVISAR LOS TAMA�OS Y TIPOS DE LOS CAMPOS)
INSERT INTO ARRIENDO VALUES (SEQ_ARRIENDO.NEXTVAL, TO_DATE('25-03-2014','DD-MM-YYYY'), TO_DATE('27-03-2014','DD-MM-YYYY'), 65000,'11111111-1');
INSERT INTO ARRIENDO VALUES (SEQ_ARRIENDO.NEXTVAL, TO_DATE('26-03-2014','DD-MM-YYYY'), TO_DATE('27-03-2014','DD-MM-YYYY'), 78500,'22222222-2');

-- COMO NO SABEMOS EL VALOR DE LAS SECUENCIAS,SUPONEMOS QUE SON EL NUMERO 1 y 2 DE LA SECUENCIA DEL ARRIENDO.
-- PATENTES Y NUMEROS DE ARRIENDO DEBEN EXISTIR EN LAS TABLAS RESPECTIVAS, POR ESO SE INSERTAN PRIMERO.
INSERT INTO DETALLE_ARRIENDO VALUES (3, 'PX2025');
INSERT INTO DETALLE_ARRIENDO VALUES (4, 'KZ2845');

--4. CREACION DE LAS SIGUIENTES CONSULTAS: (15pts)
-- ----------------------------------------------------
--a. Mostrar la cantidad de autom�viles registrados en la base de datos.
SELECT * 
FROM AUTOMOVIL;

--b. Mostrar los n�meros de los arriendos realizados en el mes de marzo. 
-- se asume que lo contabilizamos como de marzo, si la fecha de inicio del arriendo ocurre en marzo
SELECT * 
FROM ARRIENDO
WHERE FECHA_INICIO BETWEEN TO_DATE('01-03-2014','DD-MM-YYYY') AND TO_DATE('31-03-2014','DD-MM-YYYY');

--c. Mostrar los precios de los arriendos con un 15% de descuento (VALOR ACTUAL - 15% -> 85%)
SELECT PRECIO*0.85
FROM ARRIENDO;


-- 5. AGREGAR LA COLUMNA EDAD A LA TABLA CLIENTE. (5pts)
-- ------------------------------------------------------
ALTER TABLE CLIENTE ADD EDAD INTEGER DEFAULT NULL;

-- tambi�n es valido
ALTER TABLE CLIENTE ADD EDAD NUMBER(3) DEFAULT NULL;


-- 6. INSERTAR DATOS A LA COLUMNA EDAD 
-- -----------------------------------
UPDATE CLIENTE
SET EDAD = 28
WHERE RUT = '11111111-1';

UPDATE CLIENTE
SET EDAD = 23
WHERE RUT = '22222222-2';

-- 7. ACTUALIZAR EL TELEFONO DE ALGUN CLIENTE
-- ------------------------------------------
UPDATE CLIENTE
SET TELEFONO = 22222222
WHERE RUT = '11111111-1';

-- 8. BORRAR LOS ARRIENDOS CUYO PRECIO SEA MENOR A 50000
-- ------------------------------------------------------
DELETE FROM ARRIENDO
WHERE PRECIO < 50000;