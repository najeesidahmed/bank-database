CREATE TABLE Transactions(TransactionID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Creates Transactions table, with TransactionID as primary key
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
(10, 90, NULL, '2022-01-16', 'DAD')

ALTER TABLE Transactions -- Assigns CustomerID in Transactions table as Foreign Key,
ADD CONSTRAINT FOREIGN KEY (CustomerID) -- referencing CustomerID in Customers table, allowing the tables to be linked
REFERENCES Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE
