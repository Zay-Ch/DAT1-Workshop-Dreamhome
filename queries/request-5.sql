.open dreamhome.sqlite
.mode column

-- 5.1 We need to know how many properties are currently managed by staff member 'SSU15' for workload assessment.

SELECT COUNT(*) AS property_count 
FROM PROPERTYFORRENT 
WHERE staffno = 'SSU15';


-- 5.2 We need a report showing the number of properties in each city, but only for cities with more than 2 properties, to focus our resources.

SELECT city, COUNT(*) AS property_count
FROM PROPERTYFORRENT
GROUP BY city
HAVING COUNT(*) > 2;


-- 5.3 Identify all staff members who manage properties with above-average rent for our annual performance reviews.

SELECT DISTINCT s.staffno, s.fname, s.lname
FROM STAFF s
JOIN PROPERTYFORRENT p ON s.staffno = p.staffno
WHERE p.rent > (SELECT AVG(rent) FROM PROPERTYFORRENT);

