XML config;
int winX=100;
int winY=100;
boolean fullScr=false;
float winScale=1.0;

int winTol=20;

void loadConfig() {
  config = loadXML("config.xml");
  logln("config XML file has been loaded");

  //fullScr=boolean(extInt(config, "fullscreen"));
  fullScr=boolean(config.getInt("fullscreen", 0));

  if (fullScr) {
    winTol=0;
  } else {
  }

  winScale=config.getFloat("winScale", 100);
  //winX=int(config.getInt("resx", 100)*winScale)+1*winTol;
  winX=int(config.getInt("resx", 100)*winScale);
  //winY=int(config.getInt("resy", 100)*winScale)+7*winTol;
  winY=int(config.getInt("resy", 100)*winScale);
  targetIP=config.getString("targetIP", "255.255.255.255");
  targetPort=config.getInt("targetPort", 5000);
}

int extInt(XML obj, String name) {
  return obj.getInt(name, 0);
}

String extString(XML obj, String name) {
  return obj.getString(name, "null");
}

void instanceButtons0() {

  buttons=new ArrayList<Button>();
  XML[] buttonArr = config.getChildren("button");

  for (int i=0; i<buttonArr.length; i++) {
    XML temp = buttonArr[i];
    //logln(temp.getString("id"));
    buttons.add(new Button(temp.getString("id"), temp.getInt("posx"), temp.getInt("posy"), temp.getInt("sizex"), temp.getInt("sizex")));
  }
  logln(buttonArr.length+"  buttons have been added");
}


void instanceButtons() {
  buttons=new ArrayList<Button>();
  XML curr=nextLevel(config, "userDefinedEvents");
  XML[] buttonArr = curr.getChildren("userDefinedEvent");
  //logln(buttonArr);
  for (int i=0; i<buttonArr.length; i++) {
    XML temp = buttonArr[i];

    String tempID=temp.getString("name");

    temp=nextLevel(temp, "userEvents");
    temp=nextLevel(temp, "userEvent");
    temp=nextLevel(temp, "parameters");
    XML tempX=nextLevel(temp, "x");
    XML tempY=nextLevel(temp, "y");
    XML tempW=nextLevel(temp, "width");
    XML tempH=nextLevel(temp, "height");

    buttons.add(new Button(tempID, tempX.getIntContent(), tempY.getIntContent(), tempW.getIntContent(), tempH.getIntContent()));
  }
}

void instanceDisplay() {
  display=new Display();
}

XML nextLevel(XML input, String name) {
  XML temp = input.getChild(name);
  //checkValid(temp);
  return temp;
  //return null;
}

void checkValid(XML input) {
  if (input!=null) {
    logln("VALID");
  } else {
    logln("NULL ENCOUNTERED");
  }
}

void logln(String input) {
  String output = "";
  output+=year()+"-";
  output+=logForm(month())+"-";
  output+=logForm(day())+"  ";
  output+=logForm(hour())+":";
  output+=logForm(minute())+":";
  output+=logForm(second())+"  ";
  output+=String.format("%03d", (millis()%1000))+" ms  ";
  output+="->  ";
  output+=input;
  logList.add(output);
  println(logList.size());
  String[] logArr =null;
  logArr = logList.toArray(new String[logList.size()]);
  //logString+=output+"\n";
  //output+=input+"\n perro";
  println(output);
  saveStrings("logs.txt", logArr);
}

String logForm(int input) {
  return String.format("%02d", input);
}

ArrayList<String> logList;

void setupLog() {

  logList=new ArrayList<String>();
}

String logString="";

void logFile() {
}
