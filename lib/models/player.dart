part of shut_the_box_engine;

class Player extends ChangeNotifier {
  bool hasWon;
  late List<Card> cards;

  final String name;

  void toggleCard(int cardIndex) {
    final card = cards.at(cardIndex);
    if (card == null || card.isDown) return;
    cards.at(cardIndex)!.isSelected ? deSelect(cardIndex) : select(cardIndex);
  }

  void select(int cardIndex) {
    final card = cards.at(cardIndex);
    if ((card != null) &&
        (card.number <= _availableAugen) &&
        (!card.isSelected)) {
      card.isSelected = true;
      _availableAugen -= card.number;
      notifyListeners();
      if (cards.every((element) => element.isDown)) {
        hasWon = true;
        notifyListeners();
      }
    }
  }

  void reset() {
    cards.forEach((c) => c.reset());
  }

  void deSelect(int cardIndex) {
    final card = cards.at(cardIndex);
    if ((card != null) && (card.isSelected)) {
      card.isSelected = false;
      _availableAugen += card.number;
      notifyListeners();
    }
  }

  void endRound() {
    if (roundEyes == 0) _layDownAllSelected();
    if (true /*Todo: use deselectForNextRoundProvider*/) _deSelectAll();
    _availableAugen = 0;
    notifyListeners();
  }

  void _layDownAllSelected() {
    cards.forEach((element) => element.layDownIfSelected());
  }

  void _deSelectAll() {
    cards.forEach((element) => element.isSelected = false);
  }

  int _availableAugen = 0;

  /// how many points they still have to choose
  int get roundEyes => _availableAugen;

  Player(this.name, {this.hasWon = false, List<Card>? cardset})
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
