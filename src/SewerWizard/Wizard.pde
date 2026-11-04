//Karlyn Tran

import gifAnimation.*;
class Wizard{
  PVector pos;
  int x,y,size,speed,health,lvl;
  boolean pressed = false, moveLeft, moveRight, moveUp, moveDown;
  Gif wleft, wright, wforward, wback, currentgif;
  Wizard(int x, int y, int lvl, PApplet parent){
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    health = lvl*10 + 50;
    speed = 5;
    pos = new PVector(x, y);
    wleft = new Gif(parent, "wizardLeft.gif");
    wright = new Gif(parent, "wizardRight.gif");
    wforward = new Gif(parent, "wizardAway.gif");
    wback = new Gif(parent, "wizardToward.gif");
    size = 100;
    currentgif = wforward;
    wleft.loop();
    wright.loop();
    wforward.loop();
    wback.loop();
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
    image(currentgif, pos.x,pos.y);
    if (moveLeft){currentgif = wleft;}
    if (moveRight){currentgif = wright;}
    if (moveUp){currentgif = wforward;}
    if (moveDown){currentgif = wback;}
//    pushMatrix(); // saves current coords
//    translate(x, y); // move origin to center
//    rotate(radians(angle));
//    image(wizard, x, y);
//    popMatrix();
// these notes are so that if the user hits a different direction the player image rotates
  }
  boolean isHit(Enemy c) {
    float distance = dist(c.pos.x, c.pos.y, pos.x, pos.y);
    return distance < size;
  }
  void stayOnScreen() {
    if (pos.y < 0) {
      pos.y=0;
    } else if (pos.y>height) {
      pos.y=height;
    } else if (pos.x<0) {
      pos.x=0;
    } else if (pos.x>width) {
      pos.x=width;
    }
  }
}
