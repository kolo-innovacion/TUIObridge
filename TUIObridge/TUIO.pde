import TUIO.*;
TuioProcessing tuioClient;
ArrayList<TuioCursor> tuioCursorList;

//for testing purposes, only:
//float scaleX=0.2840;//384/1690=0.22721...
//float scaleY=0.750;//288/384

//inverse scales:
//float scaleX=3.520;//384/1690=0.22721...
//float scaleY=1.3330;//288/384

float scaleX;//384/1690=0.22721...
float scaleY;//288/384

boolean tuioVerbose = false; // print console debug messages
boolean callback = false; // updates only after callbacks

int curColor=color(0, 255, 0);

void tuioSetup() {
  tuioClient  = new TuioProcessing(this);
  deLog(inf, tuia, "TUIO client started. ");
  if (!callback) {
    //frameRate(60);
    loop();
  } else {
  }//noLoop(); // or callback updates
}

void updateTUIO() {
  tuioCursorList = tuioClient.getTuioCursorList();

  //ArrayList<TuioCursor> tuioCursorList = tuioClient.getTuioCursorList();
  //numCursors=tuioCursorList.size();

  for (int i=0; i<tuioCursorList.size(); i++) {
    TuioCursor tcur = tuioCursorList.get(i);


    //fill(255, 0, 0, 255);
    //ellipse( tcur.getScreenX(winX), tcur.getScreenY(winY), 20, 20);

    //ps.addParticle(tcur.getScreenX(winX), tcur.getScreenY(winY) );
    spawn(int(tcur.getScreenX(winX)*scaleX), int(tcur.getScreenY(winY)*scaleY) );

    ArrayList<TuioPoint> pointList = tcur.getPath();

    if (pointList.size()>0) {
      stroke(0, 0, 255);
      TuioPoint start_point = pointList.get(0);
      for (int j=0; j<pointList.size(); j++) {
        TuioPoint end_point = pointList.get(j);
        //line(start_point.getScreenX(display.sizeX), start_point.getScreenY(display.sizeY), end_point.getScreenX(display.sizeX), end_point.getScreenY(display.sizeY));
        start_point = end_point;
      }

      //spawnCursor(int(tcur.getScreenX(winX)*scaleX), int(tcur.getScreenY(winY)*scaleY));
      if (devMode) {
        stroke(192, 192, 192);
        noStroke();
        //fill(255);
        //ellipse( tcur.getScreenX(winX), tcur.getScreenY(winY), 20, 20);
        fill(0);
        text(""+ tcur.getCursorID(), tcur.getScreenX(winX)-5, tcur.getScreenY(winY)+5);
      }
    }
  }
}
//

void checkPress(int curX, int curY) {

  boolean checkX=false;
  boolean checkY=false;

  for (int i=0; i<currentPage.pButtons.size(); i++) {
    Button temp=currentPage.pButtons.get(i);
    checkX=inRange(curX, temp.posX, temp.posX+temp.sizeX);
    checkY=inRange(curY, temp.posY, temp.posY+temp.sizeY);
    if (checkX&&checkY) {
      //deLog(temp.identifier);
      sendUDP(temp.identifier);
      ////println(temp.identifier+"  activated");
      switchPage(temp.identifier);//if no callpage is assigned, nothing happens

      deLog(met, tuia, temp.identifier);
      //in this case, button is pressed, send UDP!
      temp.setState(true);
    } else {
      temp.setState(false);
    }
  }
}

boolean inRange(int input, int lef, int rig) {
  if ((input>=lef)&&(input<=rig)) {
    return true;
  } else {
    return false;
  }
}

void addTuioCursor(TuioCursor tcur) {
  checkPress(int(tcur.getScreenX(winX)*scaleX), int(tcur.getScreenY(winY)*scaleY));
  //startPageTimer();
  //redraw();
}

// --------------------------------------------------------------
// these callback methods are called whenever a TUIO event occurs
// there are three callbacks for add/set/del events for each object/cursor/blob type
// the final refresh callback marks the end of each TUIO frame

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
}

// --------------------------------------------------------------
// called when a cursor is added to the scene


// called when a cursor is moved
void updateTuioCursor (TuioCursor tcur) {
  //redraw();
}

// called when a cursor is removed from the scene
void removeTuioCursor(TuioCursor tcur) {
  //redraw()
}

// --------------------------------------------------------------
// called when a blob is added to the scene
void addTuioBlob(TuioBlob tblb) {
  //redraw();
}

// called when a blob is moved
void updateTuioBlob (TuioBlob tblb) {
  //redraw()
}

// called when a blob is removed from the scene
void removeTuioBlob(TuioBlob tblb) {
  //redraw()
}

// --------------------------------------------------------------
// called at the end of each TUIO frame
void refresh(TuioTime frameTime) {
  if (callback) redraw();
}
