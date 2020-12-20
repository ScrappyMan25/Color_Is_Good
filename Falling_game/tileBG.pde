class tileBG {
  PImage[]
    //inc spawn
    base = {
    mH.floor0, 
    mH.floor1, 
    mH.floor2, 
    mH.floor3, 
    mH.floor4, 
    mH.floor5, 
    mH.floor6, 
    mH.floor7
  };

  int state = 0;

  PImage[] tileSet = new PImage[8];
  PVector
    location = new PVector(0, -64), 
    velocity = new PVector(0, 1);

  tileBG() {
    for (int i=0; i<8; i++) {
      double t = random(1);
      if (t < 0.7) {
        tileSet[i] = base[0];
      } else if (t<0.9) {
        tileSet[i] = base[floor(random(3))+1];
      } else {
        tileSet[i] = base[floor(random(4))+4];
      }
    }
  }


  void update() {
    move();
    render();
  }

  void move() {
    location.add(velocity);
  }

  void render() {
    for (int i = 0; i<8; i++) {
      image(tileSet[i], (64*i), location.y);
    }
  }
}
