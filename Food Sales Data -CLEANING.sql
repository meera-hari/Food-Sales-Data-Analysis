/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [CustKey]
      ,[DateKey]
      ,[Invoice Date]
      ,[Invoice Number]
      ,[Item Class]
      ,[Item Number]
      ,[Item]
      ,[Line Number]
      ,[Order Number]
      ,[Promised Delivery Date]
      ,[List Price per item]
      ,[Total Sales Amount]
      ,[Total Sales Amount Based on List Price(MSRP)]
      ,[Discount Amount(M-L)]
      ,[Sales Cost Amount(C#P)]
      ,[Sales Margin Amount(Profit)]
      ,[Sales Price per item]
      ,[Sales Quantity]
      ,[Sales Rep]
      ,[U/M]
  FROM [AMAZON SALES DATA].[dbo].[Amazon Sales Data Table]

--STEP 1) CHECKING THE NO OF ROWS AND COLUMNS:

  SELECT COUNT(*) AS NO_OF_ROWS
  FROM [Amazon Sales Data Table]; 

  SELECT COUNT(*) AS NO_OF_COLUMNS
  FROM INFORMATION_SCHEMA.COLUMNS;

--****THERE ARE 65282 ROWS AND 20 COLUMNS****

--STEP 2) CHECKING THE DATATYPES OF COLUMNS:-

SELECT COLUMN_NAME,DATA_TYPE
  FROM INFORMATION_SCHEMA.COLUMNS;

  SELECT *
  FROM INFORMATION_SCHEMA.COLUMNS;

--**** All numerical columns are of 'float' datatype, the categorical columns are of nvarchar tupe and the date columns are of datetime type.****

 
 
 -- STEP 3) CHECKING MIN VALUES IN THE COLUMN ERADICATE ANY ERRORS
  select min([List Price per item]) AS MIN_PRICE
  from [Amazon Sales Data Table]-- 0

  select min([Sales Cost Amount(C#P)]) AS MIN_PRICE
  from [Amazon Sales Data Table]-- 0

  select min([Sales Price per item]) AS MIN_PRICE
  from [Amazon Sales Data Table]-- -5000

  select min([Sales Quantity]) AS MIN_PRICE
  from [Amazon Sales Data Table]-- -1

  select min([Sales Margin Amount(Profit)]) AS MIN_PRICE
  from [Amazon Sales Data Table]-- -3932.28

  select min([Total Sales Amount]) AS MIN_PRICE
  from [Amazon Sales Data Table]-- 200.01

  select min([Total Sales Amount Based on List Price(MSRP)]) AS MIN_PRICE
  from [Amazon Sales Data Table]-- 0

  select min([Discount Amount(M-L)]) AS MIN_PRICE
  from [Amazon Sales Data Table]-- -255820.8

  -- i) LOOKING AT THE ROWS WHERE SP=-5000 AND QTY=-1
  SELECT *
  FROM [Amazon Sales Data Table]
  WHERE [Sales Price per item]=-5000

  --**** The sales price of -5000 corresponds to the sales qty of -1, which means that the item was returned and hence it is to be deleted from the sold stock.
--**** Negative Profit actually means loss.****
--**** Negative Discount means the customer has been overcharged.****

  -- CHECKING MAX VALUES IN THE COLUMN TO ERADICATE ANY ERRORS

  select max([List Price per item]) AS Max_PRICE
  from [Amazon Sales Data Table]-- 2760.7

  select max([Sales Cost Amount(C#P)]) AS Max_PRICE
  from [Amazon Sales Data Table]-- 366576 

  select max([Sales Price per item]) AS Max_PRICE
  from [Amazon Sales Data Table]-- 6035

  select max([Sales Quantity]) AS Max_PRICE
  from [Amazon Sales Data Table]-- 16000

  select max([Sales Margin Amount(Profit)]) AS Max_PRICE
  from [Amazon Sales Data Table]-- 188800
  select max([Total Sales Amount]) AS Max_PRICE
  from [Amazon Sales Data Table]-- 555376

  select max([Total Sales Amount Based on List Price(MSRP)]) AS Max_PRICE
  from [Amazon Sales Data Table]-- 632610.16

  select max([Discount Amount(M-L)]) AS Max_PRICE
  from [Amazon Sales Data Table]-- 343532.66

  -- ii) DELETING THE ROW CORR TO SP PER ITEM =-5000 AND QTY=-1

  DELETE 
  FROM [Amazon Sales Data Table]
  WHERE [Sales Price per item]=-5000

  select min([Sales Price per item]) AS MIN_PRICE
  from [Amazon Sales Data Table]-- 0.337

  select min([Sales Quantity]) AS MIN_QTY
  from [Amazon Sales Data Table]-- 0



  --STEP 4) HANDLING MISSING VALUES - IN EXCEL FORMAT, WE COME TO KNOW THAT THE COLUMNS ITEM CLASS, ITEM NUMBER, DISCOUNT AND SALES PRICE PER ITEM HAS NULL VALUES
  -- SINCE ITEM NUMBER AND ITEM CLASS ARE NOT NECESSARILY AFFECTING THE PROFIT OR SALES AMOUNT, WE CAN IGNORE IT.
  SELECT *
  FROM [Amazon Sales Data Table]
  WHERE [Sales Price per item] IS NULL;

  SELECT *
  FROM [Amazon Sales Data Table]
  WHERE [Discount Amount(M-L)] IS NULL;

  --SO CHECKING SP AND DISCOUNT OF ITEM='MONARCH MANICOTTI'
  SELECT *
  FROM [Amazon Sales Data Table]
  WHERE ITEM='Monarch Manicotti'

  --UPDATING THE SALES PRICE COLUMN WITH THE AVERAGE SP OF MONARCH MANICOTTI
  UPDATE [Amazon Sales Data Table]
  SET [Sales Price per item]= 19.85
  WHERE [Sales Price per item] IS NULL;

  UPDATE [Amazon Sales Data Table]
  SET [Discount Amount(M-L)]= [Total Sales Amount Based on List Price(MSRP)]-[Total Sales Amount]
  WHERE [Discount Amount(M-L)] IS NULL;



  --STEP 5) FINDING THE NO OF CUSTOMERS USING CUSTKEY AND NO OF ITEMS USING ITEM

  SELECT COUNT(DISTINCT(CustKey)) as No_of_Customers,COUNT(DISTINCT(Item)) as No_of_Products
  FROM [Amazon Sales Data Table]

  --**** SO THERE ARE TOTAL 615 CUSTOMERS.****



  --STEP 6) CHECKING THE NO OF RECORDS WITH 0 SALES QTY
  SELECT *
  FROM [Amazon Sales Data Table]
  WHERE [Sales Quantity]=0

  --**** JUST 1, HENCE WE CAN IGNORE IT.****


--STEP 7) CHECKING IF DATEKEY AND INVOICE DATE ARE IDENTICAL

SELECT *
FROM [Amazon Sales Data Table]
WHERE DateKey NOT IN
(SELECT [Invoice Date] FROM [Amazon Sales Data Table])

--**** THIS SHOWS THAT DATEKEY AND INVOICE DATE COLUMNS ARE IDENTICAL AND HENCE ONE CAN BE DROPPED.

-- STEP 8) DROPPING THE UNECESSARY COLUMNS

ALTER TABLE [Amazon Sales Data Table]
DROP COLUMN DateKey;

ALTER TABLE [Amazon Sales Data Table]
DROP COLUMN [Item Class];

ALTER TABLE [Amazon Sales Data Table]
DROP COLUMN [Item Number];

ALTER TABLE [Amazon Sales Data Table]
DROP COLUMN [U/M];

select * from [Amazon Sales Data Table]

--STEP 9) CHECKING THE FINAL NO OF ROWS AND COLUMNS

SELECT COUNT(*) AS NO_OF_ROWS 
FROM [Amazon Sales Data Table]--65281 ROWS
SELECT COUNT(*) AS NO_OF_COLUMNS
  FROM INFORMATION_SCHEMA.COLUMNS;--16 COLUMNS

