// Karlyn Tran
import gifAnimation.*;
class Projectile{
  float x, y;
  int speed, frame;
  PVector pos;
  String type;
  Gif plasma;
  Projectile(float x, float y, int speed, int frame, String type, PApplet parent){
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.frame = frame;
    this.type = type;
    pos = new PVector(x, y);
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
    image(plasma,pos.x,pos.y);
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
      if (frame == 0){pos.x -=speed;}
      if (frame == 1){pos.x +=speed;}
      if (frame == 2){pos.y -=speed;}
      if (frame == 3){pos.y +=speed;}
    }
    if (type == "enemy"){
      if (frame == 0){pos.x -=speed;}
      if (frame == 1){pos.x +=speed;}
      if (frame == 2){pos.y -=speed;}
      if (frame == 3){pos.y +=speed;}
      
    }
  }
  void trackenemy(Enemy e){
    PVector target;
    target = e.pos;
    PVector dir = PVector.sub(target, pos);
      if (dir.mag() > 2) {
        dir.normalize();
        dir.mult(speed);
        pos.add(dir);
      }
  }
  void trackplayer(Wizard w){
    PVector target;
    target = w.pos;
    PVector dir = PVector.sub(target, pos);
      if (dir.mag() > 2) {
        dir.normalize();
        dir.mult(speed);
        pos.add(dir);
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
    float d = dist(pos.x,pos.y, e.pos.x, e.pos.y);
    if(d<30 && type != "enemy"){
      return true;
    }else{return false;}
  }
  boolean isHit(Projectile n){
    float d = dist(pos.x,pos.y, n.pos.x, n.pos.y);
    if(d<30 && type != "enemy"){
      return true;
    }else{return false;}
  }
}
