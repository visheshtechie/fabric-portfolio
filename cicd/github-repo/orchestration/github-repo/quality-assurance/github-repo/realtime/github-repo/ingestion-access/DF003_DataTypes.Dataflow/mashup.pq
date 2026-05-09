[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Transactions_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "TransactionId", DestinationColumnName = "TransactionId"], [SourceColumnName = "CustomerId", DestinationColumnName = "CustomerId"], [SourceColumnName = "TransactionAmount", DestinationColumnName = "TransactionAmount"], [SourceColumnName = "Currency", DestinationColumnName = "Currency"], [SourceColumnName = "TransactionDatetime", DestinationColumnName = "TransactionDatetime"], [SourceColumnName = "AccountCreationDatetime", DestinationColumnName = "AccountCreationDatetime"], [SourceColumnName = "LastModifiedDate", DestinationColumnName = "LastModifiedDate"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Transactions = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "ac0c1d28-1ea5-4c68-8f4e-c84b8cfe5841"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "feaaf6a1-030d-4020-b281-9846831c3ba7"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 4" = #"Navigation 3"{[Name = "Transactions.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 4", [Delimiter = ",", Columns = 7, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"CustomerId", Int64.Type}, {"TransactionId", Int64.Type}, {"TransactionAmount", type number}, {"Currency", type text}, {"TransactionDatetime", type datetime}, {"AccountCreationDatetime", type datetime}, {"LastModifiedDate", type text}}),
  #"Changed column type with locale" = Table.TransformColumnTypes(#"Changed column type", {{"LastModifiedDate", type datetime}}, "en-US")
in
  #"Changed column type with locale";
shared Transactions_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false, HierarchicalNavigation = null]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[displayName = "MyDataWarehouse"]}[Data],
  TableNavigation = Navigation_2{[Item = "Transactions", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
