part of shut_the_box_engine;

class Player {
  bool hasWon;
  late List<Card> cards;

  Player({this.hasWon = false, List<Card>? cardset})
      : cards = cardset ?? defaultCardSet;
}
