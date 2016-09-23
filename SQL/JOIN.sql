TABLE:

CITY: ID|NAME|COUNTRYCODE|DISTRICT|POPULATION
COUNTRY: CODE|NAME|CONTINENT|REGION|SURFACEAREA|INDEPYEAR|POPULATION|LIFEEXPECTANCY|GNP|GNPOLD| LOCALNAME|GOVERNMENTFORM|HEADOFSTATE|CAPITAL|CODE2          



1. Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

	SQL:	SELECT SUM(C.POPULATION) FROM CITY C JOIN COUNTRY CT ON C.COUNTRYCODE = CT.CODE WHERE CT.CONTINENT='Asia';
	

2.	Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.  

	SQL:	SELECT C.NAME FROM CITY C JOIN COUNTRY CT ON C.COUNTRYCODE = CT.CODE WHERE CT.CONTINENT='Africa';
	
	
3.	Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns. Do not include continents without cities in your output.

	SQL:	SELECT CT.CONTINENT, FLOOR(AVG(C.POPULATION)) FROM CITY C JOIN COUNTRY CT ON C.COUNTRYCODE = CT.CODE GROUP BY CT.CONTINENT;
	
	
	
TABLE:
Students: ID|Name|Marks
Grades: Grade|Min_Marks|Max_Marks	
4.	You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.Ketty gives Eve a task to generate a report containing three columns:  Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (1-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their marks in ascending order.

	SQL:	SELECT
			if(Grades.Grade < 8, concat('NULL'),Students.Name), 
			Grades.Grade,
			Students.Marks
			From Students 
			join Grades on Students.Marks>=Grades.Min_Mark AND Students.Marks<=Max_Mark
			ORDER BY Grades.Grade Desc, Students.Name;
			
			ALT: SELECT Name,Grade,Marks FROM Students,Grades WHERE Marks BETWEEN Min_Mark AND Max_Mark and Grade>=8 ORDER BY Grade desc,Name;
                 SELECT null,Grade,Marks FROM Students,Grades WHERE Marks BETWEEN Min_Mark AND Max_Mark and Grade<8 ORDER BY Grade desc,Name,Marks;
                 
           ALT: SELECT
					Case when G.Grade < 8 THEN NULL ELSE S.Name END,
					G.Grade,
					S.Marks
				FROM
					Students AS S
				INNER JOIN
					Grades As G
					ON S.Marks BETWEEN G.Min_Mark and G.Max_Mark
				ORDER BY
		
					G.Grade DESC,
					Case when G.Grade < 8 THEN NULL ELSE S.Name END,    
					Case when G.Grade < 8 THEN S.Marks else 0 end


5.	Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

	SQL:	
			SELECT sub.hacker_id, hak.name
			FROM submissions sub
			JOIN hackers hak ON(sub.hacker_id = hak.hacker_id)
			JOIN challenges cha ON (sub.challenge_id = cha.challenge_id)
			JOIN difficulty dif ON(cha.difficulty_level = dif.difficulty_level)
			WHERE sub.score = dif.score
			GROUP BY sub.hacker_id, hak.name
			HAVING count(sub.hacker_id) > 1
			ORDER BY count(sub.score) desc, sub.hacker_id;

