TABLE:

CITY: ID|NAME|COUNTRYCODE|DISTRICT|POPULATION

1.	Query a count of the number of cities in CITY with populations larger than 100,000.

	SQL:	SELECT count(NAME) FROM CITY WHERE POPULATION > 100000;
	
2.	Query the total population of all cities in CITY where District is California.

	SQL:	SELECT SUM(POPULATION) FROM CITY WHERE DISTRICT='California';
	
3.	Query the average population of all cities in CITY where District is California.

	SQL:	SELECT AVG(POPULATION) FROM CITY WHERE DISTRICT='California';
	
4.	Query the average population for all cities in CITY, rounded down to the nearest integer.

	SQL:	SELECT FLOOR(AVG(POPULATION)) FROM CITY; 
			Alt: select round(avg(population)-0.5) from city
			     select cast(avg(population) as decimal(10,0)) from city;
			     
5.	Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

	SQ::	SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE='JPN';
	
6.	Query the difference between the maximum and minimum populations in CITY.


	SQL:	SELECT max(POPULATION)-min(POPULATION) AS Difference FROM CITY;

TABLE:

EMPLOYEES: ID|NAME|SALARY

7.	Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.
Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

	SQL:	SELECT CEIL(AVG(Salary)- AVG(REPLACE(Salary,'0',''))) AS AVGDIFF FROM EMPLOYEES;
	
8.	We define an employee's total earnings to be their monthly salary * months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.
	
	SQL:	select salary*months, count(*) 
	        from employee
            where salary*months = (select max(salary*months) from employee)
            
            Alt: select salary*months as earnings, count(*) from employee
		         group by earnings
		         order by earnings desc limit 1;
		         
		         select salary*months as earnings, count(*) from employee
		         group by 1
                 order by 1 desc limit 1
                 
 9.	Query the following two values from the STATION table:
The sum of all values in LAT_N rounded to a scale of  decimal places.
The sum of all values in LONG_W rounded to a scale of  decimal places.

	SQL:	SELECT ROUND(SUM(LAT_N), 2) AS lat, ROUND(SUM(LONG_W), 2) AS lon FROM STATION;
	
10.	Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to  decimal places.

	SQL:	SELECT TRUNCATE(SUM(LAT_N), 4) FROM STATION WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;
	
11.	Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to  decimal 4 places.

	SQL:	SELECT TRUNCATE(max(LAT_N),4) FROM STATION WHERE LAT_N < 137.2345;
	
12.	Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to  decimal places.

	SQL:	SELECT ROUND(LONG_W, 4) FROM STATION WHERE LAT_N = (SELECT max(LAT_N) FROM STATION WHERE LAT_N < 137.2345);
	
13.	Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to  decimal 4 places.

	SQL:	SELECT ROUND(min(LAT_N),4) FROM STATION WHERE LAT_N > 38.7780;
	
14.	Query the Western Longitude (LONG_W) for the smallest Northern Latitude (LAT_N) in STATION that is greater than 38.7780. Round your answer to  decimal 4 places.

	SQL:	SELECT ROUND(LONG_W, 4) FROM STATION WHERE LAT_N = (SELECT min(LAT_N) FROM STATION WHERE LAT_N > 38.7780);
	
15.	Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
 a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 b happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 c happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of  decimal 4 places.

	SQL:	SELECT ROUND(abs(min(LAT_N)-min(LONG_W))+abs(max(LAT_N)-max(LONG_W)), 4) FROM STATION;
	
15.	Consider P1(a,b)  and P2(c,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P1(a,b) and P2(c,d) and format your answer to display 4 decimal digits.

	SQL:	SELECT ROUND(SQRT(POWER(MAX(LONG_W)-MAX(LAT_N),2)+POWER(MIN(LONG_W)-MIN(LAT_N),2)),4) FROM STATION;
