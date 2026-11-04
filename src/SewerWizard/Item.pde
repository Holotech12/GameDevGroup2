// Paul Rets
class Item{
  // Member
  int x,y, size;
  char a,b,c,d,e,f,g,h,i,j,k;
  PImage p1;
  // Constructor
  Item(int x, int y){
    this.x=width/2;
    this.y=height/2;
    this.size=64;
    p1 = loadImage(""); 
  }
  
  //member Methods
  void display() {
    //TODO: replace rectangle with PImage
    //iamge(p1,x,y);
    fill(222,222,222);
    rect(x,y,64,64);
  }
}
