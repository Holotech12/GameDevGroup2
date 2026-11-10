//Torbjorn Harvey

import gifAnimation.*;
class Enemy {
  boolean isDashing = false, attacking;
  PVector pos, dashDir;
  int x, y, size, speed, dashSpeed, dashFrms, dashMaxFrms, health, lvl, dmg, fireTime;
  ArrayList<Projectile> enemyProj = new ArrayList<Projectile>();
  PImage skull;
  Timer cooldown = new Timer(1300);
  Enemy(int x, int y, int lvl) {
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    health = lvl*20;
    speed = lvl/2;
    pos = new PVector(x, y);
    size = 100;
    skull = loadImage("enemy.png");
    cooldown.start();
    dmg = lvl*2;
    dashSpeed = speed*3;
    dashFrms = 0;
    dashMaxFrms = 30;
  }
  void track(PVector target) {
    if (isDashing) {
      PVector move = PVector.mult(dashDir, dashSpeed);
      pos.add(move);
      dashFrms++;
      if (dashFrms >= dashMaxFrms) {
        isDashing = false; // Stop dashing after reaching max frames
    }
  } else{
    if (millis() - fireTime >= 1000){
      PVector dir = PVector.sub(target, pos);
      if (dir.mag() > 2) {
        dir.normalize();
        dir.mult(speed);
        pos.add(dir);
      }
    }
  }
 }
  boolean canAttack(Wizard w) {
    float d = dist(pos.x, pos.y, w.pos.x, w.pos.y);
    println("distance from player: " + d);
    if (d<=200 && cooldown.isFinished()) {
      return true;
    } else {
      return false;
    }
  }
  //void attack(Wizard w) {
  //  w.health -= dmg;
  //  cooldown.start();
  //}
  void dash(Wizard w) {
    dashDir = PVector.sub(w.pos, pos);
    dashDir.normalize();
    isDashing = true;
    dashFrms = 0;
    cooldown.start();
  }
  void fire(){
    fireTime = millis();
    enemyProj.add(new Projectile(pos.x, pos.y, 5, int(random(0,4)), "enemy", SewerWizard.this));
    cooldown.start();
  }
  void display() {
    imageMode(CENTER);
    image(skull, pos.x, pos.y);
    if (enemyProj.size() > 0){
      for (int j =0; j <enemyProj.size(); j++) {
        attacking = true;
        Projectile p = enemyProj.get(j);
        if (p.isOffScreen()) {
          enemyProj.remove(p);
        }
        p.display();
        p.move();
      }
    }
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
