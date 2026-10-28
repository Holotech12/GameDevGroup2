//import gifAnimation.*;
class Bug{
  PVector pos;
  int x,y,w,h,speed,health,lvl;
  Bug(int x, int y, int lvl){
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    health = lvl*20;
    speed = lvl*2;
    pos = new PVector(x,y);
  }
  void track(PVector target){
    PVector dir = PVector.sub(target, pos);
    if (dir.mag() > 2) {
      dir.normalize();
      dir.mult(speed);
      pos.add(dir);
    }
  }
  void display(){
    fill(255,100,100);
    ellipse(pos.x, pos.y, 100,100);
  }
}
