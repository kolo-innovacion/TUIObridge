Display display;
ArrayList<Button> buttons;
ArrayList<Page> pages;
int currPage=0;
Page currentPage;


void settings() {
  setupLog();
  loadPres();
  instancePages();
  //loadConfig();
  //setWindow();
}

void setup() {
  //setupGUI();
  //instanceDisplay();
  //setupDict();
  //instancePages();
  //tuioSetup();
  //setupUDP();
}

void draw() {
  //background(0);
  //showPage();
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
  image(currentPage.img, 0, 0);

  //currentPage=pages.get(currPage);
  currentPage.showButtons();
}

void switchPage(String input) {
  if (input==null) {//do nothing
  } else {
    currentPage=pages.get(pageDict.get(input));
  }
}
