.open dreamhome.sqlite
.mode column

-- 1.1 We need a list of all our property postcodes for a mailing campaign.

SELECT DISTINCT postcode 
FROM PROPERTYFORRENT;


-- 1.2 Provide a list of all properties and their viewing history, including those that haven't been viewed, to plan maintenance visits.

SELECT p.propertyno, p.street, p.city, p.postcode, v.view_id, v.clientno, v.viewdate, v.comment
FROM PROPERTYFORRENT p
LEFT JOIN VIEWING v ON p.propertyno = v.propertyno;


-- 1.3 We're considering expanding to areas with postcode starting 'BS1'. Can you confirm if we have any properties in these areas?

SELECT COUNT(*) AS property_count 
FROM PROPERTYFORRENT 
WHERE postcode LIKE 'BS1%';

