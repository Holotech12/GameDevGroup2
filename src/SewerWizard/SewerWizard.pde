//Olivia Wang

import gifAnimation.*;
Wizard player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Projectile> playerProj = new ArrayList<Projectile>();
int score = 0, clickCount = 0;
int lvl = 1;
boolean isPaused = false;
Timer wProj;
void setup() {
  size(800, 600);
  player = new Wizard(width/2, height/2, 0, this);
  wProj = new Timer(750);
  for (int i =0; i<2; i++) {
    enemies.add(new Enemy(int(random(width)), int(random(height)), 1));
  }
}
void startLevel(int currlev) {
  enemies.clear();
  if (player == null) {
    player = new Wizard(width/2, height/2, currlev, this);
  } 
  int enemyCount =currlev - 1; // Level 1 = 2 bugs, Level 2 = 4 bugs.
  for (int i = 0; i < enemyCount; i++) {
    float rx = random(width);
    float ry = random(height);
    enemies.add(new Enemy(int(rx), int(ry), currlev));
  }
}
void mousePressed(){
  float playerx, playery;
  playerx = player.pos.x;
  playery = player.pos.y;
  clickCount ++;
  if (player.freezeFrame == 0){
    playerx -=60;
  }
  if (player.freezeFrame == 1){
    playerx +=60;
  }
  if (player.freezeFrame == 2){
    playery -=60;
  }
  if (player.freezeFrame ==3){
    playery +=60;
  }
  if (clickCount == 1){
    playerProj.add(new Projectile(playerx, playery, 5,player.freezeFrame, "player"));
    wProj.start();
  }
  if (wProj.isFinished()){
    playerProj.add(new Projectile(playerx, playery, 5, player.freezeFrame, "player"));
    wProj.start();
  }
}
void draw() {
  background(100, 100, 100);
  if (!isPaused) {
    player.updatePosition();
    player.display();
    player.stayOnScreen();
    //  // Update and draw all enemies
    for (int i = enemies.size() - 1; i >= 0; i--) {
      Enemy e = enemies.get(i);
      e.track(player.pos);
      e.display();
      if (e.canAttack(player) == true) {
        e.attack(player);
      }
      if (player.isHit(e)) {
        enemies.remove(i);
        player.health -= 10;
        score += 1;
      }
      for (int j = 0; j<playerProj.size(); j ++) {
        Projectile p = playerProj.get(j);
        if (p.isHit(e)) {
          playerProj.remove(p);
          enemies.remove(e);
        }
      }
    }
    for (int j =0;  j <playerProj.size(); j++){
      Projectile p = playerProj.get(j);
      if (p.isOffScreen()){
        playerProj.remove(p);
      }
      p.display();
      p.move();
    }
    // Check if all enemies in the current level are defeated
    if (enemies.size() == 0) {
      lvl++;
      startLevel(lvl);
    }
  }
  infoPanel();
  if (isPaused){  
  }
}
void keyPressed() {
  if (key == 'a' || key == 'A' || key == 'd'|| key == 'D'||key == 'w'||
  key == 'W'||key == 's'|| key == 'S'){
    player.pressed = true;
  }
  if (key == CODED){
    if (keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT || keyCode == UP){
      player.pressed = true;
    }
  }
  player.setControls(key, keyCode, true);
}

void keyReleased() {
  player.pressed = false;
  player.setControls(key, keyCode, false);
}
void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 0, width, 40);
  fill(255);
  textSize(24);
  textAlign(CORNER, CORNER);
  text("Score: " + score, 20, 35);
  text("Health: " + player.health, 300, 35);
}
