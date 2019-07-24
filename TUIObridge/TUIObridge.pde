Display display;
ArrayList<Button> buttons;
ArrayList<Page> pages;
int currPage=0;
String initPage;
Page currentPage;
Page timeoutPage;
boolean devMode=false;

void settings() {
  setupLog();
  loadConfig();
  setWindow();
  partSettings();
  smooth(0);
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
  partSetup();
  frameRate(25.00);
}

void draw() {
  background(0);
  showPage();
  updateTUIO();  
  partsDraw();
}

void setWindow() {
  if (fullScr) {
    fullScreen();
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
  //frameRate(25.00);
}
void showPage() {
  //image(currentPage.img, 0, 0);

  image(currentPage.movie, 0, 0);
  //currentPage=pages.get(currPage);
  currentPage.showButtons();
  /*
  if (currentPage.timeout&&(currentPage.movie.time()>=currentPage.movie.duration())) {
   switchPage(currentPage.timeoutTo);
   }
   */
}

void switchPage(String input) {  
  println("-------------------------------Enter SWITCH PAGE function");
  if (input==null) {//do nothing
    println("NULL INPUT");
  } else {
    println("VALID INPUT");
    //println("SWITCH FROM:  "+currentPage.name);
    currentPage=pages.get(pageDict.get(input));
    println("SWITCH TO:  "+currentPage.name);
    currentPage.movie.jump(0.0);
    println("Set movie to 0.0: "+currentPage.movie.filename);
    delay(100);
    println("End of 100 ms delay");
    startPageTimer();
  }

  println("-------------------------------Leave SWITCH PAGE function");
}

void movieEvent(Movie m) {
  m.read();
}
