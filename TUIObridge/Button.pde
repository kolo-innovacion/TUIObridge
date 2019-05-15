class Button {
  String identifier;
  int posX;
  int posY;
  int sizeX;
  int sizeY;
  boolean currState;
  boolean prevState;

  int acTone =color(255, 0, 0);//active color
  int inTone =color(0, 0, 255);//inactive color

  Button(String id, int x, int y, int sx, int sy ) {
    identifier=id;
    posX=x;
    posY=y;
    sizeX=sx;
    sizeY=sy;
    currState=false;
    prevState=false;
    println(identifier+"  created on  "+posX+","+posY);
  }
  void show() {
    fill(inTone);
    noStroke();
    rect(posX, posY, sizeX, sizeY);
    fill(255);
    text(identifier, posX, posY+(sizeY/2));
  }
}
