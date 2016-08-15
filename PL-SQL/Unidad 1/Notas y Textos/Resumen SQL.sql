--Creación de tabla con restricciones
-----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE  PRODUCTOS (
codigo integer, CONSTRAINT PK_COD PRIMARY KEY (codigo),
nombre VARCHAR2 (40) CONSTRAINT nom_nn NOT NULL,
descripcion VARCHAR2 (60),
cantidad integer, CONSTRAINT can_chk check (cantidad >0) , 
precio INTEGER, constraint pre_chk check(precio>0)
);


--Insertar datos
-----------------------------------------------------------------------------------------------------------------------------
INSERT INTO PRODUCTOS VALUES (10, 'leche', 'producto lacteo', 50, 500);

--Mostrar toda la info
-----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM PRODUCTOS;

--Ver la estructura de la tabla
-----------------------------------------------------------------------------------------------------------------------------
DESCRIBE PRODUCTOS;

--Agregar una columna a la tabla
-----------------------------------------------------------------------------------------------------------------------------
ALTER TABLE PRODUCTOS ADD proveedor VARCHAR2(40);

--Actualizar informacion en la columna proveedor
-----------------------------------------------------------------------------------------------------------------------------
UPDATE PRODUCTOS SET proveedor = 'soprole'
where codigo=10;

--Eliminar una columna de ka tabla
-----------------------------------------------------------------------------------------------------------------------------
ALTER TABLE PRODUCTOS DROP COLUMN descripcion;

--Agregar una restriccion a la columna proveedor
-----------------------------------------------------------------------------------------------------------------------------
ALTER TABLE PRODUCTOS MODIFY proveedor CONSTRAINT pro_nn NOT NULL;

--Ver las constratins de un usuario
-----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM user_cosntraints;

--modificar el tipo de dato de una columna de una tabla
-----------------------------------------------------------------------------------------------------------------------------
ALTER TABLE PRODUCTOS MODIFY nombre VARCHAR2(60);

--Actualizar la columna precio para que este vacia
-----------------------------------------------------------------------------------------------------------------------------
UPDATE PRODUCTOS 
SET precio =null
WHERE codigo=10;

--Modificar el tipo de dato de la columna precio
-----------------------------------------------------------------------------------------------------------------------------
ALTER TABLE PRODUCTOS MODIFY precio NUMBER(20,0); /*20 DIGITOS ENTEROS, CERO DECIMALES*/

--Borrar una fila de una tabla
-----------------------------------------------------------------------------------------------------------------------------





DELETE FROM PRODUCTOS WHERE codigo=10;

CREATE TABLE CLIENTE (
RUT VARCHAR2(15),
NOMBRE VARCHAR2(50), 
EMAIL VARCHAR2(20),
GENERO VARCHAR2(1),
FECHA_NACIMIENTO DATE,
ESTADO VARCHAR2(1)
);

ALTER TABLE CLIENTE ADD CONSTRAINT RUT_PK PRIMARY KEY(RUT);
ALTER TABLE CLIENTE MODIFY NOMBRE CONSTRAINT NOME_NN NOT NULL;
ALTER TABLE CLIENTE  ADD CONSTRAINT EMAIL_UQ UNIQUE (EMAIL);
ALTER TABLE CLIENTE  MODIFY FECHA_NACIMIENTO CONSTANT FEC_NN NOT NULL;
ALTER TABLE CLIENTE  ADD CONSTRAINT CHK_GENERO CHECK(GENERO IN('M' , 'F'));
ALTER TABLE CLIENTE  ADD CONSTRAINT EST_CHK CHECK(ESTADO IN ('A', 'B'));

--Eliminar una cosntraint
ALTER TABLE CLIENTE DROP CONSTRAINT NOME_NN;

--Deshablilitar una cosntraint
-----------------------------------------------------------------------------------------------------------------------------
ALTER TABLE CLIENTE DISABLE CONSTRAINT FEC_NN;

--Hablilitar una constraint
-----------------------------------------------------------------------------------------------------------------------------
ALTER TABLE CLIENTE ENABLE CONSTRAINT FEC_NN;

--Insertar datos
-----------------------------------------------------------------------------------------------------------------------------
INSERT INTO CLIENTE VALUES ('1433557-0', 'FABIOLA VENEGAS', 'FAB.VENE@GMAIL.COM', 'F', TO_DATE( '10/10/1980' , 'DD/MM/YYY'), 'A' )


