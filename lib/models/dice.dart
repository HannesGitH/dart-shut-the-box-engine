part of shut_the_box_engine;

class Dice extends ChangeNotifier {
  List<int> sides;
  Dice({this.sides = const [1, 2, 3, 4, 5, 6]}) {
    roll();
  }

  ///which side of the dice faces up (changes with [roll()], should not be written)
  late int top;

  ///roll this dice
  int roll() {
    top = sides[rng.nextInt(sides.length - 1)];
    notifyListeners();
    return top;
  }
}
