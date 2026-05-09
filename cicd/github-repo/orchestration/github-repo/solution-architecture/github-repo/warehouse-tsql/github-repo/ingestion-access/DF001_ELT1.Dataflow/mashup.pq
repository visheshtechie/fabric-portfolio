[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Bronze_Locations_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "id", DestinationColumnName = "id"], [SourceColumnName = "organization_id", DestinationColumnName = "organization_id"], [SourceColumnName = "accessibility", DestinationColumnName = "accessibility"], [SourceColumnName = "admin_emails", DestinationColumnName = "admin_emails"], [SourceColumnName = "alternate_name", DestinationColumnName = "alternate_name"], [SourceColumnName = "description", DestinationColumnName = "description"], [SourceColumnName = "email", DestinationColumnName = "email"], [SourceColumnName = "location_name", DestinationColumnName = "location_name"], [SourceColumnName = "manager_name", DestinationColumnName = "manager_name"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Bronze_Locations = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/LearnMicrosoftFabric/dojo/main/datasets/locations2.csv"), [Delimiter = ",", Columns = 9, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"id", Int64.Type}, {"organization_id", Int64.Type}, {"accessibility", type text}, {"admin_emails", type text}, {"alternate_name", type text}, {"description", type text}, {"email", type text}, {"location_name", type text}, {"manager_name", type text}})
in
  #"Changed column type";
shared Bronze_Locations_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false, HierarchicalNavigation = null]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[displayName = "MyDataWarehouse"]}[Data],
  TableNavigation = Navigation_2{[Item = "Bronze_Locations", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
