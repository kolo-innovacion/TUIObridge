Display display;
ArrayList<Button> buttons;
ArrayList<Page> pages;
int currPage=0;
String initPage;
Page currentPage;
Page timeoutPage;


void settings() {
  setupLog();
  loadConfig();
  setWindow();
}

void setup() {
  setupGUI();
  instanceDisplay();
  setupDict();
  loadPres();
  instancePages();
  tuioSetup();
  setupUDP();
  timerSetup();
}

void draw() {
  background(0);
  showPage();
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
  background(0);
  frameRate(25.00);
}
void showPage() {
  //image(currentPage.img, 0, 0);

  image(currentPage.movie, 0, 0, width, height);
  //currentPage=pages.get(currPage);
  currentPage.showButtons();
}

void switchPage(String input) {
  if (input==null) {//do nothing
  } else {
    currentPage=pages.get(pageDict.get(input));
    currentPage.movie.jump(0.0);
    //set timeout next page
    startPageTimer();
    /*
    if (currentPage.timeout) {
     timeoutPage=pages.get(pageDict.get(currentPage.timeoutTo));
     println(currentPage.name+"  will timeout to  "+timeoutPage.name);
     println("TIMER RUNNING:  "+pageTimer.isRunning());
     println("TIMER PAUSED:  "+pageTimer.isPaused());
     pageTimer.reset();
     pageTimer.configure(100, 6000);
     pageTimer.start();
     println("pagTimer STARTED");
     } else {
     }*/
  }
}

void movieEvent(Movie m) {
  m.read();
}
