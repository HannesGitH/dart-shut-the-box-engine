part of shut_the_box_engine;

class Game {
  //operator==(Game other)=>
  List<Player> players;
  List<Dice> dice;
  Game({List<Dice>? dice})
      : players = [],
        this.dice = dice ?? List.filled(2, Dice(), growable: true);
}

class GameVM extends ChangeNotifier {
  GameVM({Game? game}) : this.game = game ?? Game();

  Game game;

  addPlayers(Iterable<Player>? newPlayers) {
    newPlayers ??= [Player('Guest ${game.players.length}')];
    for (var newPlayer in newPlayers) {
      newPlayer.addListener(() {
        if (newPlayer.hasWon) {
          winner = newPlayer;
          notifyListeners();
        }
      });
    }
    game.players.addAll(newPlayers);
    notifyListeners();
  }

  addDice(Iterable<Dice>? newDice) {
    game.dice.addAll(newDice ?? [Dice()]);
    notifyListeners();
  }

  /// roll all [Dice] this [Game] has
  int roll() {
    int result = game.dice
        .map((e) => e.roll())
        .reduce((value, element) => value + element);
    for (var player in game.players) {
      player._availableAugen = result;
      player.notifyListeners();
    }
    return result;
  }

  Player? winner;
}
