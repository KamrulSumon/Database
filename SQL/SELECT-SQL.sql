Table:

CITY:  ID|NAME|COUNTRYCODE|DISTRICT|POPULATION  
(MySQL)

1.  Query all columns for all American cities in CITY with populations larger than 100,000. The CountryCode for America is USA.

	SQL:	SELECT * FROM CITY WHERE POPULATION > 100000 AND COUNTRYCODE='USA';

2.	Query the names of all American cities in CITY with populations larger than 120,000. The CountryCode for America is USA.

	SQL:	SELECT NAME FROM CITY WHERE POPULATION > 120000 AND COUNTRYCODE='USA';
	
3. 	Query all columns (attributes) for every row in the CITY table.

	SQL:	SELECT * FROM CITY;
	
4. 	Query all columns for a city in CITY with the ID 1661

	SQL:	SELECT * FROM CITY WHERE ID=1661;
	
5.  Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

	SQL:	SELECT * FROM CITY WHERE COUNTRYCODE='JPN';
	
6.	Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

	SQL:	SELECT NAME FROM CITY WHERE COUNTRYCODE='JPN';
	

Table:

STATION: ID|CITY|STATE|LAT_N|LONG_W
(MySQL)

1.	Query a list of CITY and STATE from the STATION table.
	
	SQL:	SELECT CITY, STATE FROM STATION;
	
2.	Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from 	  your answer.

	SQL:	SELECT DISTINCT CITY FROM STATION WHERE ID%2 = 0; //ALT: SELECT DISTINCT CITY FROM STATION WHERE MOD(ID,2) = 0;

3.	Let  be the number of CITY entries in STATION, and let  be the number of distinct CITY names in STATION; query the value of  from STATION. In   other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

	SQL:	SELECT COUNT(CITY)-COUNT(DISTINCT(CITY)) FROM STATION;	

4.	Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

	SQL:  MYSQL
	
	SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY), CITY ASC LIMIT 1;
	SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY DESC LIMIT 1;
			
	SQL: Oracle
	SELECT * FROM (SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY), CITY) WHERE ROWNUM = 1 

	SELECT * FROM (SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY) WHERE ROWNUM = 1;
	SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY),CITY FETCH FIRST 1 ROWS ONLY;
	
5.	Query the list of CITY names starting with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

	SQL: MYSQL
	SELECT DISTINCT city FROM station WHERE city REGEXP "^[aeiou].*";
	ALT:  SELECT CITY FROM STATION WHERE LEFT(CITY,1) IN ('a','e','i','o','u') GROUP BY CITY;
	
6.	Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

	SQL: SELECT DISTINCT city FROM station WHERE city REGEXP "[aeiou]$";
	
7.	Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
	
	SQL:	SELECT DISTINCT city FROM station WHERE city REGEXP "[aeiou]$" and city REGEXP "^[aeiou]";
	
8.	Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

	SQL:	SELECT DISTINCT city FROM station WHERE city NOT REGEXP "^[aeiou]";
	
9.	Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

	SQL:	SELECT DISTINCT city FROM station WHERE city NOT REGEXP "[aeiou]$"; // "[^aeiou]$"
	
10.	Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

	SQL:	SELECT DISTINCT city FROM station WHERE city NOT REGEXP "[aeiou]$" OR city NOT REGEXP "^[aeiou]";
	ALT:	select distinct city from station where lower(city) NOT LIKE '[aeiou]%[aeiou]' order by city
	
11.	Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

	SQL:	SELECT DISTINCT city FROM station WHERE city NOT REGEXP "[aeiou]$" AND city NOT REGEXP "^[aeiou]";
	ALT:	select distinct city from station where ((lower(city) NOT LIKE '[aeiou]%') AND (lower(city) NOT LIKE '%[aeiou]')) order by city

Table:

STUDENTS: ID|Name|Marks

1.	Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

	SQL:	SELECT Name FROM STUDENTS WHERE Marks > 75 ORDER BY RIGHT(Name, 3), ID;
	ALT:	SELECT Name FROM STUDENTS WHERE Marks > 75 ORDER BY substr(Name, -3), ID;

TABLE:

Employee: employee_id|name|months|salary
	
1.	Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
	
	SQL:	SELECT NAME FROM EMPLOYEE ORDER BY NAME;
	
2.	Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.

	SQL:	SELECT NAME FROM Employee WHERE Salary > 2000 AND Months < 10 ORDER BY employee_id;
	

