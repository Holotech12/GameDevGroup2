// Paul Rets
class Item{
  // Member
  int x,y, size;
  char a,b,c,d,e,f,g,h,i,j,k;
  PImage p1;
  // Constructor
  Item(int x, int y){
    this.x=x;
    this.y=y;
    this.size=64;
    p1 = loadImage("item.png"); 
  }
  
  //member Methods
  void display() {
    //TODO: replace rectangle with animation
    image(p1,x,y);

  }
}
