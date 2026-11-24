
class Room {
  int roomCount;
  PImage bg;
  int choosingBg;
  //String [] coords = new String[4];
  ArrayList<int[]> coords = new ArrayList<>();
  PImage [] bgList = new PImage[4]; 
//  PImage [] bgList = {loadImage("gamebackgrounda.png"), loadImage("gamebackgroundb.png")};
  PImage [] roomList = new PImage[4];
  Room(int roomCount){
    this.roomCount = roomCount;
    for (int i = 0; i < 4; i++){
      choosingBg = int(random(1,3));
      if (choosingBg == 1){
        bgList[i] = (loadImage("gamebackgrounda.png"));
      } else {
        bgList[i] = (loadImage("gamebackgroundb.png"));
      }
      coords.add(new int[]{int(random(50, 750)), int(random(50, 550))});
      // if want to access coords  = coords.get(door number)[0 for x, 1 for y]
    }
  }
  void display(){
  }


}
