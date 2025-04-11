// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../models/team_model.dart';

class TeamWidget extends StatelessWidget {
  const TeamWidget({
    super.key,
    required this.footballTeam,
    required this.onTap,
  });

  final TeamModel footballTeam;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0x15FFFFFF),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(
            footballTeam.imageUrl,
            height: 40,
          ),
          Text(
            footballTeam.name,
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
            onPressed: () => onTap(),
            icon: Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
