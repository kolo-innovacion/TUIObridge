class Button {
  String identifier;
  int posX;
  int posY;
  int sizeX;
  int sizeY;
  boolean currState;
  boolean prevState;

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

    deLog(deb, cona, "Created button: "+id);
    //callPage=null;
    //deLog(identifier+"  created on  ("+posX+","+posY+")");
    //println("-------------------------Button Added");
  }

  void setState(boolean input) {
    currState=input;
  }

  void show() {
    if (devMode) {
      if (currState) {
        fill(acTone);
        //delay(500);
      } else {
        fill(inTone);
      }
      noStroke();
      rect(posX, posY, sizeX, sizeY);
      fill(255);
      text(identifier, posX, posY+(sizeY/2));
    }
    currState=false;
  }
}
