CREATE TABLE Accounts (AccountNumber int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, -- Creates Acounts table
SortCode varchar(20) NOT NULL, 
CustomerID int(11) NOT NULL, 
InitialDeposit int(11) NOT NULL, 
DateOpened date)ENGINE=INNODB DEFAULT CHARSET=utf8 AUTO_INCREMENT=10001000;

INSERT INTO Accounts(SortCode, CustomerID, InitialDeposit, DateOpened) -- Populates accounts table with data
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
('538126', 11, 150, '2021-07-30')

ALTER TABLE Accounts -- Assigns CustomerID on Accounts as Foreign Key, referencing CustomerID on Customers 
ADD CONSTRAINT FOREIGN KEY (CustomerID) 
REFERENCES Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE