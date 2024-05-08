import "package:App/util/team_off_list.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:App/classes/player.dart";

class GameEndBox extends StatelessWidget {
  GameEndBox({super.key, required this.teamOff, required this.handleTeamOff});

  final List<Player> teamOff;
  final void Function(List<Player>) handleTeamOff;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 300,
        child: TeamOffList(teamOff: teamOff, handleTeamOff: handleTeamOff)
      ),
    );
  }
}
