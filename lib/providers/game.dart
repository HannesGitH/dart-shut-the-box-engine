part of shut_the_box_engine;

final gameProvider = StateNotifierProvider<GameVM, Game>((ref) {
  return GameVM();
});
