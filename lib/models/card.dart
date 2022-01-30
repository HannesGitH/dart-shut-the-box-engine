part of shut_the_box_engine;

///Every [Player] has a deck of [Card]s (per default from 1 to 10)
class Card extends ChangeNotifier {
  /// wheather this card was already selected, should only be read, not written
  bool isDown;

  /// which number this card has
  int number;

  Card({required this.number, this.isDown = false});

  ///select this [Card] to lay it down (isDown=true) and notify all subscribersmthat this card changed
  bool select() {
    bool wasDown = isDown;
    isDown = true;
    notifyListeners();
    return !wasDown;
  }
}
