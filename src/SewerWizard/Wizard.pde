import gifAnimation.*;
class Wizard{
  int x,y,w,h,speed,health,lvl;
  boolean pressed = false, moveLeft, moveRight, moveUp, moveDown;
  Wizard(int x, int y, int lvl){
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    health = lvl*10 + 50;
    speed = 10;
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
    if (moveLeft) {x -= speed;}// angle = 270;}
    if (moveRight){ x += speed;}// angle = 90;}
    if (moveUp){  y -= speed;}// angle = 0;}
    if (moveDown){  y += speed;}// angle = 180;}
  }

  void display() {
    imageMode(CENTER);
    fill(100,100,255);
    rect(100,100,x,y);
//    pushMatrix(); // saves current coords
//    translate(x, y); // move origin to center
//    rotate(radians(angle));
//    image(wizard, x, y);
//    popMatrix();
// these notes are so that if the user hits a different direction the player image rotates
  }
}
