-- Query 4.1
select * from ((Customers INNER JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID) 
INNER JOIN Loans ON Accounts.CustomerID = Loans.CustomerID) 
WHERE Loans.PaymentDay <= 7;

-- Query 4.1 using alias' to pull specific fields (including full name and account number)
select c.FirstName, c.LastName, a.AccountNumber, l.FirstPaymentDate 
from ((Customers as c INNER JOIN Accounts as a ON c.CustomerID = a.CustomerID) 
INNER JOIN Loans as l ON a.CustomerID = l.CustomerID) WHERE l.PaymentDay <= 7;

-- Query 4.2, selects all info from customer table, accounts table and transactions table 
SELECT * from ((Customers INNER JOIN Accounts 
ON Customers.CustomerID = Accounts.CustomerID) 
INNER JOIN Transactions on Accounts.CustomerID = Transactions.CustomerID) 
WHERE Transactions.TransactionDate BETWEEN '2022-01-11' AND '2022-01-16'

-- Query 4.2, using alias'
SELECT c.FirstName, c.LastName, a.AccountNumber, a.SortCode, t.TransactionDate 
from ((Customers as c INNER JOIN Accounts as a ON c.CustomerID = a.CustomerID) 
INNER JOIN Transactions as t on a.CustomerID = t.CustomerID) 
WHERE t.TransactionDate BETWEEN '2022-01-11' AND '2022-01-16' 

-- Query 4.2 using alias' to select Customer name, Account Number and Sort Code
-- and Transaction Date, ordered by transaction date
SELECT c.FirstName, c.LastName, a.AccountNumber, a.SortCode, t.TransactionDate 
from ((Customers as c INNER JOIN Accounts as a ON c.CustomerID = a.CustomerID) 
INNER JOIN Transactions as t on a.CustomerID = t.CustomerID) 
WHERE t.TransactionDate BETWEEN '2022-01-11' AND '2022-01-16' 
ORDER BY t.TransactionDate 

-- Query 4.3
CREATE TABLE TransactionsBalance(CustomerID int(11), TransactionsTotal decimal(10,2)); -- temp table

INSERT INTO TransactionsBalance(SELECT CustomerID, SUM(Deposit) - SUM(Withdrawal) 
FROM Transactions GROUP BY CustomerID);

SELECT c.FirstName, c.LastName, a.AccountNumber, a.SortCode, a.CustomerID, 
a.InitialDeposit + t.TransactionsTotal as Balance 
FROM ((Customers as c INNER JOIN TransactionsBalance as t 
ON c.CustomerID = t.CustomerID) 
INNER JOIN Accounts as a ON t.CustomerID = a.CustomerID) 
where a.InitialDeposit + t.TransactionsTotal > 5000;

Drop table TransactionsBalance;

-- Query 4.4 - Total Outstandings
SELECT
    (SELECT COALESCE(SUM(InitialDeposit),0) FROM Accounts) +
    (SELECT COALESCE(SUM(Deposit),0) FROM Transactions) -
    (SELECT COALESCE(SUM(Withdrawal),0) FROM Transactions) 
    as Total_Outstandings


-- PROCEDURES

-- 4.2 as procedure 
DELIMITER //
CREATE PROCEDURE TotalOutstandings()
BEGIN 
    SELECT
    (SELECT COALESCE(SUM(InitialDeposit),0) FROM Accounts) +
    (SELECT COALESCE(SUM(Deposit),0) FROM Transactions) -
    (SELECT COALESCE(SUM(Withdrawal),0) FROM Transactions) 
    as Total_Outstandings;
END //
DELIMITER ;

-- 4.1 as procedure 'LoanDueDay'
DELIMITER // 
CREATE PROCEDURE LoanDueDay()
BEGIN 
    select * from ((Customers INNER JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID) 
    INNER JOIN Loans ON Accounts.CustomerID = Loans.CustomerID) 
    WHERE Loans.PaymentDay <= 7;
END //
DELIMITER ;