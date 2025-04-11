import 'package:consumo_api_flutter/screens/team_details_screen.dart';
import 'package:consumo_api_flutter/widgets/team_widget.dart';
import 'package:flutter/material.dart';
import '../services/football_service.dart';
import '../models/team_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FootballService footballService = FootballService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Times Brasileiros',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Color(0xFF00457D),
      ),
      backgroundColor: Color(0xFF00457D),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: FutureBuilder<List<TeamModel>>(
          future: footballService.getAllBrasiliansTeams(),
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
              final teams = snapshot.data!;
              return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0,8,0,8),
                    child: TeamWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamDetailsScreen(
                              teamModel: teams[index],
                            ),
                          ),
                        );
                      },
                      footballTeam: teams[index],
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
