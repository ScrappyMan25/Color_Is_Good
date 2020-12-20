class mediaHandler {
  int a = 64;
  PImage 
    red_orc = loadImage("assets/orc_red.png"), 
    blue_orc = loadImage("assets/orc_blue.png"), 
    green_orc = loadImage("assets/orc_green.png"), 
    yellow_orc = loadImage("assets/orc_yellow.png"), 
    orange_orc = loadImage("assets/orc_orange.png"), 

    red_reptile = loadImage("assets/reptile_red.png"), 
    blue_reptile = loadImage("assets/reptile_blue.png"), 
    green_reptile = loadImage("assets/reptile_green.png"), 
    yellow_reptile = loadImage("assets/reptile_yellow.png"), 
    orange_reptile = loadImage("assets/reptile_orange.png"), 

    red_skelly = loadImage("assets/skelly_red.png"), 
    blue_skelly = loadImage("assets/skelly_blue.png"), 
    green_skelly = loadImage("assets/skelly_green.png"), 
    yellow_skelly = loadImage("assets/skelly_yellow.png"), 
    orange_skelly = loadImage("assets/skelly_orange.png"), 

    playerSprite = loadImage("assets/player_sprite.png"), 
    playerLeft = loadImage("assets/player_strafe_left.png"), 
    playerRight = loadImage("assets/player_strafe_right.png"), 

    hearts = loadImage("assets/Hearts.png"), 
    heart = hearts.get(256, 0, 256, 256), 

    coins = loadImage("assets/Coins.png"), 
    coin = coins.get(128*(anim8/2), 0, 128, 128), 
    invulnerability = loadImage("assets/Invulnerability.png"), 
    invulnerabilityAnim = invulnerability.get(128*(anim8/2), 0, 128, 128), 
    lives = loadImage("assets/Life.png"), 
    life = lives.get(128*(anim8/2), 0, 128, 128), 

    floor = loadImage("assets/Floor_sprite.png"), 
    floor0 = floor.get(a*0, 0, a, a), 
    floor1 = floor.get(a*1, 0, a, a), 
    floor2 = floor.get(a*2, 0, a, a), 
    floor3 = floor.get(a*3, 0, a, a), 
    floor4 = floor.get(a*4, 0, a, a), 
    floor5 = floor.get(a*5, 0, a, a), 
    floor6 = floor.get(a*6, 0, a, a), 
    floor7 = floor.get(a*7, 0, a, a);


  //constructor
  mediaHandler() {
  }

  void animation() {
    coin = coins.get(128*(anim8/2), 0, 128, 128);
    invulnerabilityAnim = invulnerability.get(128*(anim8/2), 0, 128, 128);
    life = lives.get(128*(anim8/2), 0, 128, 128);
  }
}
