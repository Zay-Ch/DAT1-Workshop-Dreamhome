.open CreateingTablesDreamhome.sqlite
DROP TABLE IF EXISTS BRANCH;
DROP TABLE IF EXISTS STAFF;
DROP TABLE IF EXISTS PROPERTYFORRENT;
DROP TABLE IF EXISTS CLIENT;
DROP TABLE IF EXISTS PRIVATEOWNER;
DROP TABLE IF EXISTS VIEWING;
DROP TABLE IF EXISTS REGISTRATION;


-- Create Branch table
CREATE TABLE BRANCH (
    branchno CHAR(5) PRIMARY KEY,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    postcode VARCHAR(10) NOT NULL
);

-- Insert data into Branch table
INSERT INTO BRANCH (branchno, street, city, postcode) VALUES
('B005', '22 Deer Rd', 'London', 'SW1 4EH'),
('B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU'),
('B003', '163 Main St', 'Glasgow', 'G11 9QX'),
('B004', '32 Manse Rd', 'Bristol', 'BS99 1NZ'),
('B002', '56 Clover Dr', 'London', 'NW10 6EU');

-- Create Staff table
CREATE TABLE STAFF (
    staffno VARCHAR(5) PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')),
    dob DATE NOT NULL,
    salary INTEGER NOT NULL,
    branchno CHAR(5) NOT NULL,
    FOREIGN KEY (branchno) REFERENCES BRANCH(branchno)
);

-- Insert data into Staff table
INSERT INTO STAFF (staffno, fname, lname, position, sex, dob, salary, branchno) VALUES
('SL21', 'John', 'White', 'Manager', 'M', '1945-10-01', 30000, 'B005'),
('SG37', 'Ann', 'Beech', 'Assistant', 'F', '1960-11-10', 12000, 'B003'),
('SG14', 'David', 'Ford', 'Supervisor', 'M', '1958-03-24', 18000, 'B003'),
('SA9', 'Mary', 'Howe', 'Assistant', 'F', '1970-02-19', 9000, 'B007'),
('SG5', 'Susan', 'Brand', 'Manager', 'F', '1940-06-03', 24000, 'B003'),
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '1965-06-13', 9000, 'B005');

-- Create PropertyForRent table
CREATE TABLE PROPERTYFORRENT (
    propertyno CHAR(5) PRIMARY KEY,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    type VARCHAR(20) NOT NULL,
    rooms INTEGER NOT NULL,
    rent INTEGER NOT NULL,
    ownerno CHAR(5) NOT NULL,
    staffno VARCHAR(5),
    branchno CHAR(5) NOT NULL,
    FOREIGN KEY (ownerno) REFERENCES PRIVATEOWNER(ownerno),
    FOREIGN KEY (staffno) REFERENCES STAFF(staffno),
    FOREIGN KEY (branchno) REFERENCES BRANCH(branchno)
);

-- Insert data into PropertyForRent table
INSERT INTO PROPERTYFORRENT (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES
('PA14', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650, 'CO46', 'SA9', 'B007'),
('PL94', '6 Argyll St', 'London', 'NW2', 'Flat', 4, 400, 'CO87', 'SL41', 'B005'),
('PG4', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, 350, 'CO40', NULL, 'B003'),
('PG36', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'CO93', 'SG37', 'B003'),
('PG21', '18 Dale Rd', 'Glasgow', 'G12', 'House', 5, 600, 'CO87', 'SG37', 'B003'),
('PG16', '5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', 4, 450, 'CO93', 'SG14', 'B003');

-- Create Client table
CREATE TABLE CLIENT (
    clientno CHAR(5) PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    telno VARCHAR(20) NOT NULL,
    preftype VARCHAR(20) NOT NULL,
    maxrent INTEGER NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Insert data into Client table
INSERT INTO CLIENT (clientno, fname, lname, telno, preftype, maxrent, email) VALUES
('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425, 'john.kay@gmail.com'),
('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350, 'astewart@hotmail.com'),
('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750, 'mritchie01@yahoo.co.uk'),
('CR62', 'Mary', 'Tregear', '01224-196720', 'Flat', 600, 'maryt@hotmail.com');

-- Create PrivateOwner table
CREATE TABLE PRIVATEOWNER (
    ownerno CHAR(5) PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    telno VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
);

-- Insert data into PrivateOwner table
INSERT INTO PRIVATEOWNER (ownerno, fname, lname, address, telno, email, password) VALUES
('CO46', 'Joe', 'Keogh', '2 Fergus Dr, Aberdeen AB2 7SX', '01224-861212', 'jkeogh@lhh.com', '*******'),
('CO87', 'Carol', 'Farrel', '6 Achray St, Glasgow G32 9DX', '0141-357-7419', 'cfarrel@gmail.com', '*******'),
('CO40', 'Tina', 'Murphy', '63 Well St, Glasgow G42', '0141-943-1728', 'tinam@hotmail.com', '*******'),
('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasgow G4 0QR', '0141-225-7025', 'tony.shar@ark.com', '*******');

-- Create Viewing table
CREATE TABLE VIEWING (
    clientno CHAR(5) NOT NULL,
    propertyno CHAR(5) NOT NULL,
    viewdate DATE NOT NULL,
    comment VARCHAR(255),
    PRIMARY KEY (clientno, propertyno, viewdate),
    FOREIGN KEY (clientno) REFERENCES CLIENT(clientno),
    FOREIGN KEY (propertyno) REFERENCES PROPERTYFORRENT(propertyno)
);

-- Insert data into Viewing table
INSERT INTO VIEWING (clientno, propertyno, viewdate, comment) VALUES
('CR56', 'PA14', '2013-05-24', 'too small'),
('CR76', 'PG4', '2013-04-20', 'too remote'),
('CR56', 'PG4', '2013-05-26', NULL),
('CR62', 'PA14', '2013-05-14', 'no dining room'),
('CR56', 'PG36', '2013-04-28', NULL);

-- Create Registration table
CREATE TABLE REGISTRATION (
    clientno CHAR(5) NOT NULL,
    branchno CHAR(5) NOT NULL,
    staffno VARCHAR(5) NOT NULL,
    datejoined DATE NOT NULL,
    PRIMARY KEY (clientno, branchno),
    FOREIGN KEY (clientno) REFERENCES CLIENT(clientno),
    FOREIGN KEY (branchno) REFERENCES BRANCH(branchno),
    FOREIGN KEY (staffno) REFERENCES STAFF(staffno)
);

-- Insert data into Registration table
INSERT INTO REGISTRATION (clientno, branchno, staffno, datejoined) VALUES
('CR76', 'B005', 'SL41', '2013-01-02'),
('CR56', 'B003', 'SG37', '2012-04-11'),
('CR74', 'B003', 'SG37', '2011-11-16'),
('CR62', 'B007', 'SA9', '2012-03-07');