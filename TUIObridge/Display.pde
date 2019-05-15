class Display {
  int sizeX;
  int sizeY;
  float scale;
  //ArrayList<Button> buttonList;

  Display() {
    //getConfig();
    sizeX=dispConf.getInt("resx", 100);
    sizeY=dispConf.getInt("resy", 100);
    scale=0.1;
    //scale=(width*(6.0/8.0));
    //println(scale);
    //buttonList = new ArrayList<Button>() ;
  }
  void  setScale(float input) {
    //scale=input;
    println((width*(6.0/8.0))/sizeX);
  }
  void show() {
    rect(20, 20, sizeX, sizeY);
    //println(scale);
  }
  void getConfig() {
    println(dispConf.getInt("resx"));
    println(dispConf.getInt("resy"));
  }
}
