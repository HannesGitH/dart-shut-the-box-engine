part of shut_the_box_engine;

final gameProvider = ChangeNotifierProvider<GameVM>((ref) {
  return GameVM();
});
