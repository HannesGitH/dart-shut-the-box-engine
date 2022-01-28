part of shut_the_box_engine;

final gameProvider = ChangeNotifierProvider.family<GameVM, Game?>((ref, game) {
  return GameVM(ref, game: game);
});

final augenZahlProvider = StateProvider<int?>((ref) => null);
