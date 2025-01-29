.open dreamhome.sqlite
.mode column

-- 4.1 We need a comprehensive list of all rental properties, including owner details, for our annual financial report.

SELECT p.*, o.fname AS owner_fname, o.lname AS owner_lname, o.telno AS owner_telno
FROM PROPERTYFORRENT p
JOIN PRIVATEOWNER o ON p.ownerno = o.ownerno;


-- 4.2 Create a report of high-value properties (those with rent higher than average) for potential investors.

SELECT * 
FROM PROPERTYFORRENT 
WHERE rent > (SELECT AVG(rent) FROM PROPERTYFORRENT);


-- 4.3 Due to increased demand, we need to increase the rent for all Manchester properties by 10%.

UPDATE PROPERTYFORRENT SET rent = rent * 1.10 WHERE city = 'Manchester';

