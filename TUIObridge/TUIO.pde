import TUIO.*;
TuioProcessing tuioClient;
ArrayList<TuioCursor> tuioCursorList;

void tuioSetup() {
  tuioClient  = new TuioProcessing(this);
}

void updateTUIO() {
  tuioCursorList = tuioClient.getTuioCursorList();
}
