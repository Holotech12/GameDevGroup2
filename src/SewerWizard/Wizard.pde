class Wizard{
  int x,y,w,h,speed,health,lvl;
  Wizard(int x, int y, int lvl){
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    health = lvl*10 + 50;
    speed = 10;
  }
}
