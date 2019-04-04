class Button {
  String name;
  int posX;
  int posY;
  int sizeX;
  int sizeY;
  boolean currState;
  boolean prevState;

  Button(String n, int x, int y, int sx, int sy ) {
    name=n;
    posX=x;
    posY=y;
    sizeX=sx;
    sizeY=sy;
  }
}
