enum ToolsGroup {
  all(name: 'All', count: 1),
  generators(name: 'Generators', count: 1),
  ;

  const ToolsGroup({required this.name, required this.count});

  final String name;
  final int count;
}
