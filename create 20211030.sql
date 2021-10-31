USE [20211030]
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

ALTER TABLE Payments
ADD CONSTRAINT PK_Payments_payment_id PRIMARY KEY CLUSTERED (payment_id)
GO

INSERT INTO Payments(payment_id, date, family_member, good, amount, unit_price)
VALUES
(
1, '2005-02-12T00:00:00.000Z', 1, 1, 1, 2000
);

/************************************************************************/

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

ALTER TABLE FamilyMembers
WITH CHECK ADD CONSTRAINT FK_FamilyMembers_member_id FOREIGN KEY (member_id)
REFERENCES Payments (payment_id)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

INSERT INTO FamilyMembers(member_id, status, member_name, birthday)
VALUES
(
1, 'father', 'Headley Quincey', '1960-05-13T00:00:00.000Z'
);


