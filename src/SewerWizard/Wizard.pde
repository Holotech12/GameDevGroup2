import gifAnimation.*;
class Wizard{
  PVector pos;
  int x,y,w,h,speed,health,lvl;
  boolean pressed = false, moveLeft, moveRight, moveUp, moveDown;
  Wizard(int x, int y, int lvl){
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    health = lvl*10 + 50;
    speed = 10;
    pos = new PVector(x, y);
  }
  void setControls(char k, int code, boolean state) {
    // Letter keys
    if (k == 'a' || k == 'A' || code == LEFT) moveLeft = state;
    if (k == 'd'|| k == 'D'|| code == RIGHT) moveRight = state;
    if (k == 'w'|| k == 'W'|| code == UP) moveUp = state;
    if (k == 's'|| k == 'S'|| code == DOWN) moveDown = state;
  }

  // update coord
  void updatePosition() {
    PVector move = new PVector(0,0);
    if (moveLeft) {pos.x -= speed;}// angle = 270;}
    if (moveRight){pos.x += speed;}// angle = 90;}
    if (moveUp){pos.y -= speed;}// angle = 0;}
    if (moveDown){pos.y += speed;}// angle = 180;}
    if (move.mag() > 0) {
      move.normalize();
      move.mult(speed);
      pos.add(move);
    }
  }

  void display() {
    imageMode(CENTER);
    rectMode(CENTER);
    fill(100,100,255);
    rect(pos.x,pos.y, 100, 100);
//    pushMatrix(); // saves current coords
//    translate(x, y); // move origin to center
//    rotate(radians(angle));
//    image(wizard, x, y);
//    popMatrix();
// these notes are so that if the user hits a different direction the player image rotates
  }
}
