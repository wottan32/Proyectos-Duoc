CREATE TABLE AUTOR (
cod_autor number PRIMARY KEY, 
nombre_autor varchar2 (50) not null, 
fecha_nacimiento varchar2 (10), 
nacionalidad varchar2 (30));


CREATE TABLE LIBRO (
cod_libro number primary key, 
titulo varchar2 (70) not null, 
cod_autor number, año number, 
nom_editorial varchar2(40), precio number,  
FOREIGN KEY (cod_autor) REFERENCES autor(cod_autor));

begin
insert into autor values(10,'alejandro dumas','10-10-1802','francesa');
insert into autor values(12,'ruben dario','02-12-1867','nicaraguense');
insert into autor values(11,'mark twain','11-06-1835','estadounidense');
insert into autor values(13,'victor hugo','04-10-1802','francesa');
insert into autor values(14,'Miguel de Cervantes','08-03-1878','Española');


insert into libro values(102,'los tres mosqueteros',10,2003,'altazor',15700);
insert into libro values(101,'el conde de montecristo',10,2004,'antares',12500);
insert into libro values(103,'las aventuras de tom sawyer',11,2002,'contrapunto',17800);
end;

OPERADOR JOIN
Mostar los nombres del autor y nombre de los libros registrados en la base de datos



1) Concentracion interna

Mostar los nombres del autor y nombre de los libros registrados en la base de datos
select nombre_autor "Autor", titulo "Libro"
from autor, libro where autor.cod_autor=libro.cod_autor;


	a) se utiliza cuado el PK y el FK tienen el mismo nombre
		SELECT nombre_autor "Autor", titulo "Libro"
		FROM autor NATURAL JOIN LIBRO;
		
		ejemplo ficticio cuando se utilizan mas tablas
		SELECT nombre_autor "Autor", titulo "Libro"
		FROM autor NATURAL JOIN LIBRO NATURAL JOIN EDITORIAL;
	
	b) se utiliza cuado el PK y el FK tienen el mismo nombre
		SELECT nombre_autor "Autor", titulo "Libro"
		from autor join libro using(cod:autor);
		
	c) se utiliza cuado el PK y el FK tienen distinto nombre
		SELECT nombre_autor "Autor", titulo "Libro"
		from autor join libro on cod_autor= id_autor;	
	
2) Concentracion Externa
-LEFT, RIGHT FULL

Mostrar la cantidad de libros editados por autor

SELECT nombre_autor "Autor", count(cod_libro)"Cantidad libros"
FROM LIBRO, AUTOR
WHERE AUTOR.cod_autor=libro.cod_autor
GROUP BY nombre_autor;

--error, no muestra los autores que no tienen libros

	a)	
	
		SELECT nombre_autor "Autor", count(cod_libro)"Cantidad libros"
		FROM LIBRO RIGHT NATURAL JOIN LIBRO
		GROUP BY nombre_autor;
		
		SELECT nombre_autor "Autor", count(cod_libro)"Cantidad libros"
		FROM AUTOR NATURAL LEFT JOIN LIBRO
		GROUP BY nombre_autor;
	
	DA LO MISMO EL ORDEN
		SELECT nombre_autor "Autor", count(cod_libro)"Cantidad libros"
		FROM LIBRO, AUTOR NATURAL FULL JOIN LIBRO
		GROUP BY nombre_autor;
	
	b)


		
	c) 
