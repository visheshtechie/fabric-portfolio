[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Append"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = let
  Source = Fabric.Warehouse([CreateNavigationProperties = false, HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = "."]}[Data],
  #"Navigation 2" = #"Navigation 1"{[displayName = "MyDataWarehouse"]}[Data]
in
  #"Navigation 2";
[BindToDefaultDestination = true]
shared Silver_Locations = let
  Source = Fabric.Warehouse([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = "."]}[Data],
  #"Navigation 2" = #"Navigation 1"{[displayName = "MyDataWarehouse"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Schema = "dbo", Item = "Bronze_Locations"]}[Data],
  #"Split column by delimiter" = Table.SplitColumn(#"Navigation 3", "manager_name", Splitter.SplitTextByDelimiter(" "), {"manager_first_name", "manager_surname"})
in
  #"Split column by delimiter";
