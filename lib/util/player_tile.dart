import 'package:flutter/material.dart';
import 'package:App/classes/player.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart' as slidable; // Alias added

class PlayerTile extends StatelessWidget {
  final Player player;
  final int index;
  final bool color;
  final void Function(BuildContext) delete;
  final void Function(int) addPlayerMenu;

  const PlayerTile({
    super.key,
    required this.player,
    required this.index,
    required this.color,
    required this.delete,
    required this.addPlayerMenu
    });

  @override
  Widget build(BuildContext context) {
    return slidable.Slidable(
      endActionPane: slidable.ActionPane(
        motion: const slidable.StretchMotion(),
        children: [
          slidable.SlidableAction(
            onPressed: delete,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            ),
        ],
        ),
      child: Card(
          margin: EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
          color: (color) ? Colors.white : Colors.orange[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: ()=>addPlayerMenu(index),
                      child:
                          Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                      )
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      player.name,
                      style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                                ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                              width: 45,
                              height: 45,
                              padding: const EdgeInsets.all(4),
                              child: ReorderableDragStartListener(
                                index: index,
                                child: const Card(
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.drag_indicator_outlined),
                                ),
                              ),
                            ),
                  )
                ],
              ),

            ],
          )),
    );
  }
}
