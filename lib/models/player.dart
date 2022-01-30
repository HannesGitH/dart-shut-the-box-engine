part of shut_the_box_engine;

class Player extends ChangeNotifier {
  bool hasWon;
  late List<Card> cards;

  /// select one of his Cards to lay it down if possible
  void select(int cardIndex) {
    final card = cards.at(cardIndex);
    if ((card != null) && (card.number <= _availableAugen) && (card.select())) {
      _availableAugen -= card.number;
      notifyListeners();
      if (cards.every((element) => element.isDown)) {
        hasWon = true;
        notifyListeners();
      }
    }
  }

  int _availableAugen = 0;

  /// how many points they still have to choose
  int get roundEyes => _availableAugen;

  Player({this.hasWon = false, List<Card>? cardset})
      : cards = cardset ?? defaultCardSet;

  /// wheather this player is done , aka has all his cards layed down
  bool get finished => cards.every((element) => element.isDown);
}

extension At<T> on List<T> {
  T? at(int? index) {
    try {
      return this[index!];
    } catch (e) {
      return null;
    }
  }
}
