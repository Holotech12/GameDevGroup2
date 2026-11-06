//Torbjorn Harvey

import gifAnimation.*;
class Enemy {
  PVector pos;
  int x, y, size, speed, health, lvl;
  PImage skull;
  Timer cooldown = new Timer(6000);
  Enemy(int x, int y, int lvl) {
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    health = lvl*20;
    speed = lvl*2;
    pos = new PVector(x, y);
    size = 100;
    skull = loadImage("enemy.png");
  }
  void track(PVector target) {
    PVector dir = PVector.sub(target, pos);
    if (dir.mag() > 2) {
      dir.normalize();
      dir.mult(speed);
      pos.add(dir);
    }
  }
  boolean canAttack(Wizard w){
    float d = dist(x,y, w.x, w.y);
    if(d<120 && cooldown.isFinished()){
      return true;
    } else { return false;}
  }
  void attack() {
    cooldown.start();
  }
  void display() {
    imageMode(CENTER);
    image(skull, pos.x, pos.y);
    //fill(255, 100, 100);
    //ellipse(pos.x, pos.y, size, size);
  }
  boolean isOffScreen() {
    if (y>height+size/2) {
      return true;
    } else {
      return false;
    }
  }
}
