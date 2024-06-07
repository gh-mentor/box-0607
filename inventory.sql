/*
This file contains a script of Transact SQL (T-SQL) command to interact with a database named 'Inventory'.
Requirements:
- SQL Server 2022 is installed and running
- database 'Inventory' already exists.
Details:
- Sets the default database to 'Inventory'.
- Creates a 'categories' table and related 'products' table if they do not already exist.
- Remove all rows from the tables (in case they already existed).
- Populates the 'Categories' table with sample data.
- Populates the 'Products' table with sample data.
- Creates stored procedures to get all categories.
- Creates a stored procedure to get all products in a specific category.
- Creates a stored procudure to get all products in a specific price range sorted by price in ascending order
Errors:
- if the database 'Inventory' does not exist, the script will print an error message and exit.
*/

-- Set the default database to 'Inventory'
USE Inventory;

-- Create the 'Categories' table if it does not already exist
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Categories]
    (
        [CategoryId] INT PRIMARY KEY,
        [CategoryName] NVARCHAR(50) NOT NULL
    );
END;

-- Create the 'Products' table if it does not already exist
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Products]
    (
        [ProductId] INT PRIMARY KEY,
        [ProductName] NVARCHAR(50) NOT NULL,
        [CategoryId] INT NOT NULL,
        [Price] DECIMAL(10, 2) NOT NULL,
        -- add a created date column
        [CreatedDate] DATETIME NOT NULL DEFAULT GETDATE(),
        -- add a modified date column
        [ModifiedDate] DATETIME NOT NULL DEFAULT GETDATE(),
        FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
    );
END;

-- Remove all rows from the 'products' table
TRUNCATE TABLE [dbo].[Products];

-- Remove all rows from the 'categories' table
TRUNCATE TABLE [dbo].[Categories];

-- Populate the 'Categories' table with sample data
INSERT INTO [dbo].[Categories] (CategoryId, CategoryName) VALUES (1, 'Electronics');
INSERT INTO [dbo].[Categories] (CategoryId, CategoryName) VALUES (2, 'Clothing');
INSERT INTO [dbo].[Categories] (CategoryId, CategoryName) VALUES (3, 'Books');

-- Populate the 'Products' table with sample data
INSERT INTO [dbo].[Products] (ProductId, ProductName, CategoryId, Price) VALUES (1, 'Laptop', 1, 999.99);
INSERT INTO [dbo].[Products] (ProductId, ProductName, CategoryId, Price) VALUES (2, 'Smartphone', 1, 599.99);
INSERT INTO [dbo].[Products] (ProductId, ProductName, CategoryId, Price) VALUES (3, 'T-shirt', 2, 19.99);
INSERT INTO [dbo].[Products] (ProductId, ProductName, CategoryId, Price) VALUES (4, 'Jeans', 2, 39.99);
INSERT INTO [dbo].[Products] (ProductId, ProductName, CategoryId, Price) VALUES (5, 'Novel', 3, 9.99);
INSERT INTO [dbo].[Products] (ProductId, ProductName, CategoryId, Price) VALUES (6, 'Textbook', 3, 59.99);

-- Create a stored procedure to get all categories
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllCategories]') AND type in (N'P'))
BEGIN
    DROP PROCEDURE [dbo].[GetAllCategories];
END;

CREATE PROCEDURE [dbo].[GetAllCategories]
AS
BEGIN
    SELECT * FROM [dbo].[Categories];
END;


