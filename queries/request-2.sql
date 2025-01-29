.open dreamhome.sqlite
.mode column

-- 2.1 Find all properties managed by client 'PO4756'. We need this for a client satisfaction survey.

SELECT * 
FROM PROPERTYFORRENT 
WHERE ownerno = 'PO4756';


-- 2.2 We're auditing recent client registrations. Please provide all registrations at branch 'B052' that occurred after September 28, 2013.

SELECT * 
FROM REGISTRATION 
WHERE branchno = 'B052' AND datejoined > '2013-09-28';


-- 2.3 Provide details of the most recent property viewing for our customer feedback initiative.

SELECT * 
FROM VIEWING 
ORDER BY viewdate DESC LIMIT 1;

