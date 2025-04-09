// ignore_for_file: public_member_api_docs, sort_constructors_first
class FootballTeam {
  final int id;
  final String name;
  final String imageUrl;

  FootballTeam({required this.id, required this.name, required this.imageUrl});

  @override
  String toString() => 'FootballTeam(id: $id, name: $name, imageUrl: $imageUrl)';
}
