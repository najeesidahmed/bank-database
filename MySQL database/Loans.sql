CREATE TABLE Loans(LoanID int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, CustomerID int(11) NOT NULL, LoanAmount decimal(10,2) NOT NULL, -- Creates Loan table
PaymentRate decimal(10,2) NOT NULL, MonthlyPayments int(11) NOT NULL,                                 -- with LoanID as Primary Key
FirstPaymentDate date NOT NULL, 
PaymentDay varchar(20) NOT NULL)ENGINE=INNODB DEFAULT CHARSET=utf8 AUTO_INCREMENT = 1;


INSERT INTO Loans(CustomerID, LoanAmount, PaymentRate, -- Populates Loans table with data 
MonthlyPayments, FirstPaymentDate, PaymentDay) 
VALUES (2, 3000, 120, 25, '2021-04-03', 3),
(3, 10000, 500, 20, '2021-05-10', 10),
(5, 2700, 168.75, 16, '2021-05-22', 22),
(6, 3500, 175, 20, '2021-06-18', 18),
(8, 4000, 160, 25, '2021-07-01', 1),
(10, 7500, 375, 20, '2021-07-20', 20),
(11, 1000, 62.50, 16, '2021-07-05', 5)

ALTER TABLE Loans -- Assigns CustomerID on Loans as Foreign Key, Referencing CustomerID on Customers table
ADD CONSTRAINT FOREIGN KEY (CustomerID) -- which links the two tables together so that Customer information 
REFERENCES Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE -- is available for those with loans 
