Display display;
ArrayList<Button> buttons;
ArrayList<Page> pages;
int currPage=0;
Page currentPage;


void settings() {
  //gui config happens here
  setupLog();
  loadConfig();
  setWindow();
}
/*
void setup0() {
 setupGUI();
 instanceDisplay();
 instanceButtons();
 instancePages();
 tuioSetup();
 setupUDP();
 }
 
 void draw0() {
 display.show();
 showButtons();
 updateTUIO();
 }
 */
void setup() {
  setupGUI();
  instanceDisplay();
  setupDict();
  //instanceButtons();
  instancePages();
  tuioSetup();
  setupUDP();
}

void draw() {
  display.show();
  showPage();
  //updateTUIO();
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
void showPage() {
  //currentPage=pages.get(currPage);
  currentPage.showButtons();
}

void switchPage(String input) {
  if (input==null) {//do nothing
  } else {
    currentPage=pages.get(pageDict.get(input));
  }
}
