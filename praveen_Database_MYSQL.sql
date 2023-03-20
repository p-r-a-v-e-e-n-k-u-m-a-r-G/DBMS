/*SQL is case-insensitive
But we usually use UPPERCASE for keywords
and lower case for values.

*/
USE store;
SHOW tables;
SELECT *
FROM customers;


SELECT *
FROM customers
ORDER BY first_name;

SELECT *
FROM customers
ORDER BY first_name DESC;
SELECT 1, 2;
SELECT 1+2;
SELECT 100 - 50 / 2 AS value;
SELECT 100 - 50 / 2 AS 'answer value' ;

USE store;

SELECT *
FROM customers;
SELECT first_name, last_name, points
FROM customers;

/*
Syntax of SELECT statement:
SELECT <coloumn_1>, <coloumn_2>, ... , <coloumn_n>
FROM <table_name>;
SELECT *--  all coloumns of the table
FROM <table_name>;
*/

SELECT first_name, last_name, points, points + 10 -- AS 'new points'
FROM customers;
SELECT 171*214+625  AS 'answer value' ;
SELECT first_name AS 'First Name', last_name AS 'Last Name'
FROM exercise_hr.employees;
SELECT first_name, last_name, salary, salary * 15 / 100 AS 'PF'
FROM exercise_hr.employees;
SELECT DISTINCT department_id
FROM exercise_hr.employees;

USE store;

SELECT name, unit_price,(unit_price * 1.1) AS "New Price"
FROM products;
-- Comparison operators:
-- >
-- >=
-- <
-- <=
-- =
-- != or <>
USE store;
SELECT *
FROM customers
WHERE state = 'FL';
SELECT *
FROM customers
WHERE points > 3000;
SELECT *
FROM customers
WHERE birth_date > '1990-01-01';
SELECT *
FROM customers
WHERE state != 'FL';
SELECT *
FROM customers
WHERE points > 3000 OR birth_date > '1990-01-01';
SELECT *
FROM customers
WHERE birth_date > '1889-01-01' OR  (points > 1000 AND state = 'VA');
SELECT *
FROM customers
WHERE (birth_date > '1989-01-01' AND  points > 1000) OR state = 'VA';
SELECT *
FROM customers
WHERE points > 3000 AND birth_date > '1990-01-01';
SELECT *
FROM customers
WHERE NOT ( state = 'FL');
USE exercise_hr;
SELECT first_name,last_name,hire_date
FROM employees
WHERE hire_date = "1987";
SELECT first_name,last_name,salary
FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000;
SELECT first_name,last_name,department_id
FROM employees
WHERE department_id = 30 OR department_id = 100
ORDER BY department_id ASC;
SELECT first_name,last_name,salary
FROM employees
WHERE (salary NOT BETWEEN 10000 AND 15000) AND (department_id = 30 OR department_id = 100);
SELECT *
FROM employees
WHERE last_name IN ('BLAKE', 'SCOTT', 'KING','FORD');
USE store;
SELECT *
FROM customers
WHERE state = 'FL' OR state = 'VA' OR state = 'GA';
SELECT *
FROM customers
WHERE state IN ('FL', 'VA', 'GA');
USE store;
SELECT *
FROM products
WHERE quantity_in_stock IN (49, 38, 72);
SELECT *
FROM products
WHERE quantity_in_stock != 72;
USE exercise_hr;
SELECT first_name, last_name, salary
FROM employees
WHERE NOT (salary >='10000' AND salary <= '15000');
SELECT first_name, last_name, salary
FROM employees
WHERE NOT (salary BETWEEN 10000 AND 15000);
USE store;
SELECT *
FROM customers
WHERE points BETWEEN 3000 AND 10000;
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-1-1' AND '2000-1-1';
SELECT *
FROM customers
WHERE last_name LIKE '%y';
SELECT *
FROM customers
WHERE last_name LIKE 'Mac%';
SELECT *
FROM customers
WHERE last_name LIKE 'MacCaffrey';
SELECT *
FROM customers
WHERE address LIKE '%TRAIL%' OR address LIKE '%AVENUE%';
SELECT *
FROM customers
WHERE phone LIKE '%9';
SELECT *
FROM customers
WHERE phone NOT LIKE '%9';
SELECT *
FROM customers
WHERE first_name LIKE 'ELKA' OR first_name LIKE 'AMBUR';
SELECT *
FROM customers
WHERE last_name LIKE '%EY' OR last_name LIKE '%ON';
SELECT *
FROM customers
WHERE last_name LIKE 'MY%' OR last_name LIKE '%SE%';
SELECT *
FROM customers
WHERE last_name LIKE 'R%B%' OR last_name LIKE '%U%B';
USE exercise_hr;
SELECT first_name
FROM employees
WHERE first_name LIKE "%b%" AND first_name LIKE "%c%";
SELECT last_name
FROM employees
WHERE LENGTH(last_name) = 6;
SELECT last_name
FROM employees
WHERE last_name LIKE "JOB_ID__e%";
-- Write a query to display the first_name of all employees who have both "b" and "c"
USE exercise_hr;
SELECT first_name
FROM employees
WHERE first_name LIKE '%b%c%';
-- Write a query to display the last name of employees whose names have exactly 6 characters.
SELECT *
FROM employees
WHERE last_name LIKE '______';
USE store;
-- last_names ending with y and having 5 letters
-- last_names starting with b, ending with y and have 6 letters
-- SELECT last_name
SELECT *
FROM customers
WHERE last_name LIKE "%y" AND last_name LIKE '______';
-- SELECT last_name
SELECT *
FROM customers
WHERE last_name LIKE "b%" AND last_name LIKE "%y"  AND last_name LIKE '______';
SELECT *
FROM customers
WHERE last_name LIKE 'b____y' ;
/*
REGEXP:
^ (caret) - starts with
$ - ends with
*/
SELECT *
FROM customers
WHERE last_name LIKE '%age%';
-- REGEXP - REGular EXPression
SELECT *
FROM customers
WHERE last_name REGEXP 'age';
-- Last name start with Mac
SELECT *
FROM customers
WHERE last_name REGEXP '^Mac';
-- last name ends with field
SELECT *
FROM customers
WHERE last_name REGEXP 'field$';
-- last names start with Mac or ends with field
SELECT *
FROM customers
WHERE last_name REGEXP 'Mac|field$';
-- last name contains ae/be/ce/de/ee/fe/ge/he
SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e';
/* Pattern	What the Pattern matches
*	Zero or more instances of string preceding it
+	One or more instances of strings preceding it
.	Any single character
?	Match zero or one instances of the strings preceding it.
^	caret(^) matches Beginning of string
$	End of string
[abc]	Any character listed between the square brackets
[^abc]	Any character not listed between the square brackets
[A-Z]	match any upper case letter.
[a-z]	match any lower case letter
[0-9]	match any digit from 0 through to 9.
[[:<:]]	matches the beginning of words.
[[:>:]]	matches the end of words.
[:class:]	matches a character class i.e. [:alpha:] to match letters, [:space:] to match white space, [:punct:] is match punctuations and [:upper:] for upper class letters.
p1|p2|p3	Alternation; matches any of the patterns p1, p2, or p3
{n}	n instances of preceding element
{m,n}	m through n instances of preceding element */
USE store;
SELECT *
FROM customers
WHERE last_name REGEXP 'ge|ie|me';
SELECT *
FROM customers
WHERE last_name REGEXP '[g|i|m]e';
-- 2. last names end with EY or ON
-- 3. last names start with MY or contains SE
SELECT *
FROM customers
WHERE last_name REGEXP 'EY$|ON$';
-- 3. last names start with MY or contains SE
SELECT *
FROM customers
WHERE last_name REGEXP '^MY|SE';
-- 4. last names contains B followed by R or U
SELECT *
FROM customers
WHERE last_name REGEXP 'BR'OR 'BU';
SELECT *
FROM customers
WHERE last_name REGEXP 'BR|BU';
-- 4. last names contains B followed by R or U
SELECT *
FROM customers
WHERE last_name REGEXP 'b[a-z]*[ru]';
-- NULL operater
-- SELECT customers where phone is Null
USE store;
SELECT *
FROM customers
WHERE phone = NULL;
SELECT *
FROM customers
WHERE phone IS NULL;
SELECT *
FROM customers
WHERE phone IS NOT NULL;
SHOW TABLES;
USE store;
SELECT *
FROM orders
WHERE shipper_id IS NULL ;
-- multiple coloum starting
USE exercise_hr;
--
SELECT employee_id, first_name, department_id
FROM employees
ORDER BY department_id, first_name;
SELECT employee_id, first_name, department_id
FROM employees
ORDER BY department_id, first_name DESC;
SELECT employee_id, first_name, department_id
FROM employees
ORDER BY department_id DESC , first_name;
-- Write a query to display the last name of employees having 'e' as the third character.
USE exercise_hr;
SELECT *
FROM employees
WHERE last_name LIKE '__e%';
-- Write a query to display the last name of employees having 6 characters.
SELECT *
FROM employees
WHERE last_name LIKE '______';
USE store;
-- get top 3 customers
SELECT *
FROM customers
LIMIT 3;
-- get top 3 loyal customers;
SELECT *
FROM customers
order by points DESC
 LIMIT 3;
 -- limit clause should always from the end
 -- the ordre the clause matter. SELECT -> FROM -> optionally WHERE -> optionally ORDER BY -> LIMIT
 -- Not following the order gives error...
 -- pagination
 -- page 1; 1 - 3;
 -- page 2; 4 - 6;
 -- page 3; 7 - 9;
 SELECT *
 FROM customers
 LIMIT 9, 3;
SELECT *
FROM employees
WHERE first_name = "Lex";
USE exercise_hr;
EXPLAIN SELECT *
FROM employees
WHERE first_name = "Lex";
USE employees;
EXPLAIN SELECT *
FROM employees
WHERE employees_id = 102;
SELECT *
FROM employees
WHERE last_name = 'De Haan';
EXPLAIN SELECT *
FROM employees
WHERE last_name = 'De Haan';
SELECT *
FROM employees
order by last_name DESC;
SELECT *
FROM employees
WHERE last_name = "Taylor";