Display display;
ArrayList<Button> buttons;


void settings() {
  //gui config happens here
  loadConfig();
  setWindow();
}

void setup() {
  rectMode(CORNER);
  colorMode(RGB, 255);
  noStroke();
  display=new Display();
  instanceButtons();
  frameRate(60);
  //buttons=new ArrayList<Button>();

  for (int i =0; i<10; i++) {
    //buttons.add(new Button("a"));
  }
}

void draw() {
  //println(width);
  //display.setScale(2);
  display.show();
  for (int i=0; i<buttons.size(); i++) {
    buttons.get(i).show();
  }
}

void setWindow() {
  if (fullScr) {
    fullScreen(P2D);
  } else {
    size(winX, winY, P2D);
  }
}
