Display display;
ArrayList<Button> buttons;


void settings() {
  //gui config happens here
  configLoad();
  size(winX, winY);
}

void setup() {

  display=new Display();
  frameRate(60);
  buttons=new ArrayList<Button>();

  for (int i =0; i<10; i++) {
    //buttons.add(new Button("a"));
  }
}

void draw() {
  //println(width);
  //display.setScale(2);
  display.show();
}
