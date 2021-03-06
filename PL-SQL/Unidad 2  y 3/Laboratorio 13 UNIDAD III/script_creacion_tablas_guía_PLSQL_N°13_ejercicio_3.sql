CREATE TABLE EMPLEADO
(employee_id  NUMBER(5) NOT NULL CONSTRAINT PK_EMPLEADO PRIMARY KEY,
 last_name    VARCHAR2(30) NOT NULL,
 first_name   VARCHAR2(30) NOT NULL,
 hire_date    date NOT NULL,
 salary       NUMBER(8,2) NOT NULL,
 commission_pct  NUMBER(4,2));    

CREATE TABLE ERROR_CALC_REMUN
(sec_error_calculo_remun  NUMBER(5) NOT NULL CONSTRAINT PK_ERROR_CALC_REMUN PRIMARY KEY,
 rutina_error  VARCHAR2(50) NOT NULL,
 id_empleado  NUMBER(6),
 mensaje    VARCHAR2(200));
 
CREATE TABLE CARGAS_FAMILIARES
(carga_id         NUMBER(5) NOT NULL,
 employee_id      NUMBER(6) NOT NULL CONSTRAINT FK_CARGAS_FAM_EMP REFERENCES empleado(employee_id),
 fecha_nacimiento DATE NOT NULL,
 CONSTRAINT PK_CARGAS_FAM PRIMARY KEY(carga_id));

CREATE TABLE TRAMO_PAGO_CARGAS
(id_tramo_pago NUMBER(2) NOT NULL CONSTRAINT PK_RAMO_PAGO_CARGAS PRIMARY KEY, 
 edad_inferior NUMBER(2),
 edad_superior NUMBER(2),
 valor_carga   NUMBER(6));

CREATE TABLE ANNOS_TRABAJADOS
(sec_annos_contratado NUMBER(2) CONSTRAINT PK_ANNOS_TRABAJADOS PRIMARY KEY,
 annos_contratado     NUMBER(2) NOT NULL,
 porcentaje           NUMBER(2,1) NOT NULL);


CREATE TABLE HABER_CALC_MES
(ID_EMPLEADO      NUMBER(6) CONSTRAINT PK_HABER_CALC_MES PRIMARY KEY
    CONSTRAINT FK_HABER_CAL_MES_EMP REFERENCES empleado(employee_id),
 VALOR_SALARIO  NUMBER(8) NOT NULL,
 VALOR_COM	        NUMBER(8), 
 VALOR_CARGAS_FAM    NUMBER(8),
 VALOR_COLACION	       NUMBER(8) NOT NULL,
 VALOR_MOVILIZACION NUMBER(8) NOT NULL,
 VALOR_ASIG_ANNOS       NUMBER(8));


CREATE TABLE DESCUENTO_CALC_MES
(ID_EMPLEADO        NUMBER(6) CONSTRAINT PK_DESCUENTO_CALC_MES PRIMARY KEY
CONSTRAINT FK_DESCTO_CAL_MES_EMP REFERENCES empleado(employee_id),
 VALOR_SEG_SOCIAL  NUMBER(8) NOT NULL,
 VALOR_SEG_SALUD    NUMBER(8) NOT NULL);


CREATE TABLE TOTAL_CALC_MES
(ID_EMPLEADO	     NUMBER(6) CONSTRAINT PK_TOTAL_CALC_MES PRIMARY KEY
CONSTRAINT FK_TOTAL_CAL_MES_EMP REFERENCES empleado(employee_id),
 TOTAL_HABERES     NUMBER(8) NOT NULL,
 TOTAL_DESCUENTOS  NUMBER(8) NOT NULL,
 TOTAL_ALC_LIQUIDO NUMBER(8) NOT NULL);

CREATE SEQUENCE SEQ_annos_trabajados; 
CREATE SEQUENCE SEQ_RANGO_AUMENTO; 
CREATE SEQUENCE SEQ_TRAMO_PAGO_CARGA;
CREATE SEQUENCE SEQ_ERROR_CALC_REMUN;

INSERT INTO EMPLEADO
SELECT employee_id, last_name, first_name, hire_date,salary, commission_pct
FROM hr.employees;

INSERT INTO ANNOS_TRABAJADOS VALUES(seq_annos_trabajados.NEXTVAL,10,0.6);
INSERT INTO ANNOS_TRABAJADOS VALUES(seq_annos_trabajados.NEXTVAL,11,0.7);
INSERT INTO ANNOS_TRABAJADOS VALUES(seq_annos_trabajados.NEXTVAL,12,0.8);


INSERT INTO CARGAS_FAMILIARES VALUES(500, 114, '05/04/2000');
INSERT INTO CARGAS_FAMILIARES VALUES(501, 114, '20/11/1990');
INSERT INTO CARGAS_FAMILIARES VALUES(502, 114, '15/12/2005');
INSERT INTO CARGAS_FAMILIARES VALUES(503, 115, '05/04/2007');
INSERT INTO CARGAS_FAMILIARES VALUES(504, 116, '20/01/1998');
INSERT INTO CARGAS_FAMILIARES VALUES(505, 116, '15/03/2008');
INSERT INTO CARGAS_FAMILIARES VALUES(506, 117, '05/05/2010');
INSERT INTO CARGAS_FAMILIARES VALUES(507, 118, '20/11/1994');
INSERT INTO CARGAS_FAMILIARES VALUES(508, 118, '15/12/2013');
INSERT INTO CARGAS_FAMILIARES VALUES(509, 119, '05/04/2003');
INSERT INTO CARGAS_FAMILIARES VALUES(510, 119, '20/01/1998');
INSERT INTO CARGAS_FAMILIARES VALUES(511, 119, '15/03/2014');
INSERT INTO CARGAS_FAMILIARES VALUES(512, 206, '20/11/2012');
INSERT INTO CARGAS_FAMILIARES VALUES(513, 206, '15/12/2005');
INSERT INTO CARGAS_FAMILIARES VALUES(514, 206, '05/04/2007');
INSERT INTO CARGAS_FAMILIARES VALUES(515, 206, '20/01/1998');
INSERT INTO CARGAS_FAMILIARES VALUES(516, 206, '15/03/2008');

INSERT INTO TRAMO_PAGO_CARGAS VALUES(seq_TRAMO_PAGO_CARGA.NEXTVAL,0,3,600);
INSERT INTO TRAMO_PAGO_CARGAS VALUES(seq_TRAMO_PAGO_CARGA.NEXTVAL,4,6,550);
INSERT INTO TRAMO_PAGO_CARGAS VALUES(seq_TRAMO_PAGO_CARGA.NEXTVAL,7,9,500);
INSERT INTO TRAMO_PAGO_CARGAS VALUES(seq_TRAMO_PAGO_CARGA.NEXTVAL,9,12,400);
INSERT INTO TRAMO_PAGO_CARGAS VALUES(seq_TRAMO_PAGO_CARGA.NEXTVAL,13,20,300);
INSERT INTO TRAMO_PAGO_CARGAS VALUES(seq_TRAMO_PAGO_CARGA.NEXTVAL,14,60,200);

COMMIT;