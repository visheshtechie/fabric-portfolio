CREATE TABLE [dbo].[MyTable] (

	[id] int NOT NULL, 
	[sales_amount] int NOT NULL, 
	[MyNewColumn] int NULL
);


GO
ALTER TABLE [dbo].[MyTable] ADD CONSTRAINT PK_Mytable primary key NONCLUSTERED ([id]);