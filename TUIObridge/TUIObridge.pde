ArrayList<Button> buttons;
ArrayList<Page> pages;
int currPage=0;
String initPage;
Page currentPage;
Page timeoutPage;
boolean devMode=false;

void settings() {
  setupLog();
  exitFlag=loadConfig();
  setWindow();
  //partSettings();
  //smooth(0);// now on setup GUI
}

void setup() {

  setupGUI();
  //instanceDisplay();

  setupDict();
  exitFlag = loadPres();
  instancePages();
  //tuioSetup();
  //setupUDP();
  //timerSetup();
  //partSetup();
  //frameRate(25.00);
}

void draw() {
  if (exitFlag) {
    deLog(err, cona, "Requirements not achieved for proper execution. Program exit. Please check log and documentation.");
    exit();
  }

  background(0);

  //showPage();
  //updateTUIO();  
  //partsDraw();
}

void setWindow() {
  deLog(inf, cona, "Fullscreen value: "+fullScr);
  if (fullScr) {
    fullScreen();
    deLog(inf, cona, "Fullscreen mode. Width: "+width+" Height: "+height);
  } else {
    //size(winX, winY, P2D);
    size(winX, winY, P3D);
    deLog(inf, cona, "Window created. Width: "+width+" Height: "+height);
  }
}

void setupGUI() {
  rectMode(CORNER);
  colorMode(RGB, 255, 255, 255, 255);
  noStroke();
  background(0);
  //smooth(0);
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
  if (input==null) {//do nothing
    //println("NULL INPUT");
  } else {
    ////println("SWITCH FROM:  "+currentPage.name);
    currentPage=pages.get(pageDict.get(input));
    //println("SWITCH TO:  "+currentPage.name);
    currentPage.movie.jump(0.0);
    delay(100);
    startPageTimer();
  }
}

void movieEvent(Movie m) {
  m.read();
}
