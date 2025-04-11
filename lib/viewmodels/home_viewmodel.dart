import 'package:consumo_api_flutter/services/football_service.dart';

import '../models/team_model.dart';

class HomeViewmodel {
  final FootballService footballService = FootballService();
  Future<List<TeamModel>> getAllTeams(String league) async {
    return footballService.getAllTeams(league);
  }
}
