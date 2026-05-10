# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "0e188c91-d8d3-4e59-9d65-502fe9053b5d",
# META       "default_lakehouse_name": "CD005_Lakehouse",
# META       "default_lakehouse_workspace_id": "97ca4401-7b9f-4ffe-bde5-70288bc64837",
# META       "known_lakehouses": [
# META         {
# META           "id": "0e188c91-d8d3-4e59-9d65-502fe9053b5d"
# META         }
# META       ]
# META     }
# META   }
# META }

# MARKDOWN ********************

# ## CD005 Setup Script 
# 
# Instructions: 
# 1. Connect this notebook to your CD005_Lakehouse
# 2. Run all cells 

# CELL ********************

# MAGIC %%sql
# MAGIC -- Create DimDate table
# MAGIC CREATE TABLE DimDate (
# MAGIC     DateKey INT,
# MAGIC     Date DATE,
# MAGIC     Year INT,
# MAGIC     Quarter INT,
# MAGIC     Month INT,
# MAGIC     Day INT,
# MAGIC     DayOfWeek INT
# MAGIC );
# MAGIC 
# MAGIC -- Create DimProduct table
# MAGIC CREATE TABLE DimProduct (
# MAGIC     ProductKey INT,
# MAGIC     ProductName STRING,
# MAGIC     ProductCategory STRING,
# MAGIC     ProductSubcategory STRING,
# MAGIC     Manufacturer STRING
# MAGIC );
# MAGIC 
# MAGIC -- Create DimCustomer table
# MAGIC CREATE TABLE DimCustomer (
# MAGIC     CustomerKey INT,
# MAGIC     CustomerName STRING,
# MAGIC     CustomerGender STRING,
# MAGIC     CustomerEmail STRING,
# MAGIC     CustomerPhone STRING,
# MAGIC     CustomerAddress STRING,
# MAGIC     CustomerCity STRING,
# MAGIC     CustomerState STRING,
# MAGIC     CustomerZipCode STRING,
# MAGIC     CustomerCountry STRING
# MAGIC );
# MAGIC 
# MAGIC -- Create DimStore table
# MAGIC CREATE TABLE DimStore (
# MAGIC     StoreKey INT,
# MAGIC     StoreName STRING,
# MAGIC     StoreType STRING,
# MAGIC     StoreCity STRING,
# MAGIC     StoreState STRING,
# MAGIC     StoreCountry STRING
# MAGIC );
# MAGIC 
# MAGIC -- Create FactSales table
# MAGIC CREATE TABLE FactSales (
# MAGIC     SalesKey INT,
# MAGIC     DateKey INT,
# MAGIC     ProductKey INT,
# MAGIC     CustomerKey INT,
# MAGIC     StoreKey INT,
# MAGIC     SalesAmount DECIMAL(18, 2),
# MAGIC     QuantitySold INT
# MAGIC );
# MAGIC 
# MAGIC -- Insert data into DimDate
# MAGIC INSERT INTO DimDate VALUES 
# MAGIC (1, '2024-01-01', 2024, 1, 1, 1, 1),
# MAGIC (2, '2024-02-01', 2024, 1, 2, 1, 4),
# MAGIC (3, '2024-03-01', 2024, 1, 3, 1, 7);
# MAGIC 
# MAGIC -- Insert data into DimProduct
# MAGIC INSERT INTO DimProduct VALUES 
# MAGIC (1, 'Laptop', 'Electronics', 'Computers', 'TechCo'),
# MAGIC (2, 'Smartphone', 'Electronics', 'Mobile Phones', 'PhoneCorp'),
# MAGIC (3, 'Headphones', 'Electronics', 'Audio', 'SoundInc');
# MAGIC 
# MAGIC -- Insert data into DimCustomer
# MAGIC INSERT INTO DimCustomer VALUES 
# MAGIC (1, 'John Doe', 'Male', 'john.doe@example.com', '1234567890', '123 Elm Street', 'Springfield', 'IL', '62701', 'USA'),
# MAGIC (2, 'Jane Smith', 'Female', 'jane.smith@example.com', '0987654321', '456 Oak Avenue', 'Columbus', 'OH', '43215', 'USA'),
# MAGIC (3, 'Jim Brown', 'Male', 'jim.brown@example.com', '5678901234', '789 Pine Road', 'Austin', 'TX', '73301', 'USA');
# MAGIC 
# MAGIC -- Insert data into DimStore
# MAGIC INSERT INTO DimStore VALUES 
# MAGIC (1, 'Tech Store', 'Electronics', 'New York', 'NY', 'USA'),
# MAGIC (2, 'Mobile World', 'Electronics', 'Los Angeles', 'CA', 'USA'),
# MAGIC (3, 'Audio Hub', 'Electronics', 'Chicago', 'IL', 'USA');
# MAGIC 
# MAGIC -- Insert data into FactSales
# MAGIC INSERT INTO FactSales VALUES 
# MAGIC (1, 1, 1, 1, 1, 1000.00, 1),
# MAGIC (2, 2, 2, 2, 2, 800.00, 2),
# MAGIC (3, 3, 3, 3, 3, 150.00, 3);


# METADATA ********************

# META {
# META   "language": "sparksql",
# META   "language_group": "synapse_pyspark"
# META }
