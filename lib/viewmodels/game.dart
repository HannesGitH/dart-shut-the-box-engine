part of shut_the_box_engine;

class GameVM extends StateNotifier<Game> {
  GameVM() : super(Game.playerAmount(0));

  addPlayers(Iterable<Player>? newPlayers) =>
      state.players.addAll(newPlayers ?? [Player()]);
}
