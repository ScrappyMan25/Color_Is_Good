/*
DISCLAIMER - 
 credit where credit is due.
 The player and mobs spritesheets were not entirely made by me. 
 The basic models were sourced from a free software called "RPG Character Builder" available on steam.
 I made the basic models there and edited them as per my requirement. 
 */

final color RED = color(251, 0, 26);
final color BLUE = color(0, 122, 255);
final color GREEN = color(125, 255, 0);
final color YELLOW = color(255, 200, 0);
final color ORANGE = color(255, 125, 0);

final int mobW = 77;
final int mobH = 77;

int counter, anim8, anim16, hi;
boolean loading = true;

mediaHandler mH;
player player1;
spawn s;
colors c;

PFont arcade;
PFont retro;

enum gameMode {
    GAME, 
    MENU, 
    END
}

gameMode gm;

//init
void setup() {

  size(500, 1000);
  frameRate(60);
  initiateVariables();
}

void initiateVariables() {

  //init objects of classes
  mH = new mediaHandler();
  player1 = new player();
  s = new spawn();
  c = new colors();

  //Create fonts
  arcade = createFont("assets/arcade.ttf", 32);
  retro = createFont("assets/Retro.ttf", 32);

  //init variables
  counter = anim8 = anim16 = 0;
  gm = gameMode.MENU;
  s.rate = 0.02;

  //init color variables
  c.wColor = floor(random(5));
  c.thecolor = floor(random(5));
  c.state = floor(random(2));
}

//repeating process
void draw() {
  background(0);
  counter++;
  anim16 = (counter/1)%64;
  anim8 = (counter/5)%8;//0-7 increments every 5 frames for animations
  mH.animation();    
  c.changeColor();

  switch(gm) {
  case GAME:
    {
      s.update();  
      player1.update();
      break;
    }
  case MENU:
    {
      s.updateTiles();
      s.spawnTile();
      break;
    }
  case END:
    {
      s.updateTiles();
      s.spawnTile();
      break;
    }
  }
  gameBackground(); //Put at the end so as to overlap all other entities.
}

//draw background sections and params.
void gameBackground() {
  switch(gm) {
  case GAME:
    {
      //Sections
      stroke(0);
      fill(#303030);
      //top box
      rect(0, 0, width, 50);
      //bottom box
      rect(0, height-100, width, height);

      //info text
      textFont(arcade, 50);

      //score and hi_score
      fill(255);
      image(mH.coin, 20, 10, 32, 32);
      text((int)(player1.score), 60, 45);
      //text(hi, 350, 45); 
      image(mH.heart, 365, 10, 32, 32);
      text("x" + player1.lives, 400, 42);

      //state and color print
      fill(c.col[c.wColor]);
      text(c.colWord[c.thecolor] + "  IS  " + c.Word[c.state], 10, height - 25);
      break;
    }
  case MENU:
    {
      textFont(arcade, 70);
      fill(c.col[c.wColor]);

      text("COLOR IS!", 100, 200);
      image(mH.coin, 100, 700, 100, 100);
      image(mH.life, 100, 800, 100, 100);
      textFont(retro, 50);
      if (loading) {
        text("Loading...(" + (19-s.tile.size()) +")", 130, 400);
      } else {
        text("Press Enter to Start!!", 70, 400);
      }
      textFont(retro, 70);
      text(" -> Bounty", 200, 800);
      text(" -> Life", 200, 900);
      break;
    }
  case END:
    {
      textFont(arcade, 70);
      fill(c.col[c.wColor]);

      text("GAMEOVER", 100, 275);
      image(mH.coin, 5, 200, 100, 100);
      image(mH.life, width-100-5, 200, 100, 100);
      textFont(retro, 70);
      text("Score - " + (int)player1.score, 140, 400);
      text("High - "+ hi, 165, 480);
      textFont(retro, 50);
      text("Press Enter for MENU", 75, 700);
      break;
    }
  }
}

//player controller
void keyPressed()
{
  switch(gm) {
  case GAME:
    {
      if (key == CODED) {
        if (keyCode == LEFT && player1.lastx> 0) {
          player1.velocity.x = -5;
        } else if (keyCode == RIGHT && player1.lastx < width - 100) {
          player1.velocity.x = 5;
        }
      }
      break;
    }
  case MENU:
    {
      if (loading == false && (keyCode == RETURN || keyCode == ENTER)) {
        gm = gameMode.GAME;
        s.reset();
        player1 = new player();
        s.rate = 0.02;
      }   

      break;
    }
  case END:
    {

      if (keyCode == RETURN || keyCode == ENTER) {
        gm = gameMode.MENU;
      }

      break;
    }
  }
}
