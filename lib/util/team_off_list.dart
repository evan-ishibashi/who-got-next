import 'package:flutter/material.dart';
import "package:App/classes/player.dart";
import "package:flutter/cupertino.dart";
import "package:App/util/button.dart";

class TeamOffList extends StatelessWidget {
  const TeamOffList({
    super.key,
    required this.teamOff,
    required this.handleTeamOff
    });

    final List<Player> teamOff;
    final void Function(List<Player>) handleTeamOff;

  @override
  Widget build(BuildContext context) {

  List<Player> returningPlayers = [];

  List<Widget> finalChildren = [];

  //Add first text Row
  finalChildren.add(const Text("Who is still on?"));

  // Add List of Players coming off
  for (int i = 0; i < teamOff.length; i++){
    returningPlayers.add(teamOff[i]);
    finalChildren.add(Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('${i + 1}. ${teamOff[i].name}'),
        // Checkbox handles returning player
        CupertinoCheckbox(
          value: true,
          onChanged: (value) {},
        )
      ],
    ));
  }

    // Add player to list of returning player

  // add final button
  finalChildren.add(Button(text: "Next", onPressed: ()=>handleTeamOff(returningPlayers)));

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: finalChildren,

    );
  }
}

