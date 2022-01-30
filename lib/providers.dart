part of shut_the_box_engine;

final gameProvider = ChangeNotifierProvider.family<GameVM, Game?>((ref, game) {
  return GameVM(game: game);
});

final augenZahlProvider = StateProvider<int?>((ref) => null);

List<AutoDisposeChangeNotifierProvider<N>> provFromList<
        N extends ChangeNotifier>(List<N> notifiers) =>
    notifiers.map((p) => ChangeNotifierProvider.autoDispose((_) => p)).toList();
