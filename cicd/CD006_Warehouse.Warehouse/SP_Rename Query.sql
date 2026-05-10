ALTER TABLE dbo.MyTable
ADD MyNewColumn INT NULL 

sp_rename [MyView], [MyOtherView];
sp_rename [MyOtherView],[MyView];