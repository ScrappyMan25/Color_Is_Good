class skelly extends mobs {

  PImage red = mH.red_skelly;
  PImage blue =mH.blue_skelly ;
  PImage green = mH.green_skelly ;
  PImage yellow = mH.yellow_skelly; 
  PImage orange = mH.orange_skelly ;

  PImage[] Sprites = {red, blue, green, yellow, orange};

  skelly() {
  }

  skelly(int i, int x) {
    super(i, x);
    this.velocity.y = -1;
  }

  @Override 
    PImage[] getSprites() {
    return Sprites;
  }
}
