class orc extends mobs {

  PImage 
    red = mH.red_orc, 
    blue =mH.blue_orc, 
    green = mH.green_orc, 
    yellow = mH.yellow_orc, 
    orange = mH.orange_orc;

  PImage[] Sprites = {red, blue, green, yellow, orange};

  orc() {
  }

  orc(int i, int x) {
    super(i, x); 
    this.velocity.y = -2;
  }

  @Override 
    PImage[] getSprites() {
    return Sprites;
  }
}
