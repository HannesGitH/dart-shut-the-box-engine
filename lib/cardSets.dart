part of shut_the_box_engine;

List<Card> get defaultCardSet =>
    createCardWithNums([1, 2, 3, 4, 5, 6, 7, 8, 9]);

List<Card> createCardWithNums(List<int> nums) =>
    nums.map((n) => Card(number: n)).toList();
