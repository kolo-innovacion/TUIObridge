XML dispConf;
int winX=100;
int winY=100;
float winScale=1.0;

int winTol=20;

void configLoad() {
  dispConf = loadXML("config.xml");
  winScale=dispConf.getFloat("winScale", 100);
  winX=int(dispConf.getInt("resx", 100)*winScale)+2*winTol;
  winY=int(dispConf.getInt("resy", 100)*winScale)+7*winTol;
  //XML display = config.getChild("diskplay");
  //println("loaded");
  //display.getContent();
  //firstChild.getChild("button");
  //println(firstChild.getString("species"));
}
