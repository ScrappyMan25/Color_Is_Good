class bounty extends boosts {
  bounty() {
  }
  bounty(int x) {
    super(x);
  }

  @Override
    void render() {
    image(mH.coin, location.x, location.y, 64, 64);
  }

  void collide() {
    player1.score+=100;
  }
}
