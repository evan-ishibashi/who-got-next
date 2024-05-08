import 'package:App/classes/player.dart';

class Game {

  List<Player> teamOne;
  int teamOneScore;
  List<Player> teamTwo;
  int teamTwoScore;
  bool live;
  int time;

  Game(this.teamOne, this.teamTwo, this.teamOneScore, this.teamTwoScore, this.live, this.time);


}