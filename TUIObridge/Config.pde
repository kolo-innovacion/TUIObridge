XML dispConf;
int winX=100;
int winY=100;
boolean fullScr=false;
float winScale=1.0;

int winTol=20;

void configLoad() {
  dispConf = loadXML("config.xml");
  fullScr=boolean(dispConf.getInt("fullscreen", 0));

  if (fullScr) {
    winTol=0;
  } else {
  }

  winScale=dispConf.getFloat("winScale", 100);
  winX=int(dispConf.getInt("resx", 100)*winScale)+2*winTol;
  winY=int(dispConf.getInt("resy", 100)*winScale)+7*winTol;
}

int extInt(XML obj, String name) {
  return obj.getInt(name, 0);
}

String extString(XML obj, String name) {
  return obj.getString(name,"null");
}
