class Display {
  int sizeX;
  int sizeY;
  int tone =color(255, 255, 255);
  //ArrayList<Button> buttonList;

  Display() {
    //getConfig();
    sizeX=config.getInt("resx", 100);
    sizeY=config.getInt("resy", 100);
    deLog(sizeX +" X "+sizeY+"  display has been created");
    //scale=(width*(6.0/8.0));
    //deLog(scale);
    //buttonList = new ArrayList<Button>() ;
  }

  void show() {
    fill(tone);
    stroke(255, 128, 0);
    rect(0, 0, sizeX, sizeY);
    //deLog(scale);
  }
  void getConfig() {
    //deLog(config.getInt("resx"));
    //deLog(config.getInt("resy"));
  }
}
