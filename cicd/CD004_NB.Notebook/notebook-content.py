# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "32a5b01d-d56f-4400-95ac-37198d7ef67c",
# META       "default_lakehouse_name": "CD004_LH2",
# META       "default_lakehouse_workspace_id": "97ca4401-7b9f-4ffe-bde5-70288bc64837",
# META       "known_lakehouses": [
# META         {
# META           "id": "2373f2ef-99ee-4715-b20b-5cf0856f1eac"
# META         },
# META         {
# META           "id": "32a5b01d-d56f-4400-95ac-37198d7ef67c"
# META         }
# META       ]
# META     },
# META     "environment": {}
# META   }
# META }

# PARAMETERS CELL ********************

my_parameter = 1

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

print('hello world')

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# MAGIC %%sparkr
# MAGIC print("Hello World")

# METADATA ********************

# META {
# META   "language": "r",
# META   "language_group": "synapse_pyspark"
# META }
