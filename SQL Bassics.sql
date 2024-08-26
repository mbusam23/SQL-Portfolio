--Create a dabase and table
	CREATE DATABASE Customer
	USE Customer

	CREATE TABLE Customer (
	Firstname varchar(50),
	Lastname  varchar(50),
	Age		  int		 )

	----------------------------------------
	--Edit -> IntelliSense	->Refresh Local Cache
	--						-> Ctrl + Shift + R
	----------------------------------------

--Insert
	INSERT INTO Customer (Firstname,Lastname,Age)
	VALUES				 ('Joey','Blue',50),
						 ('Barry','Bonds',40),
		 				 ('Mike','Schmid1',40),
		 				 ('Mike','Schmid2',40),
						 ('Mike','Schmid3',40)


--Select data
	SELECT * FROM Customer
	SELECT Firstname,Age FROM Customer
--Where Clauses
	--1
	SELECT * FROM Customer
	WHERE Firstname='Joey'
	--2
	SELECT * FROM Customer
	WHERE Firstname='Joey' and Lastname='Blue'
	--3
	SELECT * FROM Customer
	WHERE Lastname LIKE 'Schmid_'
	--4
	SELECT * FROM Customer
	WHERE Lastname LIKE	'B%'

--UPDATE DATA
	UPDATE Customer
	SET Age=20
	WHERE Firstname='Joey' and Lastname='Blue'

--DELETE DATA
--Elimina la informacion de la tabla
	--1
	DELETE Customer WHERE Firstname='Joey'
	--2
	DELETE Customer WHERE Lastname LIKE 'Schmid_'
--DROP TABLE
--Elimina la tabla por completo
	CREATE TABLE Customer2 (
	Firstname varchar(50),
	Lastname  varchar(50),
	Age		  int		 )

	DROP TABLE Customer2
	
--CHANGE TABLE (NEW COLUMN,UPDATE COLUMN)
--NEW COLUMN
	ALTER TABLE Customer 
	Add City varchar(50),
		City2 varchar(50)
--UPDATE COLUMN
	--1
	UPDATE Customer
	SET City='Huancayo'
	WHERE Firstname LIKE 'Joey'
	--2
	UPDATE Customer
	SET City='Lima'
	WHERE Firstname LIKE 'Barry'
	--3
	UPDATE Customer
	SET City='Puno'
	WHERE Firstname LIKE 'Mike'
--DELETING VALUES
	UPDATE Customer
	SET	City	=''
	WHERE City	='Lima'
--DELETING ROWS
	DELETE FROM customer
	WHERE Age=20
--DELETE COLUMN
	ALTER TABLE customer
	DROP COLUMN city2


--CREATE A PRIMARY KEY
--CREATE AN INDEX
	CREATE TABLE Products(
		id			INT PRIMARY KEY identity(1,1),
		ProductName VARCHAR(50),
		Price		Float
				 )

	INSERT INTO Products	(ProductName,Price)
	VALUES					('Coca Cola',3.1),
							('Dolfins',2.5)
--CREATE MORE TABLES	
	CREATE TABLE Orders(
			OrderID int PRIMARY KEY IDENTITY(1,1),
			OrderDate Date,
			CustomerID int,
			ProductID int
					   )
	INSERT INTO Orders	(OrderDate,CustomerID,ProductID)
	VALUES				(GETDATE(),3,2)
--CREATE FOREIGNS KEYS
	--
	ALTER TABLE Customer
	ADD CustomerID INT IDENTITY(1,1) PRIMARY KEY
--CREATING FOREING KEYS
	ALTER TABLE Orders
	ADD FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
	ALTER TABLE Orders
	ADD FOREIGN KEY (ProductID) REFERENCES Products(ID)
--JOINS AND RELATIONSHIPS
	Select a.*,b.* 
	FROM			Orders	 a 
	JOIN			Products b
	ON a.ProductID = b.id

	Select a.OrderID,a.OrderDate,b.Price,b.ProductName 
	FROM			Orders	 a 
	JOIN			Products b
	ON a.ProductID = b.id

--FUNCTIONS
--GROUP BY
	SELECT * FROM Products
	SELECT * FROM Orders

	--Contamos las ordenres que hicieron los CUSTOMERS
	select Customerid, count(orderid) FROM Orders
	group by Customerid
	--Analizamoscuantos ordenes hicieron y cuanto pagaron

	Select c.Lastname,p.ProductName,p.Price ,count(o.orderid) as pedidos_by_product, SUM(p.Price) total
	FROM			Orders	 o
	JOIN			Products p on o.ProductID	= p.id
	JOIN			Customer c on o.CustomerID	= c.CustomerID
	GROUP BY  C.Lastname,p.ProductName,p.Price 
