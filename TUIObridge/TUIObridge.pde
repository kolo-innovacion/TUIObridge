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
  println(currentPage.movie.filename+"  playing. Position:  "+currentPage.movie.time()+"  /  "+currentPage.movie.duration()+" Framerate:  "+currentPage.movie.frameRate);

  if (currentPage.movie.time()>=(currentPage.movie.duration()-(2*(1.0/currentPage.movie.frameRate)))) {

    println("ACHIEVED END OF MOVIE  "+currentPage.movie.filename+"----------------------------------------------------");
  }
}

void switchPage(String input) {
  if (input==null) {//do nothing
    println("NULL INPUT");
  } else {
    //println("SWITCH FROM:  "+currentPage.name);
    currentPage=pages.get(pageDict.get(input));
    println("SWITCH TO:  "+currentPage.name);
    currentPage.movie.jump(0.0);

    if (currentPage.mediaEnd) {
      currentPage.movie.noLoop();
      currentPage.movie.play();
    } else {
      currentPage.movie.loop();
    }

    delay(100);
    startPageTimer();
  }
}

void movieEvent(Movie m) {
  m.read();
}
