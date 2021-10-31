USE [Tanya]
GO


CREATE TABLE Payments (
	[payment_id] int NOT NULL,
	[date] date NOT NULL,
	[family_member] int NOT NULL,
	[good] int NOT NULL,
	[amount] int NULL,
	[unit_price] int NOT NULL,
) 
GO

DELETE Payments

INSERT INTO Payments(payment_id,	date,	family_member,	good,	amount,	unit_price
) VALUES
('1',	'2005-02-12T00:00:00.000Z',	'1',	'1',	'1',	'2000'
)
GO

ALTER TABLE Payments
ADD CONSTRAINT PK_Payments_payment_id PRIMARY KEY CLUSTERED (payment_id)
GO

CREATE TABLE FamilyMembers (
    [member_id] int NOT NULL,
	[status] text NOT NULL,
	[member_name] text NOT NULL,
	[birthday] date NOT NULL
) 
GO


ALTER TABLE FamilyMembers
ADD CONSTRAINT PK_FamilyMembers_member_id PRIMARY KEY CLUSTERED (member_id)
GO


INSERT INTO FamilyMembers(member_id, status, member_name, birthday)
VALUES
(
1, 'father', 'Headley Quincey', '1960-05-13T00:00:00.000Z'
);

/* привязка ключа 21 */
ALTER TABLE FamilyMembers
WITH CHECK ADD CONSTRAINT FK_FamilyMembers_member_id FOREIGN KEY (member_id)
REFERENCES Payments (payment_id)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

SELECT FamilyMembers.[member_id
], Payments.unit_price
FROM Payments
JOIN FamilyMembers
ON Payments.family_member=FamilyMembers.[member_id
]

GO

USE [Tanya]
GO

INSERT INTO Payments(payment_id, date, family_member, good, amount, unit_price)
VALUES
(
2, '2005-03-23T00:00:00.000Z', 2, 1, 1, 2100
);

INSERT INTO FamilyMembers([member_id
], [status
], [member_name
], [birthday
])
VALUES
(
2, 'mother', 'Flavia Quincey', '1963-02-16T00:00:00.000Z'
);

SELECT Payments.amount, FamilyMembers.[status
]
FROM Payments
JOIN FamilyMembers
ON Payments.payment_id=FamilyMembers.[member_id
]
GO

UPDATE Payments
SET unit_price = unit_price * 2
GO

USE [Tanya]
GO
DELETE FROM Payments
WHERE unit_price = 40
GO

USE [Tanya]
GO

SELECT Payments.good, FamilyMembers.[status
]
FROM Payments
left JOIN FamilyMembers
ON Payments.payment_id=FamilyMembers.[member_id
]
GO

SELECT *
FROM Payments
INNER JOIN FamilyMembers
ON Payments.payment_id=FamilyMembers.[member_id
]
GO
/*вытянуть все данные + те, которые не пересекаются*/
SELECT *
FROM Payments
FULL OUTER JOIN FamilyMembers
ON Payments.payment_id=FamilyMembers.[member_id
]
GO
/*вытянуть только те, которые не пересекаются*/
SELECT *
FROM Payments
FULL OUTER JOIN FamilyMembers
ON Payments.payment_id=FamilyMembers.[member_id
]
WHERE FamilyMembers.[member_id
] is  null OR Payments.family_member is  null
GO
/*вытянуть данные с табл1 из соответствиями таб2, 
если нет то null*/
SELECT *
FROM Payments
LEFT OUTER JOIN FamilyMembers
ON Payments.payment_id=FamilyMembers.[member_id
]
GO


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




