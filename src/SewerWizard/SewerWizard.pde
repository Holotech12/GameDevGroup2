//Olivia Wang

import gifAnimation.*;
Wizard player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Projectile> playerProj = new ArrayList<Projectile>();
int score = 0, clickCount = 0, hitTime;
int lvl = 1;
boolean isPaused = false, startScreen = true;
boolean transition = false;
Timer wProj, castCount;
Item item;
PImage bg;
Gif startscreen;
Projectile proj;
void setup() {
  size(800, 600);
  player = new Wizard(width/2, height/2, 0, this);
  wProj = new Timer(750);
  castCount = new Timer(100);
  proj = new Projectile(200, 200, 5, 1, "player", this);
  item = new Item(100, 100);
  bg = loadImage("gamebackground.png");
  startscreen = new Gif(this, "startscreen.gif");
  startscreen.loop();
  for (int i =0; i<2; i++) {
    enemies.add(new Enemy(int(random(width)), int(random(height)), 1));
  }
}
void startLevel(int currlev) {
  enemies.clear();
  playerProj.clear();
  if (player == null) {
    player = new Wizard(width/2, height/2, currlev, this);
  } else {
    player.pos.set(width/2, height/2);
  }
  int enemyCount =currlev - 1; // Level 1 = 2 bugs, Level 2 = 4 bugs.
  for (int i = 0; i < enemyCount; i++) {
    float rx = random(width);
    float ry = random(height);
    enemies.add(new Enemy(int(rx), int(ry), currlev));
  }
  transition = true;
}
void mousePressed() {
  if (transition) {
    transition = false;
    return;
  }
  if (isPaused) return;
  float playerx, playery;
  playerx = player.pos.x;
  playery = player.pos.y;
  player.isCasting = true;
  clickCount ++;
  castCount.start();
  if (player.freezeFrame == 0) {
    playerx -=60;
  }
  if (player.freezeFrame == 1) {
    playerx +=60;
  }
  if (player.freezeFrame == 2) {
    playery -=60;
  }
  if (player.freezeFrame ==3) {
    playery +=60;
  }
  if (clickCount == 1) {
    playerProj.add(new Projectile(playerx, playery, 5, player.freezeFrame, "player", this));
    wProj.start();
  }
  if (wProj.isFinished()) {
    playerProj.add(new Projectile(playerx, playery, 5, player.freezeFrame, "player", this));
    wProj.start();
  }
}

void draw() {
  if (startScreen) {
    background(0);
    image(startscreen, 0, 0, width, height);
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(255);
    text("Press any key to start", width/2, height/2+100);
  } else {
    background(bg);
    if (!isPaused && !transition) {
      player.updatePosition();
      player.display();
      item.display();
      proj.display();
      player.stayOnScreen();
      //  // Update and draw all enemies
      for (int i = enemies.size() - 1; i >= 0; i--) {
        Enemy e = enemies.get(i);
        e.track(player.pos);
        //e.attack();
        if (e.canAttack(player) == true) {
          e.dash(player);
          //e.fire();
          //  println("attacked for " + e.dmg + " damage");
        }
        if (player.isHit(e) && millis() - hitTime >= 1000) {
          enemies.remove(e);
          hitTime = millis();
          player.health -= e.dmg;
        }
        for (int j = 0; j<playerProj.size(); j ++) {
          Projectile p = playerProj.get(j);
          if (p.isHit(e)) {
            score ++;
            playerProj.remove(p);
            enemies.remove(e);
          }
        }
      }
      //projectiles
      for (int j =0; j <playerProj.size(); j++) {
        Projectile p = playerProj.get(j);
        if (p.isOffScreen()) {
          playerProj.remove(p);
        }
        p.move();
      }
      // Check if all enemies in the current level are defeated
      if (enemies.size() == 0) {
        lvl++;
        startLevel(lvl);
      }
    }
    player.display();
    for (Enemy e : enemies) {
      e.display();
    }
    for (Projectile p : playerProj) {
      p.display();
    }
    infoPanel();
    if (transition) {
      levelScreen();
    } else if (isPaused) {
      pauseScreen();
    }
  }
}
void levelScreen() {
  fill(0, 0, 0, 200);
  rect(0, 0, width, height);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("LEVEL " + lvl, width/2, height/2 - 40);
  textSize(22);
  text("Press SPACE or CLICK to start", width/2, height/2 + 30);
}

void pauseScreen() {
  fill(0, 0, 0, 180);
  rect(0, 0, width, height);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("PAUSED", width/2, height/2 - 30);
  textSize(20);
  text("Press 'P' to Resume", width/2, height/2 + 30);
}
void keyPressed() {
  if (startScreen){
    startScreen = false;
    startscreen.stop();
  }
  if (transition && key == ' ') {
    transition = false;
    return;
  }
  if (key == 'p' || key == 'P') {
    isPaused = !isPaused;
  }
  if (!isPaused && !transition) {
    if (key == 'a' || key == 'A' || key == 'd'|| key == 'D'||key == 'w'||
      key == 'W'||key == 's'|| key == 'S') {
      player.pressed = true;
    }
    if (key == CODED) {
      if (keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT || keyCode == UP) {
        player.pressed = true;
      }
    }
    player.setControls(key, keyCode, true);
  }
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
