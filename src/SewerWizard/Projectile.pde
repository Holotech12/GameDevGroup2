import gifAnimation.*;
class Projectile{
  int x, y, speed;
  //Gif plasma, eplasma;
  Projectile(int x, int y, PApplet parent, int speed){
    this.x = x;
    this.y = y;
    this.speed = speed;
    //if (type == 1){
    //  plasma = new Gif(parent, "projectile.gif");
    //} else{
    //  plasma = new Gif(parent, "eprojectile.gif");
    //}
    //plasma.loop();
  }
  void display(){
    imageMode(CENTER);
    rectMode(CENTER);
    fill(255, 255,100);
    rect(50, 50, x, y);
    //image(plasma,x,y);
  }
  void move(){
    y-=speed;
  }
  boolean isOffScreen(){
    if (y>height+50){
      return true;
    } else{
      return false;
    }
  }
  //boolean isHit(Bug b){
  //  float d = dist(x,y, b.x, b.y);
  //  if(d<30){
  //    return true;
  //  }else{ return false;}
  //}
}
