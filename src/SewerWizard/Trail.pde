class Trail {
  int x, y, size;
  PVector pos;
  Trail(int x, int y) {
    this.x = x;
    this.y = y;
    pos = new PVector(x, y);
    size = 100;
  }
}
