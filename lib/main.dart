import 'package:consumo_api_flutter/repositories/football_repository.dart';

void main() async{
  FootballRepository footballRepository = FootballRepository();

  print(await footballRepository.getAllPlayersForOneTeam(1783));
}
