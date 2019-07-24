Display display;
ArrayList<Button> buttons;
ArrayList<Page> pages;
int currPage=0;
String initPage;
Page currentPage;
Page timeoutPage;
boolean devMode=false;
boolean alone=false;

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
  checkAlone();
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
  //startIdle();
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

public void mousePressed() {
  switchPage(initPage);
}
int count=0;

void checkAlone() {
  if ((tuioCursorList.size()==0)&&(particles.getCount()==0)&&(!pageTimer.isRunning())&&(!idleTimer.isRunning())) {
    alone=true;
    count++;
    idleTimer.reset(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
    //idleTimer.configure(200, currentPage.outTime);
    idleTimer.start();
    println("SYSTEM IS ALONE"+count);
  } else {
    alone=false;
    idleTimer.stop(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
  }
}
