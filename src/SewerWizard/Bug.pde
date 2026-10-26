import gifAnimation.*;
class Bug{
  int x,y,w,h,speed,health,lvl;
  Bug(int x, int y, int lvl){
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    health = lvl*20;
    speed = lvl*2;
  }
}
