Display display=new Display(1920, 540);
ArrayList<Button> buttons;

void setup() {
  configSetup();
  size(800, 450);
  frameRate(60);
  buttons=new ArrayList<Button>();

  for (int i =0; i<10; i++) {
    //buttons.add(new Button("a"));
  }
}

void draw() {
  //println(width);
  display.setScale(2);
  display.show();
}
