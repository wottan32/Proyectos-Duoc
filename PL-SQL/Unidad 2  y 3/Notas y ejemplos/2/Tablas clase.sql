CREATE TABLE AUTOR (
cod_autor number PRIMARY KEY, 
nombre_autor varchar2 (50) not null, 
fecha_nacimiento varchar2 (10), 
nacionalidad varchar2 (30)
);

CREATE TABLE LIBRO (
cod_libro number primary key, 
titulo varchar2 (70) not null, 
id_autor number, año number, 
nom_editorial varchar2(40), 
precio number,  FOREIGN KEY (id_autor) REFERENCES autor(cod_autor)
);

begin
insert into autor values (10,'Alejandro Dumas',	'10-10-1802','Francesa');
insert into autor values (12,'Ruben Dario','05-12-1867','Nicaraguense');
insert into autor values (11,'Mark Twain','11-06-1835','Estadounidense');
insert into autor values (13,'Victor Hugo','04-10-1802','Francesa');

insert into libro values (102,'Los tres mosqueteros',10,2003,'Altazor',	15700);
insert into libro values (101,'El conde de Montecristo',10,2004,'Antares',12500);
insert into libro values (103,'Las Aventuras de Tom Sawyer',11,	2002,'Contrapunto',17800);
insert into libro values (104,'cantos de Vida y Esperanza',12,2002,'Antares',19800);
insert into libro values (105,'Los Miserables',13,2003,'Contrapunto',16700);
end;




/*Registros en pl/sql
Crear in bloque PL/SQL con un registro que muestr la cantidad de libros, suma y promedio de los percios de los libros 
*/

set serveroutput on;

DECLARE

TYPE CALCULOS IS RECORD(
CANT INT,
SUMA INT, --EL NOMBRE DE UN CAMPO NO  PUEDE SER UNA PALABRA RESERVADA (SUM)
PROM INT);

VAR1 CALCULOS; --EL NOMBRE DE UN REGISTRO (CALCULOS) NO PUEDE COINICIDR CON EL NOMBRE DE UNA TABLA(LIBRO, AUTOR)
FECHACTUAL DATE;


BEGIN

SELECT SYSDATE INTO FECHACTUAL FROM DUAL;
SELECT COUNT(cod_libro), SUM(precio), AVG(precio) INTO VAR1 FROM LIBRO;
DBMS_OUTPUT.PUT_LINE('RESULTADO');
DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
DBMS_OUTPUT.PUT_LINE('Cantidad de libros: '|| VAR1.CANT);
DBMS_OUTPUT.PUT_LINE('Suma precio libros: '|| VAR1.SUMA);
DBMS_OUTPUT.PUT_LINE('Promedio Precio Libros: '|| VAR1.PROM);
DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
DBMS_OUTPUT.PUT_LINE(FECHACTUAL);

end;

/*
Ejemplo 2
Crear un bloque PL/SQL con un registro que muestre el nombre del libro escrito por Victor Hugo
*/
DECLARE
TYPE datos IS RECORD(
nautor autor.nombre_autor%type,
nlibro libro.titulo%type);
var2 datos;
BEGIN
SELECT nombre_autor, titulo into var2
from autor join libro on id_autor=cod_autor
where nombre_autor='Victor Hugo';
DBMS_OUTPUT.PUT_LINE('DATOS');
DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
DBMS_OUTPUT.PUT_LINE('Autor: ' || var2.nautor);
DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
DBMS_OUTPUT.PUT_LINE('Libro: ' || var2.nlibro);
end;

/*ejemplo
ARERGLO
*/
DECLARE 
TYPE arreglo1 IS TABLE OF VARCHAR2(30)
INDEX BY BINARY_INTEGER;

VAR3 arreglo1;
BEGIN
VAR3(1):='ARICA';
VAR3(5):='CALAMA';
var3(10):='SANTIAGO';

FOR i IN VAR3.FIRST..VAR3.LAST
LOOP
	IF VAR3.EXISTS(i) THEN
	DBMS_OUTPUT.PUT_LINE('POSICION ' ||i||' '||VAR3(i));
	ELSE
	DBMS_OUTPUT.PUT_LINE('ELEMENTO ' ||i||' NO EXISTE');
	END IF;
END LOOP;
DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
DBMS_OUTPUT.PUT_LINE('CANTIDAD DE ELEMENTOS: ' ||VAR3.COUNT);
DBMS_OUTPUT.PUT_LINE('ELEMENTO ANTERIOR A LA POSICION 5' ||VAR3.PRIOR(5));
DBMS_OUTPUT.PUT_LINE('ELEMENTO POSTERIOR A LA POSICION 5' ||VAR3.NEXT(5));

END;
