XML config;
XML pres;
int winX=100;
int winY=100;
boolean fullScr=false;
float winScale=1.0;

int winTol=20;
String presName="adidasFloor.bpf";

XML initState;
XML[] statesArr;
XML[] transArr;

void loadPres() {
  pres = loadXML(presName);

  XML zones=nextLevel(pres, "zones");
  XML zone=nextLevel(zones, "zone");
  XML playlist=nextLevel(zone, "playlist");
  XML rootStates=nextLevel(playlist, "states");//the xml rootStates contains init state, states and transitions


  initState=nextLevel(rootStates, "initialState");//this will be initial page
  initPage=initState.getContent();
  println("-------Init page is:  "+initPage);

  statesArr=rootStates.getChildren("state");//this will be  the pages
  println(statesArr.length);


  transArr=rootStates.getChildren("transition");//buttons and timeouts
  println(transArr.length);

  //xploreTrans();
}

void xploreTrans() {
  for (int i=0; i<transArr.length; i++) {
    XML temp = transArr[i];
    XML source = nextLevel(temp, "sourceMediaState");
    XML target = nextLevel(temp, "targetMediaState");
    XML usrEvent = nextLevel(temp, "userEvent");
    XML transType=nextLevel(usrEvent, "name");
    XML params= nextLevel(usrEvent, "parameters");
  }
}


void instancePages() {

  pages=new ArrayList<Page>();//global creation of Page objects array

  for (int i=0; i<statesArr.length; i++) {
    XML tempState=nextLevel(statesArr[i], "name");
    String tempName=tempState.getContent();
    println("Page and index:  "+tempName+i);
    pages.add(new Page(i, tempName));
  }
  switchPage(initPage);
}

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

void instanceDisplay() {
  display=new Display();//used for tuio
}

XML nextLevel(XML input, String name) {
  XML temp = input.getChild(name);
  if (checkValid(temp)) {
    println("Succesfull access to:  "+name);
    return temp;
  } else {
    println("NOT able to access to:  "+name);
    return null;
  }
  //return temp;
  //return null;
}

boolean checkValid(XML input) {
  if (input!=null) {
    //logln("VALID");
    return true;
  } else {
    //logln("NULL ENCOUNTERED");
    return false;
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
  //println(logList.size());
  String[] logArr =null;
  logArr = logList.toArray(new String[logList.size()]);
  //logString+=output+"\n";
  //output+=input+"\n perro";
  //println(output);
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
