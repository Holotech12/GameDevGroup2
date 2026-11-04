// Paul Rets
class Item{
// Member
int x,y, size;
char a,b,c,d,e,f,g,h,i,j,k;
PImage p1;

// Constructor
Class() {
this.x=width/2;
this.y=height/2;
this.size=64;
p1 = loadImage("item.png");

}

//member Methods
void display() {
image(p1,x,y);
}

}
