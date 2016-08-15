Desbloquear cuenta HR (cmd)
1.- sqlplus
2.- login
3.- conn / as sysdba
4.- alter user hr identified by hr account unlock;


set serveroutput on;

--EJERCICIO 1
---------------------------------------

DECLARE
	TYPE datos IS RECORD(
		v_nombre EMPLOYEES.FIRST_NAME%TYPE,
		v_apPaterno EMPLOYEES.LAST_NAME%TYPE,
		v_fechContrato EMPLOYEES.HIRE_DATE%TYPE
	);

	collectDatos datos;


BEGIN
	SELECT FIRST_NAME, LAST_NAME, HIRE_DATE INTO collectDatos FROM EMPLOYEES
	WHERE MANAGER_ID IS NULL;

	DBMS_OUTPUT.PUT_LINE('El emplado ' ||collectDatos.v_nombre ||' ' ||collectDatos.v_apPaterno ||' fué conrtradado el ' ||TO_CHAR(collectDatos.v_fechContrato, 'DD "de" Month "del año" YYYY'));

END;

/*2.-*/

DECLARE
 	v_total NUMBER(3):= 0;
 	v_depto VARCHAR2(30);

 BEGIN
 	SELECT DEPARTMENTS.DEPARTMENT_NAME INTO v_depto FROM DEPARTMENTS
 	WHERE DEPARTMENTS.DEPARTMENT_ID=50;

  	SELECT COUNT(EMPLOYEES.EMPLOYEE_ID) INTO  v_total FROM EMPLOYEES
 	WHERE EMPLOYEES.DEPARTMENT_ID=50;

 	DBMS_OUTPUT.PUT_LINE('En el departamento ' ||v_depto ||' trabajan ' ||v_total ||' empleados');

 END;

 /*3.-*/

DECLARE
	v_nombre EMPLOYEES.FIRST_NAME%TYPE;
 	v_apPaterno  EMPLOYEES.LAST_NAME%TYPE;

BEGIN
 	SELECT  FIRST_NAME, LAST_NAME INTO v_nombre, v_apPaterno FROM EMPLOYEES
 	WHERE SALARY=(SELECT MIN(SALARY) FROM EMPLOYEES);
 	
 	DBMS_OUTPUT.PUT_LINE('El empleado ' ||v_nombre ||' ' ||v_apPaterno ||' es el empleado con el salario más bajo' );
 END;


 /*4.-*/

DECLARE
	v_promComision NUMERIC;
BEGIN

	SELECT ROUND(SUM(SALARY*COMMISSION_PCT)/COUNT(*)) INTO v_promComision FROM EMPLOYEES ;
	DBMS_OUTPUT.PUT_LINE('El promedio de comision es $' ||v_promComision);
END;

/*5.-*/

DECLARE
	v_depId NUMERIC;
	v_depName DEPARTMENTS.DEPARTMENT_NAME%TYPE;
	v_depLocat DEPARTMENTS.LOCATION_ID%TYPE;
	v_manId DEPARTMENTS.MANAGER_ID%TYPE;

BEGIN
  
	SELECT DEPARTMENT_ID into v_depId from EMPLOYEES group by DEPARTMENT_ID HAVING COUNT(*) =(
  		SELECT MAX(COUNT(EMPLOYEES.EMPLOYEE_ID)) FROM EMPLOYEES
 		GROUP BY EMPLOYEES.DEPARTMENT_ID);
 		DBMS_OUTPUT.PUT_LINE('Department id ' ||v_depId);

 	SELECT DEPARTMENT_NAME, LOCATION_ID, MANAGER_ID INTO v_depName,v_depLocat, v_manId  FROM DEPARTMENTS WHERE DEPARTMENT_ID =v_depId;
	
	DBMS_OUTPUT.PUT_LINE('La informacion del departamento con mayor cantidad de empleados es la siguiente');
	DBMS_OUTPUT.PUT_LINE('Identificacion: ' ||v_depId);
	DBMS_OUTPUT.PUT_LINE('Nombre: ' ||v_depName);
	DBMS_OUTPUT.PUT_LINE('Jefe: ' ||v_manId);
	DBMS_OUTPUT.PUT_LINE('Ubicacaion: ' ||v_depLocat);
	
  END;
  
  /*6.-*/
  DECLARE
	v_nombre EMPLOYEES.FIRST_NAME%TYPE;
 	v_apPaterno  EMPLOYEES.LAST_NAME%TYPE;
	v_salary EMPLOYEES.SALARY%TYPE;
	v_bono number;

BEGIN
 	SELECT  FIRST_NAME, LAST_NAME, SALARY INTO v_nombre, v_apPaterno, v_salary FROM EMPLOYEES
 	WHERE SALARY=(SELECT MIN(SALARY) FROM EMPLOYEES);
 	
	v_bono:= v_salary*(ROUND(v_salary/1000)/100);
 	DBMS_OUTPUT.PUT_LINE('El salario del empleado ' ||v_nombre ||' ' ||v_apPaterno ||' es de: $'  ||v_salary);
	DBMS_OUTPUT.PUT_LINE('Por lo tanto su bono es de $' ||v_bono);
 END;
 
--EJERCICIO 2
---------------------------------------

DECLARE
 TYPE datos IS RECORD(
	v_maxSalary NUMERIC,
	v_avgSalary NUMERIC,
	v_minSalary NUMERIC,
	v_totalSalary NUMERIC,
	v_totalEmpl NUMERIC
 );
 
 collectDatos datos;
 
 BEGIN
	SELECT MAX(SALARY), AVG(SALARY), MIN(SALARY), SUM(SALARY), count(*) INTO collectDatos FROM EMPLOYEES;
	DBMS_OUTPUT.PUT_LINE('					INFORME DE LA EMPRESA ' ||sysdate);
	DBMS_OUTPUT.PUT_LINE('');
	DBMS_OUTPUT.PUT_LINE('Salario Maximo		Salario Promedio		Salario Minimo		Salario Total');
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------');
	DBMS_OUTPUT.PUT_LINE(collectDatos.v_maxSalary		||'              $'||collectDatos.v_avgSalary		||'               $'||collectDatos.v_minSalary		||'               $'||collectDatos.v_totalSalary);
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Los valoeres calculados están efecutuados sobre ' ||collectDatos.v_totalEmpl ||' empleados');
	
END;

/*2*/
DECLARE

	v_nom departments.department_name%type;
	total int;

BEGIN

dbms_output.put_line('INFORME PARA REDISTRIBUIR EMPLEADOS');
dbms_output.put_line('---------------------------------------------');
dbms_output.put_line('departamento'||'        '||'Total Empleados');
dbms_output.put_line('---------------------------------------------');

	SELECT department_name into v_nom
	FROM hr.departments JOIN hr.employees USING(department_id)
	where rownum=1	
	GROUP BY department_name
	HAVING COUNT(department_id)=(SELECT MIN(COUNT(department_id)) 
	FROM hr.departments JOIN hr.employees USING(department_id)
	GROUP BY department_name);

	SELECT MIN(COUNT(*)) into total 
	FROM hr.departments JOIN hr.employees USING(department_id)
	GROUP BY department_name;

	dbms_output.put_line(v_nom||'             '||total );

	SELECT UNIQUE(department_name) into v_nom
	FROM hr.departments JOIN hr.employees USING(department_id)
	GROUP BY department_name
	HAVING COUNT(*)=(SELECT MAX(COUNT(*)) 
	FROM hr.departments JOIN hr.employees USING(department_id)
	GROUP BY department_name);

	SELECT MAX(COUNT(*)) into total
	FROM hr.departments JOIN hr.employees USING(department_id)
	GROUP BY department_name;

	dbms_output.put_line(v_nom||'                  '||total );
	END;
  

  

 