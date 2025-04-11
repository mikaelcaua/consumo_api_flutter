class TeamModel {
  final int id;
  final String name;
  final String imageUrl;

  TeamModel({required this.id, required this.name, required this.imageUrl});

  @override
  String toString() => 'FootballTeam(id: $id, name: $name, imageUrl: $imageUrl)';
}
