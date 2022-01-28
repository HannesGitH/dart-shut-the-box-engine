part of shut_the_box_engine;

class GameVM extends ChangeNotifier {
  GameVM({Game? game}) : this.game = game ?? Game.playerAmount(1);

  Game game;

  addPlayers(Iterable<Player>? newPlayers) {
    game.players.addAll(newPlayers ?? [Player()]);
    notifyListeners();
  }
}
