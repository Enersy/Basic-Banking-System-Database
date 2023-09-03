/**4. Create A Database And Name It E-Banking.**/
Create database E_Banking


/**2. Create Table For Customers With The Appropriate Data Types.**/
create table Customers
(
	 CustomerID int Primary Key Identity(1,1),
	 FirstName varchar(25) NOT NULL,
	 LastName varchar(25) NOT NULL,
	 DateOfBirth DateTime NOT NULL,
	 Email  varchar(50) NOT NULL, 
	 PhoneNumber varchar(25) NOT NULL,  
	 Address varchar(25) NOT NULL,

);

/**4. Create Table For Loans With The Appropriate Data Types.**/
CREATE TABLE [dbo].[Loans](
	LoanID int primary key Identity(1,1),
	CustomerID int ,
	LoanType varchar(50) NOT NULL,
	LoanAmount decimal(18, 2) NOT NULL,
	InterestRate int NOT NULL,
	LoanTerm int NOT NULL,
	LoanStatus [nchar](10) NOT NULL,
	);

ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Loans_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON DELETE CASCADE

ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Loans_Customers]


/**5 .Populate The Tables With At Least 10 Sample Customer Records And 10 Sample Loan Records.
Ensure That Customer IDs Are Associated With Their Respective Loans.**/
Insert  into dbo.Customers values('James','Mason','1981-04-26','james.maso1n@gmail.com','07012345679','no 7 ketu street Lagos' );
Insert  into dbo.Customers values('James','Son','1982-04-26','james.mason2@gmail.com','07012345680','no 8 ketu street Lagos' );
Insert  into dbo.Customers values('James','Mson','1983-03-26','james.mason3@gmail.com','07012345681','no 9 ketu street Lagos' );
Insert  into dbo.Customers values('James','Mason','1984-04-26','james.mason4@gmail.com','07012345682','no 10 ketu street Lagos' );
Insert  into dbo.Customers values('Gift','Partey','1985-05-26','james.mason5@gmail.com','07012345683','no 11 ketu street Lagos' );
Insert  into dbo.Customers values('Monday','Blunt','1986-06-26','james.mason6@gmail.com','07012345684','no 12 ketu street Lagos' );
Insert  into dbo.Customers values('Sunday','Mason','1987-07-27','james.mason7@gmail.com','07012345685','no 13 ketu street Lagos' );
Insert  into dbo.Customers values('Friday','Havey','1988-08-28','james.mason88@gmail.com','07012345685','no 14 ketu street Lagos' );
Insert  into dbo.Customers values('Thomas','Mason','1989-09-29','james.mason99@gmail.com','07012345687','no 15 ketu street Lagos' );
Insert  into dbo.Customers values('Gideon','Victor','1990-01-01','james.mason22@gmail.com','07012345688','no 16 ketu street Lagos' );
Insert  into dbo.Customers values('Sherly','Mason','1992-02-02','james.mason11@gmail.com','07012345689','no 17 ketu street Lagos' );
Insert  into dbo.Customers values('Victor','Mason','1992-03-03','james.mason12@gmail.com','07012345690','no 618 ketu street Lagos' );
Insert  into dbo.Customers values('Mark','Mondey','1994-04-26','james.mason78@gmail.com','07012345691','no 617 ketu street Lagos' );

 

insert into dbo.Loans values(5,'Personal Loan','30000',5,24,'Pending');
insert into dbo.Loans values(7,'Personal Loan','50000',5,24,'Approved');
insert into dbo.Loans values(9,'Personal Loan','60000',5,24,'Approved');
insert into dbo.Loans values(6,'Personal Loan','70000',5,24,'Denied');
insert into dbo.Loans values(3,'Personal Loan','80000',5,24,'Approved');
insert into dbo.Loans values(12,'Personal Loan','90000',5,24,'Pending');
insert into dbo.Loans values(8,'Personal Loan','10000',5,24,'Approved');
insert into dbo.Loans values(14,'Personal Loan','20000',5,24,'Approved');
insert into dbo.Loans values(4,'Mortgage','500000',5,24,'Approved');
insert into dbo.Loans values(13,'Mortgage','600000',5,24,'Denied');
 
 
/**6. Write SQL Query Retrieve The List Of All Customers.**/
Select * from dbo.Customers


/** 7. Write SQL Query To Find The Total Number Of Loans For Each Customer.**/
Select COUNT(Loans.LoanID) As No_Of_Loan_By_Customers from Loans
where CustomerID = 3

/**8 .Write SQL Query To Calculate The Average Loan Amount.**/
Select AVG(Loans.LoanAmount) As Average_Loan_Collected
from Loans


/**9 .Write A Query To Update The Status Of A Specific Loan.**/
Update Loans
Set LoanStatus = 'Denied'
where LoanID = 7


/** 10 .Write A Query To Delete A Customer And All Associated Loans.**/
Delete Customers
FROM Customers
WHERE  Customers.CustomerID = 7
 