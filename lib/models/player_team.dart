class PlayerTeam {
  final int id;
  final String name;
  final String position;
  PlayerTeam({required this.name, required this.position, required this.id});

  @override
  String toString() => 'PlayerTeam(id: $id, name: $name, position: $position)';
}
