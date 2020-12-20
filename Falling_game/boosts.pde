class boosts extends entities {
  boosts() {
  }

  PImage coin;

  boosts(int x) {
    x*=100;
    this.location.x = x;
  }

  void update() {
    move();
    render();
    this.velocity.x = random(-5, +5);
  }

  void render() {
    image(coin, location.x, location.y, 64, 64);
  }

  void move() {
    location.add(velocity);
  }

  void collide() {
  }
}
