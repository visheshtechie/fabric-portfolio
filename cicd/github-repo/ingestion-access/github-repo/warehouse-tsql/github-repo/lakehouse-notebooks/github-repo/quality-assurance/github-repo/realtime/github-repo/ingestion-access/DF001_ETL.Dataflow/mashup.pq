[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Append"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = Fabric.Warehouse([CreateNavigationProperties = false]){[workspaceId = "ac0c1d28-1ea5-4c68-8f4e-c84b8cfe5841"]}[Data]{[warehouseId = "49357117-c5cc-4ba3-8f4d-32b08fe60a62"]}[Data];
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Silver_Addresses_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "id", DestinationColumnName = "id"], [SourceColumnName = "location_id", DestinationColumnName = "location_id"], [SourceColumnName = "organization_id", DestinationColumnName = "organization_id"], [SourceColumnName = "service_id", DestinationColumnName = "service_id"], [SourceColumnName = "first_name", DestinationColumnName = "first_name"], [SourceColumnName = "surname", DestinationColumnName = "surname"], [SourceColumnName = "title", DestinationColumnName = "title"], [SourceColumnName = "email", DestinationColumnName = "email"], [SourceColumnName = "department", DestinationColumnName = "department"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Silver_Addresses = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/LearnMicrosoftFabric/dojo/main/datasets/contacts.csv"), [Delimiter = ",", Columns = 8, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"id", Int64.Type}, {"location_id", Int64.Type}, {"organization_id", Int64.Type}, {"service_id", Int64.Type}, {"name", type text}, {"title", type text}, {"email", type text}, {"department", type text}}),
  #"Split column by delimiter" = Table.SplitColumn(#"Changed column type", "name", Splitter.SplitTextByDelimiter(" "), {"name.1", "name.2"}),
  #"Renamed columns" = Table.RenameColumns(#"Split column by delimiter", {{"name.1", "first_name"}, {"name.2", "surname"}})
in
  #"Renamed columns";
shared Silver_Addresses_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false, HierarchicalNavigation = null]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[displayName = "MyDataWarehouse"]}[Data],
  TableNavigation = Navigation_2{[Schema = "dbo", Item = "Silver_Addresses"]}[Data]
in
  TableNavigation;
