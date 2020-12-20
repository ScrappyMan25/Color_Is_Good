
class colors {
  int wColor, thecolor, state;

  color[] col = {RED, BLUE, GREEN, YELLOW, ORANGE};
  String[] colWord = {"RED", "BLUE", "GREEN", "YELLOW", "ORANGE"};
  String[] Word = {"BAD", "GOOD"};
  colors() {
  }

  void changeColor() {
    if (counter%300 == 0) {
      wColor = floor(random(5));
      thecolor = floor(random(5));
      state = floor(random(2));
    }
  }
}
