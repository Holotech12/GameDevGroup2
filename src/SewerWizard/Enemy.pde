//Torbjorn Harvey

//import gifAnimation.*;
class Enemy {
  PVector pos;
  int x, y, size, speed, health, lvl;
PImage p1;
  Enemy(int x, int y, int lvl) {
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    health = lvl*20;
    speed = lvl*2;
    pos = new PVector(x, y);
    size = 100;
pi = loadImage("enemy.png");
  }
  void track(PVector target) {
    PVector dir = PVector.sub(target, pos);
    if (dir.mag() > 2) {
      dir.normalize();
      dir.mult(speed);
      pos.add(dir);
    }
  }
  void display() {
image(p1,x,y);

  }
  boolean isOffScreen() {
    if (y>height+size/2) {
      return true;
    } else {
      return false;
    }
  }
}
