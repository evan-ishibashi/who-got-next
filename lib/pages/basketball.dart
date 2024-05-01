import 'package:App/util/add_player_dialogue_box.dart';
import 'package:App/util/add_player_menu_box.dart';
import 'package:App/util/add_player_menu_main_box.dart';
import 'package:flutter/material.dart';
import 'package:App/classes/player.dart';
import 'package:App/util/player_list.dart';

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

  void saveNewPlayer(int index) {
    setState(() {
      players.insert(index,Player(_controller.text));
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

          return (main) ?
          AddPlayerMenuMainBox(
            addPlayer: (index) => addPlayer(index),
            index: index,
            playersLength: players.length,
          )
          :
          AddPlayerMenuBox(
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

  void movePlayers(int oldIndex, int newIndex){
    setState(() {

    // Accounts for when moving tile down the list
    if (oldIndex < newIndex){
      newIndex--;
    }
    // get the tile we are moving
    final player = players.removeAt(oldIndex);

    // place tile in the new position
    players.insert(newIndex, player);

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
          addPlayerMenu: addPlayerMenu
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addPlayerMenu(players.length, true),
          backgroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
