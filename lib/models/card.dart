part of shut_the_box_engine;

class Card extends ChangeNotifier {
  bool isDown;
  int number;

  Card({required this.number, this.isDown = false});

  bool select() {
    bool wasDown = isDown;
    isDown = true;
    notifyListeners();
    return !wasDown;
  }
}
