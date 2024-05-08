import 'package:App/util/add_player_dialogue_box.dart';
import 'package:App/util/add_player_menu_box.dart';
import 'package:App/util/game_end_box.dart';
import 'package:App/util/add_player_menu_main_box.dart';
import 'package:flutter/material.dart';
import 'package:App/classes/player.dart';
import 'package:App/util/player_list.dart';
import 'package:App/classes/session.dart';
import 'package:App/classes/game.dart';

class Basketball extends StatefulWidget {
  const Basketball({super.key});

  @override
  State<Basketball> createState() => _BasketballState();
}

class _BasketballState extends State<Basketball> {
  //Text Controller
  final TextEditingController _controller = TextEditingController();

  List<Player> players = [
    Player("Evan Ishibashi"),
    Player("Trevor Lee"),
    Player("Alvin Park"),
    Player("Justin Lee"),
    Player("Tim St. John"),
    Player("Victor Huang"),
    Player("Korede O"),
    Player("DP"),
  ];

  int teamSize = 5;

  void saveNewPlayer(int index) {
    setState(() {
      players.insert(index, Player(_controller.text));
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  void addPlayer(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AddPlayerBox(
            controller: _controller,
            onSave: () => saveNewPlayer(index),
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void addPlayerMenu(int index, bool main) {
    showDialog(
        context: context,
        builder: (context) {
          return (main)
              ? AddPlayerMenuMainBox(
                  addPlayer: (index) => addPlayer(index),
                  promptTeamOff: (teamSize)=>promptTeamOff(teamSize),
                  index: index,
                  playersLength: players.length,
                  teamSize: teamSize,
                )
              : AddPlayerMenuBox(
                  addPlayer: (index) => addPlayer(index),
                  index: index,
                  player: players[index],
                  playersLength: players.length,
                );
        });
  }

  void delete(BuildContext context, int index) {
    setState(() {
      players.removeAt(index);
    });
  }

  void movePlayers(int oldIndex, int newIndex) {
    setState(() {
      // Accounts for when moving tile down the list
      if (oldIndex < newIndex) {
        newIndex--;
      }
      // get the tile we are moving
      final player = players.removeAt(oldIndex);

      // place tile in the new position
      players.insert(newIndex, player);
    });
  }

  // Add the team who came off to the end of players list
  void addTeam(List<Player> teamOff) {
    setState(() {
      players = players + teamOff;
      Navigator.of(context).pop();
    });
  }

  // Handles Team Coming off
  void promptTeamOff(int teamSize) {
    List<Player> teamOff = [];

    //Edit this to a slice function
    for (int i = 0; i < teamSize; i++) {
      Player playerOff = players.removeAt(0);
      teamOff.add(playerOff);
    }
    showDialog(
        context: context,
        builder: (context) {
          return GameEndBox(teamOff: teamOff, handleTeamOff: (teamBackOn)=>handleTeamOff(teamBackOn));
        });
  }

  void handleTeamOff(List<Player> teamBackOn){
    setState(() {
      players = players + teamBackOn;
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Who Got Next?',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: PlayerList(
            players: players,
            delete: delete,
            movePlayers: movePlayers,
            addPlayerMenu: addPlayerMenu),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addPlayerMenu(players.length, true),
          backgroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
