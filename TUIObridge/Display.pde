class Display {
  int sizeX;
  int sizeY;
  float scale;
  //ArrayList<Button> buttonList;

  Display(int sx, int sy) {
    sizeX=sx;
    sizeY=sy;
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
    rect(width/8, height/8, 960, 270);
    //println(scale);
  }
}
