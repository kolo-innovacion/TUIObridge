class Button {
  String identifier;
  int posX;
  int posY;
  int sizeX;
  int sizeY;
  boolean currState;
  boolean prevState;

  Button(String n, int x, int y, int sx, int sy ) {
    identifier=n;
    posX=x;
    posY=y;
    sizeX=sx;
    sizeY=sy;
    currState=false;
    prevState=false;
  }
}
