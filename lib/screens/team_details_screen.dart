// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:consumo_api_flutter/models/team_model.dart';
import 'package:consumo_api_flutter/widgets/player_widget.dart';
import 'package:flutter/material.dart';
import '../models/player_model.dart';
import '../services/football_service.dart';

class TeamDetailsScreen extends StatefulWidget {
  const TeamDetailsScreen({super.key, required this.teamModel});
  final TeamModel teamModel;

  @override
  State<TeamDetailsScreen> createState() => _TeamDetailsScreenState();
}

class _TeamDetailsScreenState extends State<TeamDetailsScreen> {
  final FootballService footballService = FootballService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          widget.teamModel.name,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Color(0xFF00457D),
      ),
      backgroundColor: Color(0xFF00457D),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,0,20,0),
        child: FutureBuilder<List<PlayerModel>>(
          future: footballService.getAllPlayersForOneTeam(widget.teamModel.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Erro ao carregar dados: ${snapshot.error}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'Nenhum time encontrado',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              );
            } else {
              final players = snapshot.data!;
              return ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0,8,0,8),
                    child: PlayerWidget(
                      playerModel: players[index],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
