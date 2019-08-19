ArrayList<Button> buttons;
ArrayList<Page> pages;
int currPage=0;
String initPage;
Page currentPage;
Page timeoutPage;
//boolean devMode=true;
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
  //timer setup here?
  instancePages();
  tuioSetup();
  setupUDP();
  timerSetup();
  setupPS();
  winSetup();
  frameRate(fps);
}

void draw() {
  if (exitFlag) {
    deLog(err, cona, "Requirements not achieved for proper execution. Program exit. Please check log and documentation.");
    exit();
  }

  background(0);

  showPage();
  updateTUIO();  
  ps.run();
  //partsDraw();
}

void mousePressed() {

  //for (int i=0; i<100; i++) {ps.addParticle(mouseX, mouseY);}
  p1.x=float(mouseX)/width;
  p1.y=float(mouseY)/height;
  println(p1.x+"  ,  "+p1.y);
  //pv.x=p1.x-p0.x;
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
    deLog(deb, paga, "Switch page from:  "+currentPage+"  to  "+input);
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
