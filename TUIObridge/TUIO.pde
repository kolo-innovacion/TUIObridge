import TUIO.*;
TuioProcessing tuioClient;
ArrayList<TuioCursor> tuioCursorList;

boolean tuioVerbose = false; // print console debug messages
boolean callback = false; // updates only after callbacks

int curColor=color(0, 255, 0);

void tuioSetup() {
  tuioClient  = new TuioProcessing(this);
  if (!callback) {
    //frameRate(60);
    loop();
  } else noLoop(); // or callback updates
}

void updateTUIO() {
  tuioCursorList = tuioClient.getTuioCursorList();

  //ArrayList<TuioCursor> tuioCursorList = tuioClient.getTuioCursorList();
  for (int i=0; i<tuioCursorList.size(); i++) {
    TuioCursor tcur = tuioCursorList.get(i);
    ArrayList<TuioPoint> pointList = tcur.getPath();

    if (pointList.size()>0) {
      stroke(0, 0, 255);
      TuioPoint start_point = pointList.get(0);
      for (int j=0; j<pointList.size(); j++) {
        TuioPoint end_point = pointList.get(j);
        line(start_point.getScreenX(display.sizeX), start_point.getScreenY(display.sizeY), end_point.getScreenX(display.sizeX), end_point.getScreenY(display.sizeY));
        start_point = end_point;
      }

      stroke(192, 192, 192);
      noStroke();
      fill(curColor);
      ellipse( tcur.getScreenX(display.sizeX), tcur.getScreenY(display.sizeY), 20, 20);
      fill(0);
      text(""+ tcur.getCursorID(), tcur.getScreenX(display.sizeX)-5, tcur.getScreenY(display.sizeY)+5);
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
      //logln(temp.identifier);
      sendUDP(temp.identifier);
      println(temp.identifier+"  activated");
      switchPage(temp.identifier);//if no callpage is assigned, nothing happens
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
  if (tuioVerbose) logln("add cur "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY());
  checkPress(tcur.getScreenX(display.sizeX), tcur.getScreenY(display.sizeY));
  //redraw();
}

// --------------------------------------------------------------
// these callback methods are called whenever a TUIO event occurs
// there are three callbacks for add/set/del events for each object/cursor/blob type
// the final refresh callback marks the end of each TUIO frame

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
  if (tuioVerbose) logln("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  if (tuioVerbose) logln("set obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
    +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  if (tuioVerbose) logln("del obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
}

// --------------------------------------------------------------
// called when a cursor is added to the scene


// called when a cursor is moved
void updateTuioCursor (TuioCursor tcur) {
  if (tuioVerbose) logln("set cur "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY()
    +" "+tcur.getMotionSpeed()+" "+tcur.getMotionAccel());
  //redraw();
}

// called when a cursor is removed from the scene
void removeTuioCursor(TuioCursor tcur) {
  if (tuioVerbose) logln("del cur "+tcur.getCursorID()+" ("+tcur.getSessionID()+")");
  //redraw()
}

// --------------------------------------------------------------
// called when a blob is added to the scene
void addTuioBlob(TuioBlob tblb) {
  if (tuioVerbose) logln("add blb "+tblb.getBlobID()+" ("+tblb.getSessionID()+") "+tblb.getX()+" "+tblb.getY()+" "+tblb.getAngle()+" "+tblb.getWidth()+" "+tblb.getHeight()+" "+tblb.getArea());
  //redraw();
}

// called when a blob is moved
void updateTuioBlob (TuioBlob tblb) {
  if (tuioVerbose) logln("set blb "+tblb.getBlobID()+" ("+tblb.getSessionID()+") "+tblb.getX()+" "+tblb.getY()+" "+tblb.getAngle()+" "+tblb.getWidth()+" "+tblb.getHeight()+" "+tblb.getArea()
    +" "+tblb.getMotionSpeed()+" "+tblb.getRotationSpeed()+" "+tblb.getMotionAccel()+" "+tblb.getRotationAccel());
  //redraw()
}

// called when a blob is removed from the scene
void removeTuioBlob(TuioBlob tblb) {
  if (tuioVerbose) logln("del blb "+tblb.getBlobID()+" ("+tblb.getSessionID()+")");
  //redraw()
}

// --------------------------------------------------------------
// called at the end of each TUIO frame
void refresh(TuioTime frameTime) {
  if (tuioVerbose) logln("frame #"+frameTime.getFrameID()+" ("+frameTime.getTotalMilliseconds()+")");
  if (callback) redraw();
}
