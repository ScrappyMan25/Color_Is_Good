class player {
  PVector location = new PVector(200, 50);
  PVector velocity = new PVector();
  PImage playerSprite = mH.playerSprite.get(77*anim8, 77*3, 77, 77);
  PImage playerLeft = mH.playerLeft;
  PImage playerRight = mH.playerRight;
  PImage sprite = playerSprite;
  double score = 0;
  float lastx = location.x;
  int lives = 3;

  player() {
  }

  void update() {
    move();
    render();
    //println(location.x);
    if (score>=hi) {
      hi = (int)score;
    }
    playerSprite = mH.playerSprite.get(77*(7-anim8), 0, 77, 77);
  }


  void move() {
    location.add(velocity);
    int t = (int)abs(location.x-lastx);
    int anim = int(t/14.5);
    switch((int)velocity.x) {
      case (5):
      {
        sprite = playerRight.get(77*anim, 0, 77, 77);
        if (location.x==lastx+100) {
          lastx = location.x;
          velocity.x =0;
        }
        break;
      }
      case (-5):
      {
        sprite = playerLeft.get(77*anim, 0, 77, 77);
        if (location.x==lastx-100) {
          lastx = location.x;
          velocity.x =0;
        }
        break;
      }
    default:
      {
        sprite = playerSprite;
      }
    }
  }

  void render() {
    image(sprite, location.x, location.y);
  }

  void collide() {
    if (lives > 0 ) {
      lives--;
    } else {
      gm = gameMode.END;
    }
  }
}
