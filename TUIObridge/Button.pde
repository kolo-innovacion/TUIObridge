class Button {
  String identifier;
  int posX;
  int posY;
  int sizeX;
  int sizeY;
  boolean currState;
  boolean prevState;
  String callPage;

  int acTone =color(255, 0, 0, 100);//active color
  int inTone =color(0, 0, 255, 100);//inactive color

  Button(String id, int x, int y, int sx, int sy ) {
    identifier=id;
    posX=x;
    posY=y;
    sizeX=sx;
    sizeY=sy;
    currState=false;
    prevState=false;
    callPage=null;
    logln(identifier+"  created on  ("+posX+","+posY+")");
    //println("Button Added");
  }

  Button(String id, int x, int y, int sx, int sy, String call) {
    identifier=id;
    posX=x;
    posY=y;
    sizeX=sx;
    sizeY=sy;
    currState=false;
    prevState=false;
    callPage=call;
    logln(identifier+"  created on  ("+posX+","+posY+")  with call to page  "+callPage);
    //println("Button Added");
  }

  void setState(boolean input) {
    currState=input;
  }

  void show() {
    if (currState) {
      fill(acTone);
    } else {
      fill(inTone);
    }
    noStroke();
    rect(posX, posY, sizeX, sizeY);
    fill(255);
    text(identifier, posX, posY+(sizeY/2));
    currState=false;
  }
}
