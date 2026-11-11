// Karlyn Tran
import gifAnimation.*;
class Wizard{
  PVector pos;
  int freezeFrame, castFrame;
  PImage [] freeze = new PImage[4];
  PImage [] castFrames = {loadImage("wlc.png"), loadImage("wrc.png"),
  loadImage("wac.png"), loadImage("wtc.png")};
  int x,y,size,speed,health,lvl;
  boolean pressed = false, moveLeft, moveRight, moveUp, moveDown, isCasting;
  Gif wleft, wright, wforward, wback, currentgif;
  Wizard(int x, int y, int lvl, PApplet parent){
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    health = lvl*10 + 50;
    speed = 5;
    pos = new PVector(x, y);
    wleft = new Gif(parent, "WizardLeft.gif");
    wright = new Gif(parent, "WizardRight.gif");
    wforward = new Gif(parent, "WizardAway.gif");
    wback = new Gif(parent, "WizardToward.gif");
    freeze[0] = loadImage("wl.png");
    freeze[1] = loadImage("wr.png");
    freeze[2] = loadImage("wa.png");
    freeze[3] = loadImage("wt.png");
    freezeFrame = 2;
    size = 70;
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
    if (moveLeft){currentgif = wleft; freezeFrame = 0;}
    if (moveRight){currentgif = wright; freezeFrame = 1;}
    if (moveUp){currentgif = wforward; freezeFrame = 2;}
    if (moveDown){currentgif = wback; freezeFrame = 3;}
    castFrame = freezeFrame;
    if (pressed){
      image(currentgif, pos.x,pos.y);
    }
    if (!pressed && isCasting == false) {
      image(freeze[freezeFrame], pos.x, pos.y);
    }
    if (isCasting){
      image(castFrames[castFrame], pos.x, pos.y);
    }
    if (castCount.isFinished()) {
      isCasting = false;
    }
  }
  boolean isHit(Enemy c) {
    float distance = dist(c.pos.x, c.pos.y, pos.x, pos.y);
    return distance < size;
  }
  boolean isHite(Projectile p) {
    float distance = dist(p.pos.x, p.pos.y, pos.x, pos.y);
    if (p.type != "player"){
      return distance < size-20;
    } else {return false;}
  }
  boolean isItem(Item t){
    float d = dist(x,y, t.x, t.y);
    if(d<30){
      return true;
    }else{ return false;}
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
