XML config;
int winX=100;
int winY=100;
boolean fullScr=false;
float winScale=1.0;

int winTol=20;

void loadConfig() {
  config = loadXML("config.xml");
  println("config XML file has been loaded");

  //fullScr=boolean(extInt(config, "fullscreen"));
  fullScr=boolean(config.getInt("fullscreen", 0));

  if (fullScr) {
    winTol=0;
  } else {
  }

  winScale=config.getFloat("winScale", 100);
  winX=int(config.getInt("resx", 100)*winScale)+2*winTol;
  winY=int(config.getInt("resy", 100)*winScale)+7*winTol;
}

int extInt(XML obj, String name) {
  return obj.getInt(name, 0);
}

String extString(XML obj, String name) {
  return obj.getString(name, "null");
}

void instanceButtons() {

  buttons=new ArrayList<Button>();
  XML[] buttonArr = config.getChildren("button");

  for (int i=0; i<buttonArr.length; i++) {
    XML temp = buttonArr[i];
    //println(temp.getString("id"));
    buttons.add(new Button(temp.getString("id"), temp.getInt("posx"), temp.getInt("posy"), temp.getInt("sizex"), temp.getInt("sizex")));
  }
  println(buttonArr.length+"  buttons have been added");
}
