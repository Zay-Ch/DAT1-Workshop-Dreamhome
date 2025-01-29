.open dreamhome.sqlite
.mode column

-- 3.1 We're reaching out to property owners whose first name starts with 'C' for a special promotion. Please provide their details.

SELECT * 
FROM PRIVATEOWNER 
WHERE fname LIKE 'C%';


-- 3.2 Categorize our properties based on their rent for our new pricing strategy. Use 'Budget' for rent < 500, 'Standard' for rent between 500 and 1000, and 'Premium' for rent > 1000.

SELECT propertyno, rent,
       CASE 
           WHEN rent < 500 THEN 'Budget'
           WHEN rent BETWEEN 500 AND 1000 THEN 'Standard'
           ELSE 'Premium' 
       END AS rent_category
FROM PROPERTYFORRENT;


-- 3.3 We're creating a unified mailing list. Provide a list of all individuals (clients and private owners) associated with the agency, showing their names and type.

SELECT fname, lname, email, 'Client' AS type FROM CLIENT
UNION
SELECT fname, lname, email, 'Private Owner' AS type FROM PRIVATEOWNER;

