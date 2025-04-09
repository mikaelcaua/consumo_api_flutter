import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/football_team.dart';
import '../models/player_team.dart';
import '../utils/endpoints.dart';
import '../utils/keys/api_key.dart';

class FootballRepository {
  Map<String, String> header = {'X-Auth-Token': apiToken};

  Future<List<FootballTeam>> getAllBrasiliansTeams() async {
    try {
      String response = (await http.get(
        Uri.parse('$baseUrl/competitions/BSA/teams'),
        headers: header,
      ))
          .body;

      Map<String, dynamic> responseConverted = jsonDecode(response);

      List<dynamic> mapBrasiliansTeams = responseConverted['teams'];

      List<FootballTeam> brasiliansTeams = mapBrasiliansTeams
          .map(
            (teamMap) => FootballTeam(
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

  Future<dynamic> getAllPlayersForOneTeam(int teamId) async {
    try {
      String response = (await http.get(
        Uri.parse('$baseUrl/teams/$teamId'),
        headers: header,
      ))
          .body;

      Map<String, dynamic> responseConverted = jsonDecode(response);

      List<dynamic> mapTeamPlayers = responseConverted['squad'];


      List<PlayerTeam> teamPlayers = mapTeamPlayers
          .map(
            (playerMap) => PlayerTeam(
              id: playerMap['id'],
              name: playerMap['name'],
              position: playerMap['position'],
              dateOfBirth: playerMap['dateOfBirth']
            ),
          )
          .toList();

      return teamPlayers;
    } catch (e) {
      throw Exception('Não foi possível buscar os jogadores: $e');
    }
  }
}
