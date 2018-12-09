1.	Напишите отчёт, в котором отражена структура отдела, которым руководит Mourgos. 
Выведите фамилии, оклады и номер отдела сотрудников. 

SELECT last_name, salary, department_id        
FROM employees        
START WITH last_name = 'Mourgos'        
CONNECT BY PRIOR employee_id = manager_id;

2.	Создайте отчёт, который показывает иерархию менеджеров, 
которым подчиняется сотрудник Lorentz. 
Выведите сначала менеджера, перед которым непосредственно отчитывается Lorentz.

SELECT last_name        
FROM employees        
WHERE last_name != 'Lorentz'        
START WITH last_name = 'Lorentz'        
CONNECT BY PRIOR manager_id = employee_id;

3.	Создайте отчёт с отступом, в котором отражается иерархия управления, 
начиная с сотрудника по фамилии Kochhar. 
Выведите фамилии, номера менеджеров и номера отделов сотрудников. 
Назовите столбцы как показано в примере выходных результатов. 

COLUMN name FORMAT A20    
SELECT LPAD(last_name, LENGTH(last_name)+(LEVEL*2)-2,'_')                
name,manager_id mgr, department_id deptno    
FROM employees    
START WITH last_name = 'Kochhar'                     
CONNECT BY PRIOR employee_id = manager_id    
/    COLUMN name CLEAR

4.	Создайте отчёт, отражающий иерархию управления компанией. 
Начните с сотрудника самого высокого уровня и 
исключите из выходных данных всех служащих с идентификатором должности IT_PROG, 
а также сотрудника De Haan и всех, кто перед ним отчитывается. 

SELECT last_name,employee_id, manager_id        
FROM   employees        
WHERE  job_id != 'IT_PROG'         
START WITH manager_id IS NULL        
CONNECT BY PRIOR employee_id = manager_id        
AND last_name != 'De Haan';