class entities {
  PVector location = new PVector(0, height + 50);
  PVector velocity = new PVector(0, -5);

  boolean collision() {
    double dist = dist(location.x+39, location.y+39, player1.location.x+39, player1.location.y + 39);
    if (dist<=70) {
      return true;
    }    
    return false;
  }
}
