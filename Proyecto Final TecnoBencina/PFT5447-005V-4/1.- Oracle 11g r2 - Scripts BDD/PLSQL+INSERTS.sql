----------------------------------------------PACKAGE----------------------------------------------------

CREATE OR REPLACE PACKAGE PKG_TECNOBENCINA IS
	--Retorna la cantidad de vales disponibles por el talonaro ingreasdo
	FUNCTION CantidadValesDispPorTalonario(iIdTalonario TALONARIO.ID%TYPE) RETURN NUMBER;
	
	--verifica que el rut sea valido
	FUNCTION VerificarRut(iRut NUMBER, iDv CHAR) RETURN NUMBER;
	
	--Retorna la cantidad de litros de bencina sacados por un beneficiario durante este mes
	FUNCTION LitrosMesPorBeneficiario(iIdBeneficiario VENTA.BENEFICIARIO_ID%TYPE) RETURN NUMBER;
	
	--Verifica si un usuario posee un Rol: 0 = false | 1 =true
	FUNCTION hasRole(iRut USUARIO.RUT%TYPE, iRol ROL.NOMBRE%TYPE) RETURN NUMBER;
	
	--Verifica si un usuario posee un Permiso: 0 = false | 1 =true
	FUNCTION hasPermission(iRut USUARIO.RUT%TYPE, iPermiso PERMISO.NOMBRE%TYPE) RETURN NUMBER;
	
END PKG_TECNOBENCINA;
/
CREATE OR REPLACE PACKAGE BODY PKG_TECNOBENCINA IS

	FUNCTION CantidadValesDispPorTalonario(iIdTalonario TALONARIO.ID%TYPE) RETURN NUMBER AS var NUMBER;
    BEGIN
      SELECT COUNT(*) INTO var FROM VALE WHERE VALE.TALONARIO_ID=iIdTalonario AND VALE.ESTADO=1;
      RETURN var;

      EXCEPTION
      	WHEN NO_DATA_FOUND THEN
          var:='No se encuentra el talonario';
          RETURN var;
	END CantidadValesDispPorTalonario;


	FUNCTION VerificarRut(iRut NUMBER, iDv CHAR) RETURN NUMBER IS	
		var 		NUMBER 		:=0;
		RUT         NUMBER(8)  := iRut;
		DIG         CHAR(1)     := iDv;
		SUMA        NUMBER(10)  := 0;
		FACTOR      NUMBER(2)   := 2;
		LARGO       NUMBER(2)   := LENGTH(RUT);
		DIGITO      NUMBER(1)   := 0;
		CARACTERES  VARCHAR(12) := '123456789K0';
	
    BEGIN
       FOR CONTADOR IN REVERSE 1..LARGO LOOP
			DIGITO := SUBSTR(RUT, CONTADOR, 1);
			SUMA := SUMA + DIGITO * FACTOR;    
			FACTOR := FACTOR + 1;
		
			IF FACTOR > 7 THEN
				FACTOR := 2;   
			END IF;
		END LOOP;
		SUMA := 11 - MOD(SUMA, 11);  
		IF(SUBSTR(CARACTERES, SUMA, 1) = DIG) THEN
			var:=1;
			RETURN var;
		ELSE
			RETURN var;
		END IF;

    EXCEPTION
		WHEN others THEN
          RETURN var;
	END VerificarRut;
	
	FUNCTION LitrosMesPorBeneficiario(iIdBeneficiario VENTA.BENEFICIARIO_ID%TYPE) RETURN NUMBER AS var NUMBER;
    BEGIN
		SELECT SUM(LITROS) INTO VAR FROM VENTA 
		WHERE VENTA.FECHA BETWEEN TRUNC(SYSDATE,'MM') AND LAST_DAY(sysdate) AND VENTA.BENEFICIARIO_ID=iIdBeneficiario;
		RETURN var;

      EXCEPTION
      	WHEN NO_DATA_FOUND THEN
          RETURN 0;
	END LitrosMesPorBeneficiario;	
	
	FUNCTION hasRole(iRut USUARIO.RUT%TYPE, iRol ROL.NOMBRE%TYPE) RETURN NUMBER AS var NUMBER;
    BEGIN
		SELECT COUNT(DISTINCT(USUARIO.RUT)) INTO var FROM USUARIO
		JOIN ROL ON (ROL.ID = USUARIO.ROL_ID)
		WHERE USUARIO.RUT = iRut AND ROL.NOMBRE=iRol;
		RETURN var;

      EXCEPTION
      	WHEN NO_DATA_FOUND THEN
          RETURN 0;
	END hasRole;	
	
	FUNCTION hasPermission(iRut USUARIO.RUT%TYPE, iPermiso PERMISO.NOMBRE%TYPE) RETURN NUMBER AS var NUMBER;
    BEGIN
		SELECT COUNT(DISTINCT(USUARIO.RUT)) INTO var FROM USUARIO
		JOIN ROL ON (rol.ID = USUARIO.ROL_ID)
		JOIN PERMISOSXROLES ON (PERMISOSXROLES.ROL_ID = ROL.ID)
		JOIN PERMISO ON (PERMISO.ID = PERMISOSXROLES.PEMISO_ID)
		WHERE USUARIO.RUT = iRut AND PERMISO.nombre=iPermiso;
		RETURN var;

      EXCEPTION
      	WHEN NO_DATA_FOUND THEN
          RETURN 0;
	END hasPermission;		


END PKG_TECNOBENCINA;

---------------------------------------------TRIGGERS-------------------------------------
/
--TRIGGER USUARIO
CREATE OR REPLACE TRIGGER USUARIO_BEFORE_INS_OR_UPD
BEFORE UPDATE OR INSERT
   ON USUARIO
   FOR EACH ROW

DECLARE
   isRutValid NUMBER;

BEGIN
		SELECT PKG_TECNOBENCINA.VerificarRut(:new.RUT, :new.DV) INTO isRutValid FROM dual;
		
    	IF  isRutValid!= 1 THEN
			 RAISE_APPLICATION_ERROR(-20001, 'Rut invalido.');
		END IF;
END;
/
--TRIGGER EMPRESA
CREATE OR REPLACE TRIGGER EMPRESA_BEFORE_INS_OR_UPD
BEFORE UPDATE OR INSERT
   ON EMPRESA
   FOR EACH ROW

DECLARE
   isRutValid NUMBER;
   hasRole NUMBER;

BEGIN
		SELECT PKG_TECNOBENCINA.VerificarRut(:new.RUT, :new.DV) INTO isRutValid FROM dual;
		SELECT PKG_TECNOBENCINA.hasRole(:new.RUT_USUARIO, 'encargado_empresa') INTO hasRole FROM dual;
		
    	IF  isRutValid!= 1 THEN
			 RAISE_APPLICATION_ERROR(-20001, 'Rut invalido.');
		END IF;
		
		IF  hasRole!= 1 THEN
			 RAISE_APPLICATION_ERROR(-20002, 'El usuario no es un encargado de empresa.');
		END IF;	

END;
/
--TRIGGER BENEFICIARIO_CREDITO
CREATE OR REPLACE TRIGGER BENEFICIARIO_BEFORE_INS_OR_UPD
BEFORE UPDATE OR INSERT
   ON BENEFICIARIO_CREDITO
   FOR EACH ROW

DECLARE
   isRutValid NUMBER;

BEGIN
		SELECT PKG_TECNOBENCINA.VerificarRut(:new.RUT, :new.DV) INTO isRutValid FROM dual;
		
    	IF  isRutValid!= 1 THEN
			 RAISE_APPLICATION_ERROR(-20001, 'Rut invalido.');
		END IF;

END;
/
---------------------------------------------INSERTS-------------------------------------

-- ----------------------------
-- Records of COMBUSTIBLE
-- ----------------------------
BEGIN
INSERT INTO "TECNOBENCINA"."COMBUSTIBLE" VALUES ('1', '93', '1');
INSERT INTO "TECNOBENCINA"."COMBUSTIBLE" VALUES ('2', '95', '1');
INSERT INTO "TECNOBENCINA"."COMBUSTIBLE" VALUES ('3', '97', '1');
INSERT INTO "TECNOBENCINA"."COMBUSTIBLE" VALUES ('4', 'GLP Vehicular', '1');
INSERT INTO "TECNOBENCINA"."COMBUSTIBLE" VALUES ('5', 'GNC', '1');
INSERT INTO "TECNOBENCINA"."COMBUSTIBLE" VALUES ('6', 'Kerosene', '1');
INSERT INTO "TECNOBENCINA"."COMBUSTIBLE" VALUES ('7', 'Petorleo Disel', '1');


-- ----------------------------
-- Records of SURTIDOR
-- ----------------------------
INSERT INTO "TECNOBENCINA"."SURTIDOR" VALUES ('1', '1');
INSERT INTO "TECNOBENCINA"."SURTIDOR" VALUES ('2', '1');
INSERT INTO "TECNOBENCINA"."SURTIDOR" VALUES ('3', '1');


-- ----------------------------
-- Records of COMBUSTIBLESXSURTIDOR
-- ----------------------------
INSERT INTO "TECNOBENCINA"."COMBUSTIBLESXSURTIDOR" VALUES ('1', '1', '4000');
INSERT INTO "TECNOBENCINA"."COMBUSTIBLESXSURTIDOR" VALUES ('1', '2', '40');
INSERT INTO "TECNOBENCINA"."COMBUSTIBLESXSURTIDOR" VALUES ('2', '1', '30');
INSERT INTO "TECNOBENCINA"."COMBUSTIBLESXSURTIDOR" VALUES ('3', '2', '50');

-- ----------------------------
-- Records of HISTORIAL_PRECIO
-- ----------------------------
INSERT INTO "TECNOBENCINA"."HISTORIAL_PRECIO" VALUES ('1', TO_DATE('2016-04-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '5000', '1');
INSERT INTO "TECNOBENCINA"."HISTORIAL_PRECIO" VALUES ('2', TO_DATE('2016-04-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '5001', '1');

-- ----------------------------
-- Records of PERMISO
-- ----------------------------
INSERT INTO "TECNOBENCINA"."PERMISO" VALUES ('1', 'administrar_usuarios');
INSERT INTO "TECNOBENCINA"."PERMISO" VALUES ('2', 'administrar_empresas');
INSERT INTO "TECNOBENCINA"."PERMISO" VALUES ('3', 'administrar_combustibles');
INSERT INTO "TECNOBENCINA"."PERMISO" VALUES ('4', 'gestionar_pagos');
INSERT INTO "TECNOBENCINA"."PERMISO" VALUES ('5', 'gestionar_carga_combustible');
INSERT INTO "TECNOBENCINA"."PERMISO" VALUES ('6', 'gestionar_vales');
INSERT INTO "TECNOBENCINA"."PERMISO" VALUES ('7', 'consultar_informe_ventas');
INSERT INTO "TECNOBENCINA"."PERMISO" VALUES ('8', 'cargar_beneficiarios_externos');
INSERT INTO "TECNOBENCINA"."PERMISO" VALUES ('9', 'generar_transaccion_creditos');
INSERT INTO "TECNOBENCINA"."PERMISO" VALUES ('10', 'cambiar_estado_venta');

-- ----------------------------
-- Records of ROL
-- ----------------------------
INSERT INTO "TECNOBENCINA"."ROL" VALUES ('2', 'cajero');
INSERT INTO "TECNOBENCINA"."ROL" VALUES ('3', 'operador');
INSERT INTO "TECNOBENCINA"."ROL" VALUES ('4', 'encargado_empresa');
INSERT INTO "TECNOBENCINA"."ROL" VALUES ('5', 'supervisor');
INSERT INTO "TECNOBENCINA"."ROL" VALUES ('6', 'sistema_facturacion');
INSERT INTO "TECNOBENCINA"."ROL" VALUES ('1', 'administrador');

-- ----------------------------
-- Records of PERMISOSXROLES
-- ----------------------------
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('1', '1');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('2', '1');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('3', '1');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('4', '1');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('4', '2');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('5', '1');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('5', '3');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('6', '1');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('6', '4');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('6', '5');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('7', '1');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('7', '5');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('8', '1');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('8', '5');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('9', '5');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('9', '6');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('10', '3');
INSERT INTO "TECNOBENCINA"."PERMISOSXROLES" VALUES ('10', '2');

-- ----------------------------
-- Records of USUARIO
-- ----------------------------
INSERT INTO "TECNOBENCINA"."USUARIO" VALUES ('11874948', '0', 'Raul', 'Dias', 'Rodriguez', '1234', '1', '2');
INSERT INTO "TECNOBENCINA"."USUARIO" VALUES ('11905841', '4', 'Engler', 'Bradley', 'S', '1234', '1', '3');
INSERT INTO "TECNOBENCINA"."USUARIO" VALUES ('9032367', '9', 'Lane', 'Taylor', 'T', '1234', '1', '4');
INSERT INTO "TECNOBENCINA"."USUARIO" VALUES ('12130480', '5', 'Wilson', 'Wilson', 'L', '1234', '1', '5');
INSERT INTO "TECNOBENCINA"."USUARIO" VALUES ('18641951', '0', 'Hoffman', 'Pearl', 'R', '1234', '1', '6');
INSERT INTO "TECNOBENCINA"."USUARIO" VALUES ('8821341', '6', 'Reinert', 'Michelle', 'T', '1234', '0', '1');
INSERT INTO "TECNOBENCINA"."USUARIO" VALUES ('81677866', '2', 'Ignacio', 'Formas', 'Campos', '1234', '1', '1');

-- ----------------------------
-- Records of EMPRESA
-- ----------------------------
INSERT INTO "TECNOBENCINA"."EMPRESA" VALUES ('19604668', '2', 'Pupito', '1', '9032367');

-- ----------------------------
-- Records of BENEFICIARIO_CREDITO
-- ----------------------------
INSERT INTO "TECNOBENCINA"."BENEFICIARIO_CREDITO" VALUES ('1', '12596750', '7','1000', TO_DATE('2016-09-18 05:09:15', 'YYYY-MM-DD HH24:MI:SS'), 'Empresa benef', '1');

-- ----------------------------
-- Records of TALONARIO
-- ----------------------------
INSERT INTO "TECNOBENCINA"."TALONARIO" VALUES ('1', TO_DATE('2016-05-24 07:40:37', 'YYYY-MM-DD HH24:MI:SS'), '45645', '19604668', '1');

-- ----------------------------
-- Records of VENTA
-- ----------------------------
INSERT INTO "TECNOBENCINA"."VENTA" VALUES ('1', '1', '2500', '9', TO_DATE('2016-05-24 01:15:30', 'YYYY-MM-DD HH24:MI:SS'), 'sin_confirmar', '11874948', '2', null, null, '1');

COMMIT;
END;









