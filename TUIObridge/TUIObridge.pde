Display display;
ArrayList<Button> buttons;


void settings() {
  configLoad();

  
  display=new Display();
  size(winX, winY);
}

void setup() {

  //size(1000, 450);
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
