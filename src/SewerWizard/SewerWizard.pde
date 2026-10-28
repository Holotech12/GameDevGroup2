//import gifAnimation.*;
Wizard player;
ArrayList<Bug> enemies = new ArrayList<Bug>();
int score = 0;
void setup() {
  size(800, 600);
  player = new Wizard(width/2, height/2, 0);
  for (int i =0; i<2; i++) {
    enemies.add(new Bug(int(random(width)), int(random(height)), 1));
  }
}

void draw() {
  background(100, 100, 100);
  player.updatePosition();
  player.display();

  //  // Update and draw all enemies
  for (int i = 0; i<enemies.size(); i++) {
    Bug e = enemies.get(i);
    e.track(player.pos);
    e.display();
    if (player.isHit(e)) {
      enemies.remove(e);
      player.health -=10;
      score += 1;
    }
  }
  infoPanel();
}
void keyPressed() {
  player.setControls(key, keyCode, true);
}

void keyReleased() {
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
