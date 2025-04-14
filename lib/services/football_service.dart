import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/team_model.dart';

class FootballService {
  Future<List<TeamModel>> getAllTeams(String league, int season) async {
    try {
      String response = (await http.get(
        Uri.parse('http://api.football-data.org/v4/competitions/$league/teams?season=$season'),
        headers: {
          'X-Auth-Token': 'SUA CHAVE',

        },
      ))
          .body;

      Map<String, dynamic> responseConverted = jsonDecode(response);
      print(responseConverted);

      List<dynamic> mapBrasiliansTeams = responseConverted['teams'];

      List<TeamModel> brasiliansTeams = mapBrasiliansTeams
          .map(
            (teamMap) => TeamModel(
              id: teamMap['id'],
              name: teamMap['shortName'],
              imageUrl: teamMap['crest'],
            ),
          )
          .toList();
      return brasiliansTeams;
    } catch (e) {
      throw Exception('Não foi possível buscar os times: $e');
    }
  }
}
