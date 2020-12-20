class mobs extends entities {

  color col;
  int col_num;

  PImage Sprite;
  PImage[] Sprites = new PImage[5];


  mobs() {
    this.col = c.col[floor(random(5))];
    int x = floor(random(5));
    x*=100;
    x+=50;
    this.location.x = x;
  }

  mobs(int i, int x) {
    this.col_num = i;
    col = c.col[col_num];
    x*=100;
    this.location.x = x;
    //Sprites = getSprites();
  }

  void update() {
    move();
    render();
  }

  void render() {
    Sprites = getSprites();
    Sprite = Sprites[col_num].get(mobW*anim8, 77*3, mobW, mobH);
    image(Sprite, location.x, location.y);
  }

  void move() {
    location.add(velocity);
  }

  PImage[] getSprites() {
    return Sprites;
  }
}
