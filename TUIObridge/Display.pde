class Display {
  int sizeX;
  int sizeY;
  int tone =color(255, 255, 255);
  PImage currImage;
  //ArrayList<Button> buttonList;

  Display() {
    //getConfig();
    sizeX=config.getInt("resx", 100);
    sizeY=config.getInt("resy", 100);
    logln(sizeX +" X "+sizeY+"  display has been created");
    //scale=(width*(6.0/8.0));
    //logln(scale);
    //buttonList = new ArrayList<Button>() ;
  }

  void show() {
    fill(tone);
    stroke(255, 128, 0);
    rect(0, 0, sizeX, sizeY);
    currImage=pages.get(currPage).img;
    //currImage=pages.get(currPage).img;
    image(currImage, 0, 0);
    //logln(scale);
  }
  void getConfig() {
    //logln(config.getInt("resx"));
    //logln(config.getInt("resy"));
  }
}
