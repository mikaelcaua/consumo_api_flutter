
class PlayerTeam {
  final int id;
  final String name;
  final String position;
  final String dateOfBirth;
  PlayerTeam({required this.name, required this.position, required this.id, required this.dateOfBirth});



  @override
  String toString() {
    return 'PlayerTeam(id: $id, name: $name, position: $position, dateOfBirth: $dateOfBirth)';
  }
}
