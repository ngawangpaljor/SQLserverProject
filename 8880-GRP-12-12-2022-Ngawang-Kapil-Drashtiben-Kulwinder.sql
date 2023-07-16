CREATE DATABASE Trafficcollisions
GO

USE Trafficcollisions
GO


-----3. Find out the total accidents by year from 2007 to 2017 then output them into a Line Graph.  
-----Are accidents increasing, deceasing or around the same?

SELECT 
    
	 YEAR(ACCIDENTDATE),
	 COUNT(ACCIDENT_LOCATION) AS Location,
	 SUM (ACCIDENTNUM) AS TOTALaccidents

FROM Collisions
WHERE ACCIDENTDATE BETWEEN '2007-01-02' AND '2017-12-30'
GROUP BY YEAR(ACCIDENTDATE) 
ORDER BY ACCIDENTDATE ASC


--- 4  What are the 3 most accident-prone locations?  Include the totals in a Bar Chart

SELECT 
       ACCIDENT_LOCATION,
	   COUNT (ACCIDENT_LOCATION ) AS TOTALlocation


FROM Collisions
GROUP BY ACCIDENT_LOCATION
ORDER BY TOTALlocation DESC


---5.	2012 seems to have been a bad year for accidents.  
--What can you tell about the environment conditions and lighting that impacted the volume of accidents?

SELECT 
      LIGHT,
	  ACCIDENTDATE,
	  ACCIDENT_LOCATION,
	  IMPACT_LOCATION,
	  ENVIRONMENT_CONDITION

FROM Collisions
WHERE ACCIDENTDATE BETWEEN '2012-01-01' AND '2012-12-31'


--6.	Perform a year-over-year analysis of accident data from 2007 to 2017.  
--Provide a break-down by year and month in a table with Year as row and Month as the column 

SELECT 
      MONTH(ACCIDENTDATE) AS AccidentMonth, 
	  YEAR(ACCIDENTDATE) AS AccidentYear, 
	  COUNT (ACCIDENTDATE) AS TotalAccidents
FROM Collisions

GROUP BY YEAR(ACCIDENTDATE), MONTH(ACCIDENTDATE) 
Order by YEAR(ACCIDENTDATE), MONTH(ACCIDENTDATE)

