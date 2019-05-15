Display display;
ArrayList<Button> buttons;


void settings() {
  //gui config happens here
  loadConfig();
  setWindow();
}

void setup() {
  setupGUI();
  instanceDisplay();
  instanceButtons();
  tuioSetup();
}

void draw() {
  display.show();
  showButtons();
  updateTUIO();
}

void setWindow() {
  if (fullScr) {
    fullScreen(P2D);
  } else {
    size(winX, winY, P2D);
  }
}

void setupGUI() {
  rectMode(CORNER);
  colorMode(RGB, 255);
  noStroke();
  //display=new Display();
  //instanceButtons();
  frameRate(60);
}

void showButtons() {  
  for (int i=0; i<buttons.size(); i++) {
    buttons.get(i).show();
  }
}
