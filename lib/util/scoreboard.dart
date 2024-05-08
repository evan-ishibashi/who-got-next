import 'package:flutter/material.dart';

class Scoreboard extends StatefulWidget {
  const Scoreboard({super.key});

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  @override
  Widget build(BuildContext context) {

    int teamOneScore = 0;
    int teamTwoScore = 0;
    int time = 0;
    return Row(
      children: [
        Column(children: [

        ],),
        Row(children: [
        ],)
      ]
    );
  }
}