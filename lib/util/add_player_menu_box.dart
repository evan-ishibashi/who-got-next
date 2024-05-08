import "package:App/util/button.dart";
import "package:App/classes/player.dart";
import "package:flutter/material.dart";

class AddPlayerMenuBox extends StatelessWidget {
  AddPlayerMenuBox({
    super.key,
    required this.index,
    required this.player,
    required this.addPlayer,
    required this.playersLength,
  });


  final int index;
  final Player player;
  final int playersLength;
  final void Function(int) addPlayer;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Row(
              children: [
              //Button to add Player mid-list
              Button(text: "Add Player After ${player.name}", onPressed: () => addPlayer(index + 1)),

              ]
            ),

            //Buttons
            Row(
              children: [
              //Button to add Player End of list
              Button(text: "Add Player to End of List", onPressed: () => addPlayer(playersLength)),

              ]
            )
          ],
        ),
      ),
    );
  }
}