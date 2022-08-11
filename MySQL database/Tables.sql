CREATE DATABASE IF NOT EXISTS bankLedger; -- Creates database

CREATE TABLE Customers(CustomerID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Creates Customers Table, 
Title varchar(25) NOT NULL, FirstName varchar(20) NOT NULL,                     -- using CustomerID as primary key
LastName varchar(30) NOT NULL, DateOfBirth date NOT NULL, 
Address1 varchar(50) NOT NULL, Address2 varchar(50) NOT NULL, 
County varchar(50), PostCode varchar(10) NOT NULL, 
Mobile varchar(20))ENGINE=INNODB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

INSERT INTO Customers (Title, FirstName, LastName, DateOfBirth,                    -- Populates Customers table with data
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
'Lerwick', 'Scotland', 'ZE99 3BE', '07923451029');

CREATE TABLE Accounts (AccountNumber int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, -- Creates Acounts table
SortCode varchar(20) NOT NULL, 
CustomerID int(11) NOT NULL, 
InitialDeposit int(11) NOT NULL, 
DateOpened date)ENGINE=INNODB DEFAULT CHARSET=utf8 AUTO_INCREMENT=10001000;

INSERT INTO Accounts(SortCode, CustomerID, 
InitialDeposit, DateOpened)                   -- Populates accounts table with data
VALUES('538115', 1, 200, '2020-08-22'),
('538117', 2, 100, '2021-03-15'),
('538118', 3, 5000, '2021-01-27'),
('538119', 4, 350, '2021-05-09'),
('538120', 5, 570, '2019-06-28'),
('538121', 6, 7000, '2020-11-15'),
('538122', 7, 70, '2018-07-20'),
('538123', 8, 4560, '2021-10-12'),
('538124', 9, 400, '2021-08-10'),
('538125', 10, 2900, '2020-10-11'),
('538126', 11, 150, '2021-07-30');

ALTER TABLE Accounts  -- Assigns CustomerID on Accounts as Foreign Key, referencing CustomerID on Customers 
ADD CONSTRAINT FOREIGN KEY (CustomerID) 
REFERENCES Customers(CustomerID) 
ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE Loans(LoanID int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
CustomerID int(11) NOT NULL, 
LoanAmount decimal(10,2) NOT NULL,                                         -- Creates Loan table
PaymentRate decimal(10,2) NOT NULL, MonthlyPayments int(11) NOT NULL,      -- with LoanID as Primary Key
FirstPaymentDate date NOT NULL, 
PaymentDay varchar(20) NOT NULL)ENGINE=INNODB 
DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;



INSERT INTO Loans(CustomerID, LoanAmount, PaymentRate,    -- Populates Loans table with data 
MonthlyPayments, FirstPaymentDate, PaymentDay) 
VALUES (2, 3000, 120, 25, '2021-04-03', 3),
(3, 10000, 500, 20, '2021-05-10', 10),
(5, 2700, 168.75, 16, '2021-05-22', 22),
(6, 3500, 175, 20, '2021-06-18', 18),
(8, 4000, 160, 25, '2021-07-01', 1),
(10, 7500, 375, 20, '2021-07-20', 20),
(11, 1000, 62.50, 16, '2021-07-05', 5);

ALTER TABLE Loans                         -- Assigns CustomerID on Loans as Foreign Key, Referencing CustomerID on Customers table
ADD CONSTRAINT FOREIGN KEY (CustomerID) -- which links the two tables together so that Customer information 
REFERENCES Customers(CustomerID) 
ON DELETE CASCADE ON UPDATE CASCADE;    -- is available for those with loans 

CREATE TABLE Transactions(TransactionID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,      -- Creates Transactions table, with TransactionID as primary key
CustomerID int(11) NOT NULL, Deposit decimal(10,2) DEFAULT NULL, 
Withdrawal decimal(10,2) DEFAULT NULL, TransactionDate date, 
Reference varchar(50) DEFAULT NULL)ENGINE=INNODB DEFAULT CHARSET=utf8 AUTO_INCREMENT=100;

INSERT INTO Transactions(CustomerID, Deposit, Withdrawal, 
TransactionDate, Reference)                    -- Populates Transactions table with data
VALUES (3, NULL, 30, '2021-12-29', 'ATM'),
(9, 400, NULL, '2021-12-29', 'WAGE'),
(10, NULL, 57.40, '2021-12-30', 'REFUND'),
(1, 200, NULL, '2021-12-30', NULL),
(6, NULL, 100, '2021-12-31', 'NIGHTCLUB'),
(9, NULL, 45.99, '2021-12-31', 'TESCOS'),
(2, 1000, NULL, '2022-01-01', NULL),
(7, NULL, 350, '2022-01-01', 'HOTEL'),
(4, NULL, 150.50, '2022-01-02', 'TOYS'),
(8, NULL, 200, '2021-01-02', NULL),
(11, 189.99, NULL, '2022-01-02', 'REFUND'),
(3, 45, NULL, '2022-01-03', 'JOHN'),
(2, NULL, 45.99, '2022-01-04', 'SAINSBURYS'),
(10, NULL, 29.99, '2022-01-04', NULL),
(8, NULL, 12.30, '2022-01-04', NULL),
(3, NULL, 15.99, '2022-01-05', 'SHOP'),
(9, NULL, 35.60, '2022-01-05', 'ASOS'),
(5, NULL, 300, '2022-01-05', 'BIKE SHOP'),
(7, 300, NULL, '2022-01-05', NULL),
(4, NULL, 42.50, '2022-01-06', 'SKATESHOP'),
(6, 400, NULL, '2022-01-06', 'WAGE'),
(11, NULL, 70, '2022-01-07', 'MUM'),
(2, 200, NULL, '2022-01-07', NULL),
(4, 30, NULL, '2022-01-07', 'MUM'),
(8, 150, NULL, '2022-01-08', NULL),
(5, NULL, 45, '2022-01-08', 'NICK'),
(10, 500, NULL, '2022-01-08', 'REFUND'),
(3, NULL, 67.20, '2022-01-08', NULL),
(5, 30, NULL, '2022-01-09', NULL),
(7, NULL, 45.99, '2022-01-09', 'PRESENT'),
(9, 300, NULL, '2022-01-09', 'PUB'),
(2, 160, NULL, '2022-01-10', 'MUM'),
(4, NULL, 15.99, '2022-01-10', 'KEBAB'),
(8, NULL, 67.99, '2022-01-11', NULL),
(10, NULL, 299.99, '2022-01-11', 'HOMEBASE'),
(1, 300, NULL, '2022-01-12', 'WAGE'),
(3, 45, NULL, '2022-01-12', NULL),
(9, NULL, 160, '2022-01-12', 'DRINKS'),
(6, NULL, 230, '2022-01-13', NULL),
(7, NULL, 23.50, '2022-01-13', 'PUB'),
(2, NULL, 49.99, '2022-01-13', 'SHOP'),
(4, 250, NULL, '2022-01-13', 'GRANDAD'),
(9, 25, NULL, '2022-01-14', NULL),
(1, NULL, 87.30, '2022-01-14', 'CLUB'),
(5, 32, NULL, '2022-01-14', NULL),
(4, NULL, 43.9, '2022-01-14', 'COOP'),
(3, 70, NULL, '2022-01-14', NULL),
(9, 35, NULL, '2022-01-15', 'MUM'),
(2, NULL, 42.89, '2022-01-15', 'CRYPTO'),
(4, 20, NULL, '2022-01-15', NULL),
(6, 400, NULL, '2022-01-16', 'WAGE'),
(10, 90, NULL, '2022-01-16', 'DAD');

ALTER TABLE Transactions                -- Assigns CustomerID in Transactions table as Foreign Key,
ADD CONSTRAINT FOREIGN KEY (CustomerID) -- referencing CustomerID in Customers table, allowing the tables to be linked
REFERENCES Customers(CustomerID) 
ON DELETE CASCADE ON UPDATE CASCADE;



