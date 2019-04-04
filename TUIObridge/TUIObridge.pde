Display display=new Display(1920, 540);
void setup() {
  size(1280, 720);
  frameRate(60);
}

void draw() {
  //println(width);
  display.setScale(2);
  display.show();
}
