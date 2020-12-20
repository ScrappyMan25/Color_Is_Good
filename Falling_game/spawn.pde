class spawn {

  ArrayList<mobs> mob = new ArrayList<mobs>();
  ArrayList<boosts> boost = new ArrayList<boosts>();
  ArrayList<tileBG> tile = new ArrayList<tileBG>();
  int counterBall = 0;
  int counterBoost = 0;
  double rate = 0.02;

  spawn() {
  }

  void update() {
    updateTiles();
    updateMobs();
    updateBoosts();
    println(tile.size());
    spawnTile();
    if (random(1) < rate) {
      spawnEntity(random(1));
      rate+= 0.00001; //difficulty inc over time
    }
  }


  void spawnEntity(double d) {
    int x = floor(random(5));
    int mobColor = floor(random(5));
    if (d < 0.3) {
      orc o = new orc(mobColor, x);
      addMob(o);
    } else if (d < 0.6) {
      skelly o = new skelly(mobColor, x);
      addMob(o);
    } else if (d < 0.9) {
      reptile o = new reptile(mobColor, x);
      addMob(o);
    } else if (d < 0.95) {
      bounty b = new bounty(floor(random(5)));
      addBoost(b);
    } else if (d < 1) {
      life b = new life(floor(random(5)));
      addBoost(b);
    }
  }

  void spawnTile() {
    if (anim16 == 12) {
      tileBG t = new tileBG();
      addTile(t);
    }
  }

  void updateMobs() {
    for (int i = mob.size() -1; i >=0; i--) {
      mobs o = mob.get(i);
      o.update();
      if (o.collision() == true) {
        switch(c.state) {
        case 0:
          {
            if (o.col == c.col[c.thecolor]) {
              //0 - bad - 1 - gd
              player1.collide();
            } else {
              player1.score += 50;
            }
            break;
          }
        case 1:
          {
            if (o.col == c.col[c.thecolor]) {
              //0 - bad - 1 - gd
              player1.score+=50;
            } else {
              player1.collide();
            }
            break;
          }
        }

        delMob(o);
      }
      if (o.location.y < - 50) {
        delMob(o);
      }
    }
  }

  void updateBoosts() {
    for (int i = boost.size() -1; i >=0; i--) {
      boosts b = boost.get(i);
      b.update();
      if (b.location.y < - 50) {
        delBoost(b);
      }
      if (b.collision() == true) {
        b.collide();
        delBoost(b);
      }
    }
  }

  void updateTiles() {
    for (int i = tile.size() -1; i>=0; i--) {
      tileBG t = tile.get(i);
      if (gm!=gameMode.MENU) {
        t.update();
      } else {
        t.move();
      }
      if (t.location.y > height + 128) {
        delTile(t);
        loading = false;
      }
    }
  }

  void addMob(mobs o) {
    mob.add(o);
  }

  void delMob(mobs o) {
    mob.remove(o);
  }

  void addBoost(boosts b) {
    boost.add(b);
  }

  void delBoost(boosts b) {
    boost.remove(b);
  }

  void addTile(tileBG t) {
    tile.add(t);
  }

  void delTile(tileBG t) {
    tile.remove(t);
  }

  void reset() {
    for (int i = boost.size()-1; i>=0; i--) {
      boosts b = boost.get(i);
      boost.remove(b);
    }
    for (int i = mob.size()-1; i>=0; i--) {
      mobs o = mob.get(i);
      mob.remove(o);
    }
  }
}
