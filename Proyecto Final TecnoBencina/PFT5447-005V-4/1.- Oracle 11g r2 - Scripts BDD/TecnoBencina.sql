﻿/*
CREATED: 08-04-2016
MODIFIED: 24-05-2016
MODEL: ORACLE 11G RELEASE 2
DATABASE: ORACLE 11G RELEASE 2
*/


-- CREATE TABLES SECTION -------------------------------------------------

-- TABLE VENTA

CREATE TABLE VENTA(
  ID INTEGER NOT NULL,
  COMBUSTIBLE_ID INTEGER NOT NULL,
  MONTO INTEGER NOT NULL,
  LITROS NUMBER NOT NULL,
  FECHA DATE NOT NULL,
  ESTADO VARCHAR2(30 ) NOT NULL,
  USUARIO_RUT INTEGER NOT NULL,
  SURTIDOR_ID INTEGER NOT NULL,
  VALE_ID INTEGER,
  ANULACION_ID INTEGER,
  BENEFICIARIO_ID INTEGER
)
/

-- CREATE INDEXES FOR TABLE VENTA

CREATE INDEX IX_RELATIONSHIP2 ON VENTA (COMBUSTIBLE_ID)
/

CREATE INDEX IX_RELATIONSHIP3 ON VENTA (USUARIO_RUT)
/

CREATE INDEX IX_RELATIONSHIP7 ON VENTA (SURTIDOR_ID)
/

CREATE INDEX IX_RELATIONSHIP17 ON VENTA (VALE_ID)
/

CREATE INDEX IX_RELATIONSHIP23 ON VENTA (BENEFICIARIO_ID)
/

CREATE INDEX IX_RELATIONSHIP31 ON VENTA (ANULACION_ID)
/

-- ADD KEYS FOR TABLE VENTA

ALTER TABLE VENTA ADD CONSTRAINT KEY1 PRIMARY KEY (ID)
/

-- TABLE AND COLUMNS COMMENTS SECTION

COMMENT ON COLUMN VENTA.ESTADO IS 'SIN_CONFIRMAR
CONFIRMADO
ANULADA'
/

-- TABLE COMBUSTIBLE

CREATE TABLE COMBUSTIBLE(
  ID INTEGER NOT NULL,
  NOMBRE VARCHAR2(30 ) NOT NULL,
  ESTADO CHAR(1 ) NOT NULL
)
/

-- ADD KEYS FOR TABLE COMBUSTIBLE

ALTER TABLE COMBUSTIBLE ADD CONSTRAINT KEY2 PRIMARY KEY (ID)
/

ALTER TABLE COMBUSTIBLE ADD CONSTRAINT NOMBRE UNIQUE (NOMBRE)
/

-- TABLE USUARIO

CREATE TABLE USUARIO(
  RUT INTEGER NOT NULL,
  DV CHAR(1 ) NOT NULL,
  NOMBRES VARCHAR2(30 ) NOT NULL,
  APATERNO VARCHAR2(30 ) NOT NULL,
  AMATERNO VARCHAR2(30 ) NOT NULL,
  PASSWORD VARCHAR2(30 ) NOT NULL,
  ESTADO CHAR(1 ) NOT NULL,
  ROL_ID INTEGER
)
/

-- CREATE INDEXES FOR TABLE USUARIO

CREATE INDEX IX_RELATIONSHIP20 ON USUARIO (ROL_ID)
/

-- ADD KEYS FOR TABLE USUARIO

ALTER TABLE USUARIO ADD CONSTRAINT KEY3 PRIMARY KEY (RUT)
/

-- TABLE VALE

CREATE TABLE VALE(
  ID INTEGER NOT NULL,
  TALONARIO_ID INTEGER NOT NULL,
  ESTADO CHAR(1 ) NOT NULL,
  CANTIDAD_LITROS INTEGER NOT NULL
)
/

-- CREATE INDEXES FOR TABLE VALE

CREATE INDEX IX_RELATIONSHIP13 ON VALE (TALONARIO_ID)
/

-- ADD KEYS FOR TABLE VALE

ALTER TABLE VALE ADD CONSTRAINT KEY5 PRIMARY KEY (ID)
/

-- TABLE SURTIDOR

CREATE TABLE SURTIDOR(
  ID INTEGER NOT NULL,
  ESTADO CHAR(1 ) NOT NULL
)
/

-- ADD KEYS FOR TABLE SURTIDOR

ALTER TABLE SURTIDOR ADD CONSTRAINT KEY6 PRIMARY KEY (ID)
/

-- TABLE COMBUSTIBLESXSURTIDOR

CREATE TABLE COMBUSTIBLESXSURTIDOR(
  COMBUSTIBLE_ID INTEGER NOT NULL,
  SURTIDOR_ID INTEGER NOT NULL,
  CANTIDAD_LITROS NUMBER NOT NULL
)
/

-- CREATE INDEXES FOR TABLE COMBUSTIBLESXSURTIDOR

CREATE INDEX IX_RELATIONSHIP5 ON COMBUSTIBLESXSURTIDOR (SURTIDOR_ID)
/

CREATE INDEX IX_RELATIONSHIP6 ON COMBUSTIBLESXSURTIDOR (COMBUSTIBLE_ID)
/

-- ADD KEYS FOR TABLE COMBUSTIBLESXSURTIDOR

ALTER TABLE COMBUSTIBLESXSURTIDOR ADD CONSTRAINT KEY7 PRIMARY KEY (COMBUSTIBLE_ID,SURTIDOR_ID)
/

-- TABLE TALONARIO

CREATE TABLE TALONARIO(
  ID INTEGER NOT NULL,
  FECHA_ENTRGA DATE NOT NULL,
  NUMERO_COMPROBANTE_TRANSACCION INTEGER NOT NULL,
  EMPRESA_RUT INTEGER NOT NULL,
  ESTADO CHAR(1 ) NOT NULL
)
/

-- CREATE INDEXES FOR TABLE TALONARIO

CREATE INDEX IX_RELATIONSHIP19 ON TALONARIO (EMPRESA_RUT)
/

-- ADD KEYS FOR TABLE TALONARIO

ALTER TABLE TALONARIO ADD CONSTRAINT KEY10 PRIMARY KEY (ID)
/

ALTER TABLE TALONARIO ADD CONSTRAINT NUMERO_COMPROBANTE_TRANSACCION UNIQUE (NUMERO_COMPROBANTE_TRANSACCION)
/

-- TABLE EMPRESA

CREATE TABLE EMPRESA(
  RUT INTEGER NOT NULL,
  DV CHAR(1 ) NOT NULL,
  NOMBRE VARCHAR2(30 ) NOT NULL,
  ESTADO CHAR(1 ) NOT NULL,
  RUT_USUARIO INTEGER NOT NULL
)
/

-- CREATE INDEXES FOR TABLE EMPRESA

CREATE INDEX IX_RELATIONSHIP24 ON EMPRESA (RUT_USUARIO)
/

-- ADD KEYS FOR TABLE EMPRESA

ALTER TABLE EMPRESA ADD CONSTRAINT KEY11 PRIMARY KEY (RUT)
/

-- TABLE ROL

CREATE TABLE ROL(
  ID INTEGER NOT NULL,
  NOMBRE VARCHAR2(30 ) NOT NULL
)
/

-- ADD KEYS FOR TABLE ROL

ALTER TABLE ROL ADD CONSTRAINT KEY13 PRIMARY KEY (ID)
/

-- TABLE PERMISO

CREATE TABLE PERMISO(
  ID INTEGER NOT NULL,
  NOMBRE VARCHAR2(30 ) NOT NULL
)
/

-- ADD KEYS FOR TABLE PERMISO

ALTER TABLE PERMISO ADD CONSTRAINT KEY14 PRIMARY KEY (ID)
/

-- TABLE PERMISOSXROLES

CREATE TABLE PERMISOSXROLES(
  PEMISO_ID INTEGER NOT NULL,
  ROL_ID INTEGER NOT NULL
)
/

-- CREATE INDEXES FOR TABLE PERMISOSXROLES

CREATE INDEX IX_RELATIONSHIP21 ON PERMISOSXROLES (PEMISO_ID)
/

CREATE INDEX IX_RELATIONSHIP22 ON PERMISOSXROLES (ROL_ID)
/

-- ADD KEYS FOR TABLE PERMISOSXROLES

ALTER TABLE PERMISOSXROLES ADD CONSTRAINT KEY15 PRIMARY KEY (PEMISO_ID,ROL_ID)
/

-- TABLE BENEFICIARIO_CREDITO

CREATE TABLE BENEFICIARIO_CREDITO(
  ID INTEGER NOT NULL,
  RUT INTEGER NOT NULL,
  DV CHAR(1 ) NOT NULL,
  TOPE_LITROS INTEGER NOT NULL,
  LIMITE_VIGENCIA DATE NOT NULL,
  NOMBRE_EMPRESA VARCHAR2(30 ) NOT NULL,
  ESTADO CHAR(1 ) NOT NULL
)
/

-- ADD KEYS FOR TABLE BENEFICIARIO_CREDITO

ALTER TABLE BENEFICIARIO_CREDITO ADD CONSTRAINT KEY17 PRIMARY KEY (ID)
/

-- TABLE HISTORIAL_PRECIO

CREATE TABLE HISTORIAL_PRECIO(
  ID INTEGER NOT NULL,
  FECHA DATE NOT NULL,
  PRECIO NUMBER NOT NULL,
  COMBUSTIBLE_ID INTEGER
)
/

-- CREATE INDEXES FOR TABLE HISTORIAL_PRECIO

CREATE INDEX IX_RELATIONSHIP29 ON HISTORIAL_PRECIO (COMBUSTIBLE_ID)
/

-- ADD KEYS FOR TABLE HISTORIAL_PRECIO

ALTER TABLE HISTORIAL_PRECIO ADD CONSTRAINT KEY18 PRIMARY KEY (ID)
/

-- TABLE ANULACION

CREATE TABLE ANULACION(
  ID INTEGER NOT NULL,
  USUARIO_RUT INTEGER NOT NULL,
  RAZON VARCHAR2(120 ) NOT NULL
)
/

-- CREATE INDEXES FOR TABLE ANULACION

CREATE INDEX IX_RELATIONSHIP33 ON ANULACION (USUARIO_RUT)
/

-- ADD KEYS FOR TABLE ANULACION

ALTER TABLE ANULACION ADD CONSTRAINT KEY20 PRIMARY KEY (ID)
/

-- CREATE RELATIONSHIPS SECTION ------------------------------------------------- 

ALTER TABLE VENTA ADD CONSTRAINT RELATIONSHIP2 FOREIGN KEY (COMBUSTIBLE_ID) REFERENCES COMBUSTIBLE (ID)
/

ALTER TABLE VENTA ADD CONSTRAINT RELATIONSHIP3 FOREIGN KEY (USUARIO_RUT) REFERENCES USUARIO (RUT)
/

ALTER TABLE COMBUSTIBLESXSURTIDOR ADD CONSTRAINT RELATIONSHIP5 FOREIGN KEY (SURTIDOR_ID) REFERENCES SURTIDOR (ID)
/

ALTER TABLE COMBUSTIBLESXSURTIDOR ADD CONSTRAINT RELATIONSHIP6 FOREIGN KEY (COMBUSTIBLE_ID) REFERENCES COMBUSTIBLE (ID)
/

ALTER TABLE VENTA ADD CONSTRAINT RELATIONSHIP7 FOREIGN KEY (SURTIDOR_ID) REFERENCES SURTIDOR (ID)
/

ALTER TABLE VALE ADD CONSTRAINT RELATIONSHIP13 FOREIGN KEY (TALONARIO_ID) REFERENCES TALONARIO (ID)
/

ALTER TABLE VENTA ADD CONSTRAINT RELATIONSHIP17 FOREIGN KEY (VALE_ID) REFERENCES VALE (ID)
/

ALTER TABLE TALONARIO ADD CONSTRAINT RELATIONSHIP19 FOREIGN KEY (EMPRESA_RUT) REFERENCES EMPRESA (RUT)
/

ALTER TABLE USUARIO ADD CONSTRAINT RELATIONSHIP20 FOREIGN KEY (ROL_ID) REFERENCES ROL (ID)
/

ALTER TABLE PERMISOSXROLES ADD CONSTRAINT RELATIONSHIP21 FOREIGN KEY (PEMISO_ID) REFERENCES PERMISO (ID)
/

ALTER TABLE PERMISOSXROLES ADD CONSTRAINT RELATIONSHIP22 FOREIGN KEY (ROL_ID) REFERENCES ROL (ID)
/

ALTER TABLE VENTA ADD CONSTRAINT RELATIONSHIP23 FOREIGN KEY (BENEFICIARIO_ID) REFERENCES BENEFICIARIO_CREDITO (ID)
/

ALTER TABLE EMPRESA ADD CONSTRAINT RELATIONSHIP24 FOREIGN KEY (RUT_USUARIO) REFERENCES USUARIO (RUT)
/

ALTER TABLE HISTORIAL_PRECIO ADD CONSTRAINT RELATIONSHIP29 FOREIGN KEY (COMBUSTIBLE_ID) REFERENCES COMBUSTIBLE (ID)
/

ALTER TABLE VENTA ADD CONSTRAINT RELATIONSHIP31 FOREIGN KEY (ANULACION_ID) REFERENCES ANULACION (ID)
/

ALTER TABLE ANULACION ADD CONSTRAINT RELATIONSHIP33 FOREIGN KEY (USUARIO_RUT) REFERENCES USUARIO (RUT)
/


