XML config;
XML pres;
int winX=100;
int winY=100;
boolean fullScr=false;
float winScale=1.0;

int winTol=20;
String presName="adidasFloor.bpf";

void loadPres() {
  pres = loadXML(presName);
  println(pres.hasChildren());
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

void instancePages() {

  pages=new ArrayList<Page>();
  //buttons=new ArrayList<Button>();
  //XML curr=nextLevel(config, "userDefinedEvents");
  XML[] pagesArr = config.getChildren("userDefinedEvents");

  for (int i=0; i<pagesArr.length; i++) {
    //println(pagesArr[i].getString("name"));
    //println(pagesArr[i].getString("img"));
    //pages.add(new Page(i, "yolo", "path"));
    //pages.add(new Page(i, pagesArr[i].getString("name"), pagesArr[i].getString("img")));
    //XML corpus;
    //pages.add(new Page(i, pagesArr[i].getString("name")));
    pages.add(new Page(i, pagesArr[i].getString("name"), pagesArr[i]));
  }

  currentPage=pages.get(currPage);
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
