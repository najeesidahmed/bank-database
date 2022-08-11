CREATE DATABASE IF NOT EXISTS bankLedger; -- Creates database

CREATE TABLE Customers(CustomerID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Creates Customers Table, 
Title varchar(25) NOT NULL, FirstName varchar(20) NOT NULL,                     -- using CustomerID as primary key
LastName varchar(30) NOT NULL, DateOfBirth date NOT NULL, 
Address1 varchar(50) NOT NULL, Address2 varchar(50) NOT NULL, 
County varchar(50), PostCode varchar(10) NOT NULL, 
Mobile varchar(20))ENGINE=INNODB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

INSERT INTO Customers (Title, FirstName, LastName, DateOfBirth, -- Populates Customers table with data
Address1, Address2, County, PostCode, Mobile) VALUES 
('Mr', 'Sammi', 'Sidahmed', '1993-06-19', '7 Shaftesbury Avenue', 'Lincoln', 
'Lincolnshire', 'LN6 0QN', '07795514358'),
('Mrs', 'Nuna', 'Kamhawi', '1995-03-03', '18 Marylebone High Street', 'London', 
NULL, 'W1U 4PA', '07725847958'),
('Mrs', 'Hanya', 'Jacko', '1997-12-30', '5 Charles Avenue', 'London', 
'Greater London', 'W2D 5GP', '07564738928'),
('Mr', 'Zacharias', 'Haile', '1991-11-05', '24 Lee Road','Leeds', 
'West Yorkshire', 'LS17 2DT', '07546389847'),
('Mrs', 'Emma', 'Watson', '1990-04-06', '92 The Block', 'Manchester', 
'Greater Manchester', 'MN10 0QT', '07998348923'),
('Dr', 'Kamil', 'Mohamed', '1952-11-01', '9 Osborne Gardens', 
'London', NULL, 'GD56 4TW', '07442892341'),
('Mrs', 'Inam', 'Ibrahim', '1962-12-23', '22 Forstreet Road', 'Nottingham', 
'Nottinghamshire', 'NG7 8TT', '07909801371'),
('Mr', 'Joseph', 'Townsend', '1989-09-23', '44 Point Square', 
'Bristol', 'Bristol', 'BR4 6YD', '07893244568'),
('Miss', 'Maggie', 'Pierce', '1990-05-13', '6 Denefield', 
'Skellingthorpe', 'Lincolnshire', 'LN10 3RD', '07933273451'),
('Mr', 'Tony', 'Yayo', '1978-10-06', '43 Potts Lane', 
'Bradford', 'West Yorkshire', 'BD76 8TU', '07112946839'),
('Dr', 'Mary', 'Jeane', '1983-09-19', '84 Park Lane', 
'Lerwick', 'Scotland', 'ZE99 3BE', '07923451029')