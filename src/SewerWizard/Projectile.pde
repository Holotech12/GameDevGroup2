// Karlyn Tran
import gifAnimation.*;
class Projectile{
  float x, y;
  int speed, frame;
  String type;
  Gif plasma;
  Projectile(float x, float y, int speed, int frame, String type, PApplet parent){
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.frame = frame;
    this.type = type;
    if (type == "player"){
      plasma = new Gif(parent, "wizproj.gif");
    } else{
      plasma = new Gif(parent, "enemyproj.gif");
    }
    plasma.loop();
  }
  void display(){
    imageMode(CENTER);
    rectMode(CENTER);
    //fill(255, 255,100);
    //rect(x,y, 50, 50);
    image(plasma,x,y);
  }
  void move(){
    //if (player.freezeFrame == 0){
    //  x -=speed;
    //}
    //if (player.freezeFrame == 1){
    //  x +=speed;
    //}
    //if (player.freezeFrame == 2){
    //  y -=speed;
    //}
    //if (player.freezeFrame ==3){
    //  y +=speed;
    //}
    if (type == "player"){
      if (frame == 0){x -=speed;}
      if (frame == 1){x +=speed;}
      if (frame == 2){y -=speed;}
      if (frame == 3){y +=speed;}
    }
    if (type == "enemy"){
      if (frame == 0){x -=speed;}
      if (frame == 1){x +=speed;}
      if (frame == 2){y -=speed;}
      if (frame == 3){y +=speed;}
      
    }
  }
  boolean isOffScreen(){
    if (y>height+50){
      return true;
    } else{
      return false;
    }
  }
  boolean isHit(Enemy e){
    float d = dist(x,y, e.pos.x, e.pos.y);
    if(d<30 && type != "enemy"){
      return true;
    }else{return false;}
  }
}
