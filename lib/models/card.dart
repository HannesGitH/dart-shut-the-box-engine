part of shut_the_box_engine;

///Every [Player] has a deck of [Card]s (per default from 1 to 10)
class Card extends ChangeNotifier {
  /// wheather this card was already selected, should only be read, not written
  bool isDown;

  bool _isSelected = false;
  set isSelected(bool selected) {
    _isSelected = selected;
    notifyListeners();
  }

  bool get isSelected => _isSelected;

  /// which number this card has
  int number;

  Card({required this.number, this.isDown = false});

  bool layDownIfSelected() {
    if (!isSelected) return false;
    bool wasDown = isDown;
    isDown = true;
    isSelected = false;
    return !wasDown;
  }
}
