class life extends boosts {
  life() {
  }
  life(int x) {
    super(x);
    this.coin = mH.life;
  }

  @Override
    void render() {
    image(mH.life, location.x, location.y, 64, 64);
  }

  void collide() {
    player1.lives++;
  }
}
