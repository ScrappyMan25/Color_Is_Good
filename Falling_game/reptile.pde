class reptile extends mobs {

  PImage red = mH.red_reptile;
  PImage blue =mH.blue_reptile ;
  PImage green = mH.green_reptile ;
  PImage yellow = mH.yellow_reptile; 
  PImage orange = mH.orange_reptile ;

  PImage[] Sprites = {red, blue, green, yellow, orange};

  reptile() {
  }

  reptile(int i, int x) {
    super(i, x);
    this.velocity.y = -3;
  }

  @Override 
    PImage[] getSprites() {
    return Sprites;
  }
}
