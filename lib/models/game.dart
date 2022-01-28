part of shut_the_box_engine;

class Game {
  //operator==(Game other)=>
  List<Player> players;
  List<Dice> dice;
  Game.playerAmount(int amount, {List<Dice>? dice})
      : players = List.filled(amount, Player(), growable: true),
        this.dice = dice ?? List.filled(2, Dice(), growable: true);
}
