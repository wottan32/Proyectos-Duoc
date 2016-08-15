--++EJERCICIO 1
-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CLIENTE (
  id_cliente NUMBER(10) CONSTRAINT PK_CLIENTE PRIMARY KEY, 
  nombre_cliente VARCHAR2(50)  NOT NULL,
  fecha_incorporacion DATE  NOT NULL
  );

 CREATE TABLE EMPLEADO (
  rut_empleado NUMBER(10) CONSTRAINT PK_EMPLEADO PRIMARY KEY,
  dv_rut_empleado VARCHAR2(1) NOT NULL,
  nombre_empleado VARCHAR2(50) NOT NULL,
  fecha_contrato DATE
  );

CREATE TABLE FACTURA (
  nro_factura NUMBER(10) CONSTRAINT PK_FACTURA PRIMARY KEY , 
  echa DATE  NOT NULL,
  monto_total NUMBER(15)  NOT NULL,
  cantidad_cuotas NUMBER(2)  NOT NULL, 
  id_cliente NUMBER(10) NOT NULL,
  rut_empleado NUMBER(10) NOT NULL,
  CONSTRAINT FK_FACTURA_CLIENTE FOREIGN KEY(id_cliente) REFERENCES CLIENTE(id_cliente),
 CONSTRAINT FK_FACTURA_EMPLEADO FOREIGN KEY(rut_empleado) REFERENCES EMPLEADO(rut_empleado)
 ); 
 
CREATE TABLE CUOTA (
  nro_factura NUMBER(10) NOT NULL, 
  nro_cuota NUMBER(2)  NOT NULL , 
  valor_cuota NUMBER(10)  NOT NULL,
  fecha_vencimiento DATE  NOT NULL,
  CONSTRAINT PK_CUOTA PRIMARY KEY(nro_factura,nro_cuota),
  CONSTRAINT FK_CUOTA_FACTURA FOREIGN KEY (nro_factura) REFERENCES FACTURA(nro_factura)
  );


CREATE TABLE VENTA_EMPLEADO (
  rut_empleado NUMBER(10) CONSTRAINT PK_VENTA_EMPLEADO PRIMARY KEY,
  total_venta  NUMBER(5) NOT NULL,
  monto_total_ventas  NUMBER(10) NOT NULL,
  CONSTRAINT FK_VENTA_EMP_EMPLEADO FOREIGN KEY (rut_empleado) REFERENCES EMPLEADO(rut_empleado)
  );
  
CREATE TABLE TOTAL_PESOS_COMPRAS (
  id_cliente NUMBER(10) CONSTRAINT PK_TOTAL_PESOS_COMPRA PRIMARY KEY,
  total_pesos  NUMBER(5) NOT NULL,
  CONSTRAINT FK_TOTAL_PCOMPRAS_CLIENTE FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente));
 
 CREATE TABLE DETALLE_PESOS_COMPRAS (
  id_cliente NUMBER(10) NOT NULL,
  nro_factura NUMBER(10) NOT NULL,
  pesos_factura  NUMBER(4) NOT NULL,
  CONSTRAINT PK_DETALLE_PESOS_COMPRAS PRIMARY KEY(id_cliente, nro_factura),
  CONSTRAINT FK_DETPESOS_FACTURA FOREIGN KEY (nro_factura) REFERENCES FACTURA(nro_factura),
  CONSTRAINT FK_DETPESOS_CLIENTE FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
  );
  
INSERT INTO CLIENTE VALUES(3456,'Pedro Pérez Pereira','05/03/2012');
INSERT INTO CLIENTE VALUES(9862,'Sandra Soto Sevilla','01/10/2012');
INSERT INTO CLIENTE VALUES(7777,'Juan Tapia Molina','14/12/2013');
INSERT INTO CLIENTE VALUES(9999,'María Moreno Elgueta','05/05/2014');

INSERT INTO EMPLEADO VALUES(1111111, 1, 'Marcos Ramirez Ponce', '01/01/2000');
INSERT INTO EMPLEADO VALUES(2222222, 2, 'Marcela Rondini Flores', '05/01/2001');
INSERT INTO EMPLEADO VALUES(3333333, 3, 'Claudio Armijo Buljan', '05/05/2013');

INSERT INTO FACTURA VALUES(1,'21/03/2014',34560,3,3456, 1111111);
INSERT INTO FACTURA VALUES(2,'13/03/2014',457893,5,9862, 1111111);
INSERT INTO FACTURA VALUES(3,'05/05/2014',600000,2,9999, 1111111);
INSERT INTO FACTURA VALUES(4,'16/05/2014',558000,3,9862, 2222222);

INSERT INTO CUOTA VALUES(1,1,11520,'21/04/2014');
INSERT INTO CUOTA VALUES(1,2,11520,'21/05/2014');
INSERT INTO CUOTA VALUES(1,3,11520,'21/06/2014');
INSERT INTO CUOTA VALUES(2,1,91585,'13/04/2014');
INSERT INTO CUOTA VALUES(2,2,91577,'13/05/2014');
INSERT INTO CUOTA VALUES(2,3,91577,'13/06/2014');
INSERT INTO CUOTA VALUES(2,4,91577,'13/07/2014');
INSERT INTO CUOTA VALUES(2,5,91577,'13/08/2014');
INSERT INTO CUOTA VALUES(3,1,300000,'05/06/2014');
INSERT INTO CUOTA VALUES(3,2,300000,'05/07/2014');
INSERT INTO CUOTA VALUES(4,1,186000,'16/06/2014');
INSERT INTO CUOTA VALUES(4,2,186000,'16/07/2014');
INSERT INTO CUOTA VALUES(4,3,186000,'16/08/2014');
COMMIT;

set serveroutput on;
/*1. La Gerencia desea contar con un proceso que permita obtener el total de ventas que hasta la fecha han efectuado 
los empleados de la empresa. Para el desarrollo de este proceso y de acuerdo a los requerimientos del usuario, se deben 
considerar las especificaciones entregadas por el ingeniero jefe del departamento de informática:
 Se deben considerar TODOS los empleados y las ventas que han efectuado. En el caso de que un empleado no haya efectuado 
  ventas se debe mostrar valor cero para el total de ventas y monto de las ventas.
 Se deben controlar a los menos tres excepciones estándar.
 El resultado del proceso se debe almacenar en la tabla VENTAS_EMPLEADO.
 Al finalizar la ejecución del proceso, la información almacenada en la tabla VENTA_EMPLEADO debería ser como se muestra en el ejemplo:*/


CREATE OR REPLACE PROCEDURE ejercicio1 IS
  TYPE datosEmpleado IS RECORD(
    rut empleado.rut_empleado%TYPE,
    conteoVenta NUMBER(10),
    sumaTotal NUMBER(10)
    );

  datos datosEmpleado;

  CURSOR mostrarDatos IS 
    SELECT empleado.rut_empleado, COUNT(factura.rut_empleado) AS conteoVenta, NVL(SUM(MONTO_TOTAL), 0) AS SumaTotal FROM factura 
    right join empleado ON (empleado.rut_empleado = factura.rut_empleado) 
    GROUP BY empleado.rut_empleado;


  BEGIN

  OPEN mostrarDatos;
  LOOP
    FETCH mostrarDatos INTO datos;
    EXIT WHEN mostrarDatos%NOTFOUND;
    INSERT INTO venta_empleado VALUES(DATOS.rut, datos.conteoVenta, datos.sumaTotal);
  END LOOP;
  CLOSE mostrarDatos;

  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('El empleado ya existe');

    WHEN ROWTYPE_MISMATCH THEN
    DBMS_OUTPUT.PUT_LINE('Se estan ingresando tipos de datos incorrectos');


    WHEN CURSOR_ALREADY_OPEN THEN
    DBMS_OUTPUT.PUT_LINE('Demaciados valores');
END;

BEGIN
  ejercicio1;
END




/*2*/

CREATE OR REPLACE PROCEDURE ej2 IS

  CURSOR cDetallePesosCompras IS SELECT id_cliente, NRO_FACTURA, ROUND(monto_total*0.012) AS montPesos from factura;
  DetallePesosCompras cDetallePesosCompras%ROWTYPE;

  CURSOR cTotPesComprs IS SELECT id_cliente, SUM(ROUND(monto_total*0.012)) AS montPesos from factura
  GROUP BY id_cliente;
  TotPesComprs cTotPesComprs%ROWTYPE;

BEGIN
FOR TotPesComprs IN cTotPesComprs
LOOP
  INSERT INTO TOTAL_PESOS_COMPRAS VALUES(TotPesComprs.id_cliente, TotPesComprs.montPesos);
END LOOP;


FOR  DetallePesosCompras IN cDetallePesosCompras
LOOP
  INSERT INTO DETALLE_PESOS_COMPRAS VALUES(DetallePesosCompras.id_cliente, DetallePesosCompras.nro_factura, DetallePesosCompras.montPesos);
END LOOP;



    EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('El empleado ya existe');

    WHEN ROWTYPE_MISMATCH THEN
    DBMS_OUTPUT.PUT_LINE('Se estan ingresando tipos de datos incorrectos');


    WHEN CURSOR_ALREADY_OPEN THEN
    DBMS_OUTPUT.PUT_LINE('Demaciados valores');

    END;

BEGIN
  ej2;
END;





--EJERCICIO 2
-------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE CLIENTE 
(id_cliente NUMBER(10) CONSTRAINT PK_CLIENTE PRIMARY KEY, 
 nombre_cliente VARCHAR2(50)  NOT NULL, 
 fecha_incorporacion DATE  NOT NULL);

 CREATE TABLE EMPLEADO
 (rut_empleado NUMBER(10) CONSTRAINT PK_EMPLEADO PRIMARY KEY,
  dv_rut_empleado VARCHAR2(1) NOT NULL,
  nombre_empleado VARCHAR2(50) NOT NULL,
  fecha_contrato DATE,
  sueldo_base   NUMBER(8));

CREATE TABLE FACTURA 
(nro_factura NUMBER(10) NOT NULL , 
 fecha_factura DATE  NOT NULL , 
 monto_total NUMBER(15)  NOT NULL , 
 id_cliente NUMBER(10) NOT NULL,
 rut_empleado NUMBER(10) NOT NULL,
 CONSTRAINT PK_FACTURA PRIMARY KEY (nro_factura),
 CONSTRAINT FK_FACTURA_CLIENTE FOREIGN KEY(id_cliente) REFERENCES CLIENTE(id_cliente),
 CONSTRAINT FK_FACTURA_EMPLEADO FOREIGN KEY(rut_empleado) REFERENCES EMPLEADO(rut_empleado)); 

CREATE TABLE IMPUESTO
(rut_empleado  NUMBER(10) CONSTRAINT PK_IMPUESTO PRIMARY KEY,
 dv_rut_empleado VARCHAR2(1) NOT NULL,
 sueldo_anual  NUMBER(15) NOT NULL,
 impuesto      NUMBER(8) NOT NULL,
 CONSTRAINT FK_IMPUESTO_EMPLEADO FOREIGN KEY(rut_empleado) REFERENCES EMPLEADO(rut_empleado));

CREATE TABLE BONIFICACIONES
(rut_empleado    NUMBER(10) NOT NULL,
 mes_pago        NUMBER(2) NOT NULL,
 anno_pago       NUMBER(4) NOT NULL,
 valor_comision  NUMBER(8) NOT NULL,
 valor_colacion  NUMBER(8) NOT NULL,
 CONSTRAINT PK_BONIFICACIONES PRIMARY KEY(rut_empleado, mes_pago, anno_pago),
 CONSTRAINT FK_BONIFICACIONES_EMPLEADO FOREIGN KEY(rut_empleado) REFERENCES EMPLEADO(rut_empleado));

CREATE TABLE PORCENTAJE_COMISION
(total_venta_inf   NUMBER(8) NOT NULL,
 total_venta_sup   NUMBER(8) NOT NULL,
 porc_comision        NUMBER(3,2) NOT NULL,
CONSTRAINT PK_PORCENTAJE_COMISION PRIMARY KEY(total_venta_inf));

INSERT INTO CLIENTE VALUES(3456,'Pedro Pérez Pereira','05/03/2012');
INSERT INTO CLIENTE VALUES(9862,'Sandra Soto Sevilla','01/10/2012');
INSERT INTO CLIENTE VALUES(7777,'Juan Tapia Molina','14/12/2013');
INSERT INTO CLIENTE VALUES(9999,'María Moreno Elgueta','05/05/2014');

INSERT INTO EMPLEADO VALUES(1111111, 1, 'Marcos Ramirez Ponce', '01/01/2000', 180000);
INSERT INTO EMPLEADO VALUES(2222222, 2, 'Marcela Rondini Flores', '05/01/2001',250000);
INSERT INTO EMPLEADO VALUES(3333333, 3, 'Claudio Armijo Buljan', '05/05/2014',120000);

INSERT INTO FACTURA VALUES(1,'03/04/2014',17280,3456, 1111111);
INSERT INTO FACTURA VALUES(2,'05/04/2014',658789,9862, 1111111);
INSERT INTO FACTURA VALUES(3,'05/04/2014',250000,9999, 2222222);
INSERT INTO FACTURA VALUES(4,'16/04/2014',298700,9862, 3333333);
INSERT INTO FACTURA VALUES(5,'21/05/2014',34560,3456, 1111111);
INSERT INTO FACTURA VALUES(6,'13/05/2014',457893,9862, 1111111);
INSERT INTO FACTURA VALUES(7,'05/05/2014',600000,9999, 1111111);
INSERT INTO FACTURA VALUES(8,'16/05/2014',558000,9862, 2222222);
INSERT INTO FACTURA VALUES(9,'16/05/2014',125987,7777, 2222222);

INSERT INTO PORCENTAJE_COMISION VALUES(100000,300000,0.1);
INSERT INTO PORCENTAJE_COMISION VALUES(300001,500000,0.15);
INSERT INTO PORCENTAJE_COMISION VALUES(500001,700000,0.2);
INSERT INTO PORCENTAJE_COMISION VALUES(700001,1500000,0.25);
COMMIT;


/*1*/
CREATE TABLE ERRORES_PROCESOS_DUMBO(
      SEC_ERROR NUMBER(5) PRIMARY KEY,
      SUBPROGRAMA VARCHAR2(20) NOT NULL,
      MENSAJE VARCHAR2(200) NOT NULL
    );

CREATE OR REPLACE PROCEDURE ej21(PorcImupest numeric) IS

  CURSOR c1 IS SELECT rut_empleado, dv_rut_empleado, sueldo_base*12 AS sueldo_anual, (sueldo_base*12)*(PorcImupest/100) AS impuesto FROM empleado;
  var c1%ROWTYPE;
  v_impuesto numeric:=0;
  v_elmpleadosProcesados NUMERIC :=0;
  v_elmpleadosConImpuesto NUMERIC :=0;
  v_secError numeric;
  v_valorDuplicado numeric;
  impuestoInvalido EXCEPTION;
  err_num NUMBER;
  err_msg VARCHAR2(100);

 
  BEGIN 
 
  SELECT NVL(MAX(SEC_ERROR)+1, 0)  INTO v_secError FROM ERRORES_PROCESOS_DUMBO;

  IF PorcImupest <0 OR PorcImupest >100 THEN
    RAISE impuestoInvalido;
  END IF;
       
  FOR var IN c1

    LOOP
      IF var.sueldo_anual>=2000000 THEN
        v_impuesto:=var.impuesto;
        v_elmpleadosConImpuesto:=v_elmpleadosConImpuesto+1;
        ELSE
          v_impuesto:=0;
      END IF;

      SELECT COUNT(*) INTO v_valorDuplicado FROM impuesto WHERE rut_empleado=var.rut_empleado;

      IF v_valorDuplicado=0 THEN --Si no esta duplicado, se inserta
       
          INSERT INTO impuesto VALUES(var.rut_empleado, var.dv_rut_empleado, var.sueldo_anual , v_impuesto);
          v_elmpleadosProcesados:=v_elmpleadosProcesados+1;

        ELSE         

            UPDATE impuesto SET
              dv_rut_empleado=var.dv_rut_empleado,
              sueldo_anual=var.sueldo_anual,
              impuesto=v_impuesto
              WHERE rut_empleado=var.rut_empleado;
              v_elmpleadosProcesados:=v_elmpleadosProcesados+1;
      END IF;
    END LOOP;
 
  DBMS_OUTPUT.put_line('Total empleados procesados: ' ||v_elmpleadosProcesados);
  DBMS_OUTPUT.put_line('Total empleados afectos a impuestos: ' ||v_elmpleadosConImpuesto); 

  EXCEPTION

     WHEN DUP_VAL_ON_INDEX THEN
     INSERT INTO ERRORES_PROCESOS_DUMBO VALUES(v_secError, 'ej21', 'Valores duplicados');
     DBMS_OUTPUT.PUT_LINE('Valores duplicados');

    WHEN impuestoInvalido THEN
      DBMS_OUTPUT.PUT_LINE('Impuesto invalido');
      INSERT INTO ERRORES_PROCESOS_DUMBO VALUES(v_secError, 'ej21', 'Impuesto invalido'); 
      
    WHEN CURSOR_ALREADY_OPEN THEN
      INSERT INTO ERRORES_PROCESOS_DUMBO VALUES(v_secError, 'ej21', 'Demaciados valores'); 
      DBMS_OUTPUT.PUT_LINE('Demaciados valores'); 

     WHEN OTHERS THEN
      err_num := SQLCODE;
      err_msg := SUBSTR(SQLERRM, 1, 100);

      INSERT INTO ERRORES_PROCESOS_DUMBO VALUES(v_secError, 'ej21', CONCAT(err_msg, TO_CHAR(err_num))); 

END;

BEGIN
  ej21(1022);
END;


/*2*/


CREATE OR REPLACE PROCEDURE lab9_2_2 IS
  
  TYPE datosTotal IS RECORD(
    id cliente.id_Cliente%TYPE,
    totalPesos factura.monto_total%TYPE
  );
  dTotal datosTotal;

  TYPE datosDetalle IS RECORD(
    id cliente.id_Cliente%TYPE,
    nFactura factura.NRO_FACTURA%TYPE,
    pesosFactura factura.monto_total%TYPE
    );

  datDetalle datosDetalle;

  CURSOR datosT IS SELECT cliente.id_Cliente , SUM(ROUND(monto_total * 0.012)) as TOTAL_PESOS from factura left join cliente on (factura.ID_CLIENTE = cliente.ID_CLIENTE)
  group by cliente.id_Cliente;

  CURSOR datosD IS SELECT cliente.id_Cliente , NRO_FACTURA, ROUND(monto_total * 0.012) as PESOS_FACTURA from factura left join cliente on (factura.ID_CLIENTE = cliente.ID_CLIENTE)
  order by cliente.id_Cliente desc;
  BEGIN

open datosT;
loop
  fetch datost into dTotal;
  EXIT WHEN datosT%NOTFOUND;
insert into TOTAL_PESOS_COMPRAS values(dTotal.id, dTotal.totalPesos);
end loop;
close datosT;
open datosD;
LOOP
FETCH datosD into datDetalle;
EXIT WHEN datosD%NOTFOUND;
insert into DETALLE_PESOS_COMPRAS values(datDetalle.id, datDetalle.nFactura, datDetalle.pesosFactura);
END LOOP;
CLOSE datosD;
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
dbms_output.PUT_LINE('Valores duplicados, no se guardaron los datos');
END;

BEGIN
lab9_2;
END;


/*3*/





CREATE OR REPLACE PROCEDURE lab9_ej221 IS
  --dia date; 
  CURSOR cVentaEmpleado IS SELECT RUT_EMPLEADO, NVL(SUM(MONTO_TOTAL),0) AS "SumaVentas" FROM FACTURA
    WHERE fecha_factura BETWEEN TO_DATE('01-05-2014','DD-MM-YYYY') AND TO_DATE('31-05-2014','DD-MM-YYYY') 
    GROUP BY rut_empleado;
  ventaEmpleado cVentaEmpleado%ROWTYPE;
    
  CURSOR cPorcComision IS SELECT total_venta_inf, total_venta_sup, porc_comision FROM PRORCENTAJE_COMISION; 
    porcComision  cPorcComision%ROWTYPE;
  
  v_sueldoBase numeric;
  v_valorComision numeric;
  v_valorColacion numeric;
  total_empleados_procesados numeric:= 0;

 
  BEGIN
  --SELECT LAST_DAY(to_date('04/04/1924','DD/MM/YYYY')) into dia from dual;
  
  FOR ventaEmpleado in cVentaEmpleado 
    LOOP
      SELECT sueldo_base INTO v_sueldoBase FROM empleado WHERE rut_empleado=ventaEmpleado.RUT_EMPLEADO;
    
      FOR porcComision IN cPorcComision
        LOOP
          IF ventaEmpleado.SumaVentas BETWEEN porcComision.total_venta_inf AND porcComision.total_venta_sup THEN
            v_valorComision:=  porcComision.porc_comision*ventaEmpleado.SumaVentas;
          END IF;
          
          IF ventaEmpleado.SumaVentas=0 THEN
            v_valorComision:=0;
          END IF;
      
        END LOOP;
      v_valorColacion:=ROUND((v_suledoBase+v_valorComision)*0.085);
     -- INSERT INTO PRORCENTAJE_COMISION VALUES();
      total_empleados_procesados:=total_empleados_procesados+1;
      
      DBMS_OUTPUT.PUT_LINE(v_valorComision ||' ' ||v_valorColacion); --para verificar que se estan calculando
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total Empelados Procesados: '||total_empleados_procesados);
END; 






































  CREATE OR REPLACE PROCEDURE lab9_2_2_1(mes numeric, año numeric) IS

    SELECT SUM(MONTO_TOTAL) FROM FACTURA
    WHERE fecha_factura=TO_DATE(mes'-'año,'MM-YYYY');
      GROUP BY rut_empleado

    BEGIN




SELECT SUM(MONTO_TOTAL) FROM FACTURA
    WHERE fecha_factura BETWEEN TO_DATE('01-05-2014','DD-MM-YYYY') AND TO_DATE('15-05-2014','DD-MM-YYYY') 
      GROUP BY rut_empleado;
      
   LAST_DAY(TO_DATE('2014/05/14', 'yyyy/mm/dd'))   
      
    SELECT rut_empleado, SUM(MONTO_TOTAL) FROM FACTURA
    WHERE fecha_factura=TO_DATE('21-05-2014','DD-MM-YYYY')
      GROUP BY rut_empleado;



        CREATE OR REPLACE PROCEDURE lab9_2_2_1(mes numeric, año numeric) IS
    v_ultimoDia date;
  
  SELECT LAST_DAY(to_date('04/04/1924','DD/MM/YYYY')) into v_ultimoDia from dual;
    SELECT SUM(MONTO_TOTAL) FROM FACTURA
    WHERE fecha_factura BETWEEN TO_DATE('01/01/2014','DD-MM-YYYY') AND v_ultimoDia
    GROUP BY rut_empleado;

    BEGIN
    
    END;
      

--EJERCICIO 3
-------------------------------------------------------------------------------------------------------------------------------
/*Tablas*/
CREATE TABLE SOCIO
  (RUT       NUMBER(8) NOT NULL,
   DV        VARCHAR2(1),
   NOMBRES   VARCHAR2(20) NOT NULL,
   APELLIDOS VARCHAR2(20) NOT NULL,
   CONSTRAINT PK_SOCIO PRIMARY KEY (RUT));

CREATE TABLE VIDEO
  (ID_VIDEO        NUMBER(2) NOT NULL,
   TITULO_VIDEO    VARCHAR2(20) NOT NULL,
    CANTIDAD_COPIAS NUMBER(2) NOT NULL,
    CONSTRAINT PK_VIDEO PRIMARY KEY (ID_VIDEO)
  )
;  

CREATE TABLE ARRIENDOS
  (
    RUT      NUMBER(8) NOT NULL,
    ID_VIDEO NUMBER(2) NOT NULL,
    FECHA_ARRIENDO DATE NOT NULL,
    FECHA_DEVOLUCION DATE,
    FECHA_ENTREGA DATE,
    CONSTRAINT PK_ARRIENDOS PRIMARY KEY (RUT, ID_VIDEO, FECHA_ARRIENDO),
    CONSTRAINT FK_ARRIENDOS_SOCIO FOREIGN KEY (RUT) REFERENCES SOCIO(RUT),
    CONSTRAINT FK_ARRIENDOS_VIDEO FOREIGN KEY (ID_VIDEO) REFERENCES VIDEO(ID_VIDEO));
    
CREATE TABLE MULTAS_ARRIENDOS
(rut   NUMBER(8) NOT NULL,
 id_video NUMBER(2) NOT NULL,
 fecha_devolucion  DATE NOT NULL,
 fecha_entrega DATE,
 dias_atraso   NUMBER(3) NOT NULL,
 valor_multa   NUMBER(8),
 CONSTRAINT PK_MULTAS_ARRIENDOS PRIMARY KEY(rut,id_video,fecha_devolucion),
 CONSTRAINT FK_MULTAS_SOCIO FOREIGN KEY (rut) REFERENCES socio(rut),
 CONSTRAINT FK_MULTAS_VIDEO FOREIGN KEY (id_video) REFERENCES video(id_video));

/*DATOS*/

Insert into Socio values(12567811,  '7',  'CESAR','FLORES');     
Insert into Socio values(11222333,  'K',  'DANIEL','PEREZ');
Insert into Socio values(10444555,  '6',  'JORGE','SILVA');
INSERT INTO SOCIO VALUES(99999999, '9', 'MARIA', 'TAPIA');


Insert into Video values(1, 'AVENGERS', 2);  
Insert into Video values(2, 'BATTLESHIP', 4);
Insert into Video values(3, 'WAR HORSE', 5);  
Insert into Video values(4, 'STAR WARS', 5);


Insert into arriendos values(12567811, 1, '10/04/2014', '12/04/2014', '12/05/2014');
Insert into arriendos values(11222333, 3, '21/04/2014', '23/04/2014', '23/04/2014');
Insert into arriendos values(11222333, 1, '21/04/2014', '23/04/2014', '03/05/2014');
Insert into arriendos values(10444555, 1, '25/04/2014', '27/04/2014','');
Insert into arriendos values(11222333, 2, '03/05/2014', '05/05/2014','05/05/2014');
Insert into arriendos values(11222333, 2, '02/05/2014', '04/05/2014','');
commit;




CREATE OR REPLACE PROCEDURE ej21 IS
  CURSOR c1 IS SELECT rut_empleado, dv_rut_empleado, sueldo_base*12 AS sueldo_anual, (sueldo_base*12)*0.1 AS impuesto FROM empleado;
  var c1%ROWTYPE;
  
  v_totalElmpleados NUMERIC :=0;
  v_conImpuesto NUMERIC :=0;
  v_flagTabla numeric;
  v_tablaErrores varchar(160):= 
    'CREATE TABLE ERRORES_PROCESOS_DUMBO(
      SEC_ERROR NUMBER(5) PRIMARY KEY,
      SUBPROGRAMA VARCHAR2(20) NOT NULL,
      MENSAJE VARCHAR2(200) NOT NULL
    )';  
  
  BEGIN
  
  SELECT COUNT(*) INTO v_flagTabla FROM user_tables
  WHERE table_name = 'ERRORES_PROCESOS_DUMBO';
  
  IF v_flagTabla = 0 THEN
    EXECUTE IMMEDIATE  v_tablaErrores;
  END IF;
  
  FOR var IN c1

    LOOP
      IF var.sueldo_anual<=2000000 THEN
        INSERT INTO impuesto VALUES(var.rut_empleado, var.dv_rut_empleado, var.sueldo_anual , 0);
        v_totalElmpleados := v_totalElmpleados+1;
        
        ELSE
          INSERT INTO impuesto VALUES(var.rut_empleado, var.dv_rut_empleado,var.sueldo_anual,  var.impuesto);
          v_conImpuesto:=v_conImpuesto+1; 
          v_totalElmpleados := v_totalElmpleados+1;
      END IF;
  END LOOP;
  
  DBMS_OUTPUT.put_line('Total empleados procesados: ' ||v_totalElmpleados);
  DBMS_OUTPUT.put_line('Total empleados afectos a impuestos: ' ||v_conImpuesto);
  
    
END;


BEGIN
  ej21;
END;