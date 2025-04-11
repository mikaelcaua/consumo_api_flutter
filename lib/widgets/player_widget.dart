
import 'package:flutter/material.dart';
import '../models/player_model.dart';


class PlayerWidget extends StatelessWidget {
  const PlayerWidget({
    super.key,
    required this.playerModel,
  });

  final PlayerModel playerModel;

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
          Text(
            playerModel.name,
            style: TextStyle(color: Colors.white,fontSize: 20),
          ),
          Text(
            playerModel.position,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
