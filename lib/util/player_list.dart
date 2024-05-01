import 'package:App/util/player_tile.dart';
import 'package:flutter/material.dart';
import 'package:App/classes/player.dart';


class PlayerList extends StatelessWidget {

  final List<Player> players;
  final void Function(BuildContext,int) delete;
  final void Function(int, int) movePlayers;
  final void Function(int, bool) addPlayerMenu;

  const PlayerList({
    super.key,
    required this.players,
    required this.delete,
    required this.movePlayers,
    required this.addPlayerMenu,
  });

  @override
  Widget build(BuildContext context) {

    int teamCount = 0;
    bool color = true;

    return ReorderableListView(
      children: players.asMap().entries.map((entry) {
        final index = entry.key; // Get the index from the entry
        final player = entry.value;

        PlayerTile assigned;
        assigned = PlayerTile(
          key: ValueKey(player),
          index: index,
          player:player,
          color:color,
          delete: (context) => delete(context, index),
          addPlayerMenu: (index) => addPlayerMenu(index, false)
          );
        teamCount += 1;
        if (teamCount == 5) {
          teamCount = 0;
          color = !color;
        }
        return assigned;

      }).toList(),
      onReorder: (oldIndex, newIndex) => movePlayers(oldIndex, newIndex),
    );
  }
}