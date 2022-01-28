part of shut_the_box_engine;

class Game {
  //operator==(Game other)=>
  List<Player> players;
  List<Dice> dice;
  Game.playerAmount(int amount, {List<Dice>? dice})
      : players = List.filled(amount, Player(), growable: true),
        this.dice = dice ?? List.filled(2, Dice(), growable: true);
}

class GameVM extends ChangeNotifier {
  GameVM(this.ref, {Game? game}) : this.game = game ?? Game.playerAmount(1) {
    ref.listen<int?>(augenZahlProvider, (previous, next) {});
  }

  Ref ref;
  Game game;

  addPlayers(Iterable<Player>? newPlayers) {
    game.players.addAll(newPlayers ?? [Player()]);
    notifyListeners();
  }

  addDice(Iterable<Dice>? newDice) {
    game.dice.addAll(newDice ?? [Dice()]);
    notifyListeners();
  }

  int roll() {
    int result = game.dice
        .map((e) => e.roll())
        .reduce((value, element) => value + element);
    ref.read(augenZahlProvider.notifier).state = result;
    return result;
  }

  Player? winner;
}
