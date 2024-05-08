import "package:App/util/button.dart";
import "package:flutter/material.dart";

class AddPlayerMenuMainBox extends StatelessWidget {
  AddPlayerMenuMainBox({
    super.key,
    required this.index,
    required this.addPlayer,
    required this.playersLength,
    required this.promptTeamOff,
    required this.teamSize,
  });


  final int index;
  final int playersLength;
  final int teamSize;
  final void Function(int) addPlayer;
  final void Function(int) promptTeamOff;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Row(
              children: [
              //Button to add Player at end of List
              Button(text: "Add Player to End of List", onPressed: () => addPlayer(playersLength)),

              ]
            ),
            Row(
              children: [
              //Button to add Player at end of List
              Button(text: "End Game", onPressed: () => promptTeamOff(teamSize)),

              ]
            )
          ],
        ),
      ),
    );
  }
}