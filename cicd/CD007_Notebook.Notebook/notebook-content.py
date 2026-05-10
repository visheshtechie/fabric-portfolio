# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "bbe6ead3-5fe3-45c9-bbb4-7305ca941ca4",
# META       "default_lakehouse_name": "CD007_Lakehouse",
# META       "default_lakehouse_workspace_id": "97ca4401-7b9f-4ffe-bde5-70288bc64837",
# META       "known_lakehouses": [
# META         {
# META           "id": "bbe6ead3-5fe3-45c9-bbb4-7305ca941ca4"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# MAGIC %%sql
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
# MAGIC -- Insert data into DimProduct
# MAGIC INSERT INTO DimProduct VALUES 
# MAGIC (1, 'Laptop', 'Electronics', 'Computers', 'TechCo'),
# MAGIC (2, 'Smartphone', 'Electronics', 'Mobile Phones', 'PhoneCorp'),
# MAGIC (3, 'Headphones', 'Electronics', 'Audio', 'SoundInc');


# METADATA ********************

# META {
# META   "language": "sparksql",
# META   "language_group": "synapse_pyspark"
# META }
