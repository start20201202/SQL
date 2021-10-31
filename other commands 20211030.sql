use [20211030]

/*****************/
SELECT * FROM Payments 
WHERE payment_id IN(2,4)
GO

SELECT * FROM Payments 
WHERE payment_id IN(2,4, 5, 6, 7) AND good IN(2, 5) AND amount < 2
GO

SELECT * FROM Payments 
WHERE payment_id IN(2,4)
GO

SELECT * FROM Payments 
WHERE payment_id BETWEEN 2 AND 5 AND amount BETWEEN 1 AND 5
GO

SELECT AVG(amount) AS AMOUNT FROM Payments 
GO

SELECT SUM(amount) FROM Payments 
GO

INSERT INTO Payments (payment_id,	date,	family_member,	good,	amount,	unit_price
) VALUES ('50', GETDATE(), '6', '15', '20', '10')
GO

SELECT DISTINCT amount FROM Payments 
GO

SELECT SUM(unit_price) FROM Payments 
WHERE family_member BETWEEN 2 AND 3
GO

SELECT SUM(unit_price) FROM Payments 
WHERE payment_id IN(2,4)
GO

SELECT * FROM Payments WHERE YEAR(date) = 2021

SELECT * FROM Payments WHERE MONTH(date) = 3

SELECT * FROM Payments WHERE DAY(date) = 3

SELECT * FROM Payments WHERE MONTH(date) = 5 AND DAY(date) = 5

SELECT * FROM Payments WHERE DAY(date) IN (5, 4, 6)

SELECT * FROM Payments
WHERE date BETWEEN  '2005-02-12' AND '2021-10-29' AND unit_price > 2000

SELECT CONVERT(VARCHAR(8), GETDATE(), 2) AS [YY.MM.DD] FROM Payments

/*http://www.sql-server-helper.com/tips/date-formats.aspx */

select 3  FROM Payments

select (unit_price - amount) AS res FROM Payments

SELECT SUBSTRING(member_name, 2,10) FROM FamilyMembers

 select CONCAT(member_name, ' ', status, '!!!') AS res FROM FamilyMembers

select CONCAT(SUBSTRING(member_name, 1, 5),  '...') AS res FROM FamilyMembers

SELECT FamilyMembers.status, Payments.unit_price
FROM Payments
JOIN FamilyMembers
ON Payments.payment_id=FamilyMembers.member_id


CREATE VIEW Report AS
SELECT status
FROM FamilyMembers

SELECT * FROM Payments, FamilyMembers

SELECT * FROM Payments, FamilyMembers
WHERE Payments.payment_id = FamilyMembers.member_id

SELECT Orders.CreatedAt, Customers.FirstName, Products.ProductName 
FROM Orders
JOIN Products ON Products.Id = Orders.ProductId
JOIN Customers ON Customers.Id=Orders.CustomerId
WHERE Products.Price < 45000
ORDER BY Customers.FirstName

SELECT FamilyMembers.status, Payments.unit_price
FROM Payments
JOIN FamilyMembers
ON Payments.payment_id=FamilyMembers.member_id
WHERE Payments.unit_price < 2000
ORDER By FamilyMembers.status

SELECT status, SUM(member_id)
FROM FamilyMembers
GROUP BY status

SELECT * FROM Payments CROSS JOIN FamilyMembers

 SELECT 
 SUM(amount) OVER() AS SUM FROM Payments

 SELECT payment_id
 from Payments
 where payment_id in(2,4)

 SELECT MIN(amount) AS SUM
 from Payments

SELECT concat(left(amount, 5), + '...') FROM Payments

SELECT concat(left(amount, 5), + '...') FROM Payments

SELECT * FROM Payments
where unit_price < (SELECT AVG(unit_price) from Payments)

SELECT ((max (unit_price) - min(amount))/2 ) as avg FROM Payments
