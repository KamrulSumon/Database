TABLE:
TRIANGLES: A|B|C

1.	Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
Not A Triangle: The given values of A, B, and C don't form a triangle.
Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.

	SQL:	SELECT CASE WHEN A+B<=C OR B+C<=A OR A+C<=B THEN "Not A Triangle"
            WHEN A=B AND B=C AND C=A THEN "Equilateral"
            WHEN A=B OR B=C OR C=A THEN "Isosceles"
            ELSE "Scalene" END FROM TRIANGLES;

            
2.	Generate the following two result sets:
Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format: 

There are total [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.

	SQL:	SELECT concat(Name,'(',substr(Occupation,1,1),')') AS Name 
	        FROM OCCUPATIONS 
	        ORDER BY Name;
	         
			SELECT concat('There are total',' ',count(occupation),' ',lower(occupation),'s.') AS Total 
		    FROM OCCUPATIONS 
			GROUP BY Occupation 
			ORDER BY Total;

