.open dreamhome.sqlite
.mode column

-- 6.1 For our board meeting, we need a list of all cities where we either have a branch office or a property for rent, without duplicates.

SELECT city FROM BRANCH
UNION
SELECT city FROM PROPERTYFORRENT;


-- 6.2 We're updating our database. Please create a new table named 'propertyreviews' to store customer feedback.

CREATE TABLE propertyreviews (
    review_id SERIAL PRIMARY KEY,
    propertyno CHAR(10) REFERENCES PROPERTYFORRENT(propertyno),
    clientno CHAR(10) REFERENCES CLIENT(clientno),
    review_date DATE,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comment TEXT
);


-- 6.3 We've collected initial reviews for some properties. Please add these to our new 'property_reviews' table.

INSERT INTO propertyreviews (propertyno, clientno, review_date, rating, comment) VALUES
('PR1423', 'CL7623', '2023-05-15', 4, 'Spacious and well-maintained property. Great location.'),
('PR9478', 'CL5612', '2023-05-16', 5, 'Excellent modern amenities. Highly recommended!'),
('PR4567', 'CL7489', '2023-05-17', 3, 'Decent property, but needs some minor repairs.'),
('PR3689', 'CL6234', '2023-05-18', 4, 'Good value for money. Nice neighborhood.'),
('PR2145', 'CL7712', '2023-05-19', 2, 'Disappointing. Several issues with plumbing and heating.');


-- 6.4 To maintain data relevance, remove all property viewings that occurred before June 1, 2013.

DELETE FROM VIEWING WHERE viewdate < '2013-06-01';

