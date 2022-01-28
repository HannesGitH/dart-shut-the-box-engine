part of shut_the_box_engine;

mixin Identifiable {
  Key id = UniqueKey();
  operator ==(Object other) {
    try {
      return this.id == (other as Identifiable).id;
    } catch (e) {}
    return false;
  }
}
