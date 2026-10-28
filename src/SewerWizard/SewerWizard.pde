import gifAnimation.*;
Wizard player;
ArrayList<Bug> enemies = new ArrayList<Bug>();
void setup(){
  size(800,600);
  player = new Wizard(width/2, height/2, 0);
  enemies.add(new Bug(int(random(width)), int(random(height)),1));
}
void draw(){
  background(100,100,100);
  player.updatePosition();
  player.display();

//  // Update and draw all enemies
  for (int i = 0; i<enemies.size(); i++) {
    Bug e = enemies.get(i);
    e.track(player.pos);
    e.display();
  }
}
void keyPressed() {
  player.setControls(key, keyCode, true);
}

void keyReleased() {
  player.setControls(key, keyCode, false);
}
