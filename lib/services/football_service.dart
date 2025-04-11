import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/team_model.dart';
import '../utils/api_key.dart';

class FootballService {
  Map<String, String> header = {'X-Auth-Token': apiToken};

  Future<List<TeamModel>> getAllTeams() async {
    try {
      String response = (await http.get(
        Uri.parse('http://api.football-data.org/v4/competitions/PL/teams'),
        headers: header,
      ))
          .body;

      Map<String, dynamic> responseConverted = jsonDecode(response);

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
