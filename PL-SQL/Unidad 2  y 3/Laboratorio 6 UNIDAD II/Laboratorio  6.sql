CREATE TABLE cliente(rut VARCHAR2(50), 
	nombre VARCHAR2(50),
	direccion VARCHAR2(50),
	comuna VARCHAR2(50),
	telefono VARCHAR2(50)
	);

ALTER TABLE cliente add CONSTRAINT rut_pk PRIMARY KEY(rut);
ALTER TABLE cliente modify nombre CONSTRAINT nombre_nn NOT NULL;
ALTER TABLE cliente modify direccion CONSTRAINT direccion_nn NOT NULL;
ALTER TABLE cliente modify comuna CONSTRAINT comuna_nn NOT NULL;
ALTER TABLE cliente modify telefono CONSTRAINT telefono_nn NOT NULL;

BEGIN
	INSERT INTO cliente values('10114567','Antonio Vera','Ecuador 456','La Florida','6543234');
	INSERT INTO cliente values('9867543','Jorge Pérez','Salamanca 486','La Florida','7654345');
	INSERT INTO cliente values('8456567','Ana muñoz','San Francisco 77','Macul','8325678');
	INSERT INTO cliente values('12345654','Ricardo Jerez','San Juan 44','La Florida','6753456');
END;

CREATE TABLE cuenta(
	numeroc VARCHAR2(20),
	tipo VARCHAR2(15),
	saldo VARCHAR2(20),
	fecha_apertura VARCHAR2(50),
	rut VARCHAR2(50)
	);

desc cuenta
ALTER TABLE cuenta add CONSTRAINT numeroC_pk PRIMARY KEY(numeroC);
ALTER TABLE cuenta modify tipo CONSTRAINT tipo_nn NOT NULL;
ALTER TABLE cuenta modify saldo CONSTRAINT saldo_nn NOT NULL;
ALTER TABLE cuenta modify fecha_apertura CONSTRAINT fec_nn NOT NULL;
ALTER TABLE cuenta add CONSTRAINT rut_fk foreign KEY(rut) references cliente(rut);

BEGIN
	INSERT INTO cuenta values('10111111','corriente','700000','11/04/2009','10114567');
	INSERT INTO cuenta values('10123333','ahorro','545000','10/03/2008','8456567');
	INSERT INTO cuenta values('10134444','corriente','890000','13/05/2011','9867543');
	INSERT INTO cuenta values('10145555','ahorro','450000','20/06/2010','10114567');
	INSERT INTO cuenta values('10157777','ahorro','370000','11/04/2011','12345654');
END;

CREATE TABLE cajero(
	codigoC VARCHAR2(2),
	nombre VARCHAR2(20),
	direccion VARCHAR2(40),
	valor_hora VARCHAR2(20),
	telefono VARCHAR2(10)
	);

ALTER TABLE cajero add CONSTRAINT codigoc_pk PRIMARY KEY(codigoC);
ALTER TABLE cajero modify nombre CONSTRAINT nombreC_nn NOT NULL;
ALTER TABLE cajero modify direccion CONSTRAINT direccionC_nn NOT NULL;
ALTER TABLE cajero modify valor_hora CONSTRAINT vh_nn NOT NULL;
ALTER TABLE cajero modify telefono CONSTRAINT telefonoC_nn NOT NULL;

BEGIN
	INSERT INTO cajero values('10','Alejandro Cofre','Porto Seguro 88','5100','5674343');
	INSERT INTO cajero values('20','Mauricio Yañez','Los presidentes 345','4500','6754323');
	INSERT INTO cajero values('30','Alejandra Vera','Los Sauces 55','4600','7654343');
	INSERT INTO cajero values('40','Claudia Perez','Alpes 345','4900','8643245');
END;

CREATE TABLE deposito(
	numeroD VARCHAR2(2),
	cantidad VARCHAR2(20),
	numeroC VARCHAR2(20),
	fecha VARCHAR2(50),
	codigoC VARCHAR2(2)
	);

ALTER TABLE deposito add CONSTRAINT numeroD_pk PRIMARY KEY(numeroD);
ALTER TABLE deposito modify fecha CONSTRAINT fecha_nn NOT NULL;
ALTER TABLE deposito add CONSTRAINT numeroC_fk foreign KEY(numeroC) references cuenta(numeroC);
ALTER TABLE deposito add CONSTRAINT codigoC_fk foreign KEY(codigoC) references cajero(codigoC);

BEGIN
	INSERT INTO deposito values('10',54000,'10111111','10/02/2013','30');
	INSERT INTO deposito values('11',100000,'10123333','15/03/2013','10');
	INSERT INTO deposito values('12',75000,'10157777','25/02/2013','30');
	INSERT INTO deposito values('13',95000,'10123333','17/03/2013','20');
	INSERT INTO deposito values('14',20000,'10145555','10/01/2013','40');
END;

set serveroutput on;

/*SELECT SUBSTR(nombre, 1, 2)from cliente
extrae los primeros 2 caracteres de el nombre de los clientes

like con variable
WHERE student_name LIKE search||'%';
*/

/*1*/

DECLARE
 	CURSOR c1 IS SELECT rut, nombre, direccion, comuna, telefono, tipo, saldo FROM cliente
	JOIN cuenta USING(rut);
  
	TYPE datos IS RECORD(
		rut cliente.rut%TYPE,
		nombre cliente.nombre%TYPE,
		direccion cliente.direccion%TYPE,
		comuna cliente.comuna%TYPE,
		telefono cliente.telefono%TYPE,
		tipo cuenta.tipo%TYPE,
		saldo cuenta.saldo%TYPE
		);
	collectDatos datos;
  i numeric :=1;

BEGIN

	OPEN c1;
		FETCH c1 INTO collectDatos;
		WHILE c1%FOUND
			LOOP
      DBMS_OUTPUT.PUT_LINE('cliente ' ||i);
			DBMS_OUTPUT.PUT_LINE('Rut: ' ||collectDatos.rut);
			DBMS_OUTPUT.PUT_LINE('Nombre: ' ||collectDatos.nombre);
			DBMS_OUTPUT.PUT_LINE('Direccion: ' ||collectDatos.direccion);
			DBMS_OUTPUT.PUT_LINE('Comuna: ' ||collectDatos.comuna);
			DBMS_OUTPUT.PUT_LINE('Telefono: ' ||collectDatos.telefono);
			DBMS_OUTPUT.PUT_LINE('Tipo: ' ||collectDatos.tipo);
			DBMS_OUTPUT.PUT_LINE('Saldo: ' ||collectDatos.saldo);
			DBMS_OUTPUT.PUT_LINE('------------------------------------------');
			i:=i+1;	
				FETCH c1 INTO collectDatos;
			END LOOP;
	CLOSE c1;
END;


/*2*/
 DECLARE
 	CURSOR c1 IS SELECT nombre, direccion FROM cliente 
 	JOIN cuenta USING(rut)
 	WHERE TO_DATE(fecha_apertura,'DD/MM/YYYY') BETWEEN TO_DATE('01/01/2008','DD/MM/YYYY') AND TO_DATE('01/01/2010', 'DD/MM/YYYY');


 	var1 c1%ROWTYPE;

BEGIN

	DBMS_OUTPUT.PUT_LINE('Los clientes que tienen fecha de apretura de cuenta entre los años 2008 y 2010 son:');
	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP
				DBMS_OUTPUT.PUT_LINE('El cliente ' ||var1.nombre||' con direccion ' ||var1.direccion);
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
END;

/*3*/

 DECLARE
 	CURSOR c1 IS SELECT nombre, SUM(TRUNC(MONTHS_BETWEEN(sysdate , TO_DATE(fecha_apertura, 'DD/MM/YYYY')))) AS MesesDeApertura FROM cliente
	JOIN cuenta USING(rut)
  GROUP by nombre;

 	var1 c1%ROWTYPE;

BEGIN

	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP
				DBMS_OUTPUT.PUT_LINE('El cliente ' ||var1.nombre ||' tiene ' ||var1.MesesDeApertura ||' meses de apertura de cuenta');
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
END;

/*4*/

 DECLARE
 	CURSOR c1 IS SELECT nombre, SUM(saldo) FROM cliente
	join cuenta USING(rut)
	where saldo>(SELECT AVG(saldo) from cuenta)

	GROUP BY nombre;

 	var1 c1%ROWTYPE;
 	i numeric;

BEGIN
 SELECT count(nombre) INTO i FROM cliente
	join cuenta USING(rut)
	where saldo>(SELECT AVG(saldo) from cuenta);

	DBMS_OUTPUT.PUT_LINE(i ||' es la cantidad de clientes con saldo mayor que el promedio y sus nombres son:');

	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP
				DBMS_OUTPUT.PUT_LINE(var1.nombre );
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
END;


/*5*/

DECLARE
 	CURSOR c1 IS SELECT cliente.nombre AS nCliente, cajero.nombre AS nCajero, deposito.fecha FROM cliente
	JOIN cuenta USING(rut)
	JOIN deposito USING(numeroC)
	JOIN cajero USING (codigoC)
	where TO_DATE(deposito.fecha, 'DD/MM/YYYY') BETWEEN TO_DATE('01/01/2013', 'DD/MM/YYYY') AND TO_DATE('28/02/2013');

 	var1 c1%ROWTYPE;

BEGIN
	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP
				DBMS_OUTPUT.PUT_LINE('El cliente ' ||var1.nCliente ||' cuyo depósito se realizó la fecha ' ||var1.fecha ||' fue atendido por el cajero ' ||var1.nCajero);
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
END;

/*6*/
--http://docs.oracle.com/cd/A57673_01/DOC/server/doc/PLS23/ch4.htm

DECLARE
 	CURSOR c1 IS SELECT  cuenta.tipo, MAX(TO_NUMBER(deposito.cantidad)) AS maxDep, MIN(TO_NUMBER(deposito.cantidad)) AS minDep FROM deposito
	JOIN cuenta USING(numeroC)
	GROUP BY cuenta.tipo;

	TYPE tabla IS TABLE OF c1%ROWTYPE INDEX BY BINARY_INTEGER;
  
  var1 tabla;

BEGIN
	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP
				DBMS_OUTPUT.PUT_LINE('Tipo de cuenta: ' ||var1.tipo);
				DBMS_OUTPUT.PUT_LINE('Máximo ' ||var1.maxDep );
				DBMS_OUTPUT.PUT_LINE('Minimo ' ||var1.minDep );
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
END;

END;


DECLARE

	TYPE informeRegistro IS RECORD(
		nombre cliente.nombre%TYPE,
		fecha number
		);

	infoRegistro informeRegistro;

	TYPE informeTabla IS TABLE OF informeRegistro INDEX BY BINARY_INTEGER;

	infoTabla informeTabla;

	CURSOR cursorDatos IS SELECT nombre, TO_NUMBER(TO_CHAR(TO_DATE(fecha_apertura, 'dd/mm/yyyy'), 'yyyy')) as fecha from cliente 
	NATURAL JOIN cuenta
	ORDER BY fecha;

	datos cursorDatos%ROWTYPE;

	indice int := 1;

BEGIN

	FOR datos in cursorDatos
	LOOP
		infoTabla(indice).nombre := datos.nombre;
		infoTabla(indice).fecha := datos.fecha;
		indice := indice + 1;
	END LOOP;

	FOR indice in infoTabla.FIRST..infoTabla.LAST
	LOOP
		DBMS_OUTPUT.PUT_LINE('Los clientes que abrieron cuenta el a�o: ' || infoTabla(indice).fecha || ' son:');
		DBMS_OUTPUT.PUT_LINE(infoTabla(indice).nombre);

	END LOOP;

END;  


/*7*/
DECLARE
 	CURSOR c1 IS SELECT  cuenta.tipo, MAX(TO_NUMBER(deposito.cantidad)) AS maxDep, MIN(TO_NUMBER(deposito.cantidad)) AS minDep FROM deposito
	JOIN cuenta USING(numeroC)
	GROUP BY cuenta.tipo;

	var1 c1%ROWTYPE;


BEGIN
	OPEN c1;
		FETCH c1 INTO var1;
		WHILE c1%FOUND
			LOOP
				DBMS_OUTPUT.PUT_LINE('Tipo de cuenta: ' ||var1.tipo);
				DBMS_OUTPUT.PUT_LINE('Máximo ' ||var1.maxDep );
				DBMS_OUTPUT.PUT_LINE('Minimo ' ||var1.minDep );
				FETCH c1 INTO var1;
			END LOOP;
	CLOSE c1;
END;

/*8*/

DECLARE

v_anho numeric :=2010;

CURSOR c1 IS SELECT nombre FROM cliente 
JOIN cuenta USING (RUT)
where TO_DATE(fecha_apertura, 'DD/MM/YYYY') BETWEEN TO_DATE(TO_CHAR('01/01/' ||v_anho), 'DD/MM/YYYY') AND (TO_DATE(TO_CHAR('01/01/' ||(v_anho+1)), 'DD/MM/YYYY')-1);

var1 c1%ROWTYPE;

BEGIN
DBMS_OUTPUT.PUT_LINE('Los clientes que abrieron cuenta el año ' ||v_anho);
  OPEN c1;
  FETCH c1 INTO var1;
  WHILE c1%FOUND
    LOOP
      DBMS_OUTPUT.PUT_LINE(var1.nombre);
      FETCH c1 INTO var1;
    END LOOP;
  CLOSE c1;
END;

/*9*/


declare 
type calculos is record(
promedio int,
suma int,
maximo int,
minimo int,
tipoc cuenta.tipo%type);
var1 calculos;

begin
select avg(to_number(saldo)), sum(to_number(saldo)), max(to_number(saldo)), min(to_number(saldo)), tipo into var1 from cuenta where tipo = 'ahorro' group by tipo;
dbms_output.put_line('Tipo cuenta: ' || var1.tipoc);
dbms_output.put_line('------------------------------------------------------');
dbms_output.put_line('PROMEDIO           SUMA            MAXIMO             MINIMO');
dbms_output.put_line(var1.promedio || '            ' || var1.suma || '          ' || var1.maximo || '             ' || var1.minimo);
dbms_output.put_line('------------------------------------------------------');
end;

/*10*/


declare
type infoSuma is record(
nombre cliente.nombre%type,
sumaCuenta cuenta.saldo%type,
sumaDeposito deposito.cantidad%type);
iSuma infoSuma;

cursor datosCliente is select nombre, sum(saldo) as sumaCuenta , sum(cantidad) as sumaDeposito
from cliente natural join cuenta left join deposito using (numeroC) group by nombre;

begin
open datosCliente;
dbms_output.put_line('Nombre cliente    Suma total');
loop
fetch datosCliente into iSuma;
exit when datosCliente%NOTFOUND;
if iSuma.sumaDeposito is not null then
dbms_output.put_line(iSuma.nombre || '        ' || to_char((iSuma.sumaCuenta + iSuma.sumaDeposito), '$999G999G999'));
else
dbms_output.put_line(iSuma.nombre || '        ' || to_char((iSuma.sumaCuenta), '$999G999G999'));
end if;
end loop;
close datosCliente;
end;


/*11*/

declare
cursor mostrar is select to_number(codigoC), nombreCaj, direccion, valor_hora, telefono from cajero;
type datos is record(
cod int,
nom cajero.nombreCaj%type,
dir cajero.direccion%type,
vh cajero.valor_hora%type,
tl cajero.telefono%type);
var1 datos;
varcur mostrar%rowtype;

var2 int;
begin 
select to_number(caj.codigoc) into var2 from cajero caj, deposito d where caj.codigoC=d.codigoC group by 

having count(d.codigoC) <2;
for var2 in mostrar
 loop
var1:=varcur;
      if var2=var1.cod then
        dbms_output.put_line(var1.cod);  
     end if;
 end loop;
end;

/*12*/
DECLARE
	CURSOR c1 
	IS 
	SELECT
BEGIN
END;

/*13*/

declare 
canClientes int;
canCajeros int;
letra varchar2(1);

begin 
select DBMS_RANDOM('l',1) into letra from dual;
select count(rut) into canClientes from cliente where nombre like'(letra)%';
select count(codigoc) into canCajeros from cajero where nombreCaj like'(letra)%';

dbms_output.put_line('Letra: '||letra);
dbms_output.put_line('------------------');
dbms_output.put_line('Cantidad Clientes: ' || canClientes);
dbms_output.put_line('Cantidad Cajeros: ' || canCajeros);
end;
------------------------------
DECLARE
TYPE registro IS RECORD(


/*14*/
declare 
cursor mostrar is select nombre, comuna from cliente natural join cuenta where tipo IN('ahorro','corriente');
type datoss is record(
nomcl cliente.nombre%type,
comcl cliente.comuna%type);
cont int:=1;
var1 datoss;
varcur mostrar%rowtype;

begin
for varcur in mostrar
 loop 
var1:=varcur;
               dbms_output.put_line('CLIENTE : ' || cont);
               dbms_output.put_line('Nombre: ' || var1.nomcl);
               dbms_output.put_line('Comuna: ' || var1.comcl);
               dbms_output.put_line('------------------------');
               cont:=cont+1;
 end loop;
end;