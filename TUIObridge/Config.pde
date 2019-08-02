import processing.video.*;

XML config;
XML pres;
int winX;
int winY;
boolean fullScr=false;

//String presName="adidasFloor.bpf";

XML initState;
XML[] statesArr;
XML[] transArr;
boolean exitFlag=false;
void loadPres() {
  pres = loadXML("presentation.bpf");

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
    println("Page and index:  "+tempName);
    //pages.add(new Page(i, tempName));
    Movie tempMovie = new Movie(this, tempName);
    delay(10);
    //tempMovie.loop();
    pages.add(new Page(i, tempName, tempMovie));
    delay(10);
  }
  switchPage(initPage);
}

void loadConfig() {
  try {
    config = loadXML("config.xml");

    if (config!=null) {

      deLog(inf, cona, "XML config. file loaded");

      fullScr=boolean(config.getInt("fullscreen", 0));
      deLog(inf, cona, "XML config. file loaded");

      scaleX=config.getFloat("scaleX", 1.0);
      scaleY=config.getFloat("scaleY", 1.0);
      viewport_x=config.getInt("viewportX", 0);
      viewport_y=config.getInt("viewportY", 0);
      winX=int(config.getInt("resx", 100));
      winY=int(config.getInt("resy", 100));
      targetIP=config.getString("targetIP", "255.255.255.255");
      targetPort=config.getInt("targetPort", 5000);
    } else {
      deLog(war, cona, "Unable to load -config.xml- file. Program can't run without this. Please check documentation.");
      exitFlag=true;
    }
  }
  catch(Exception e) {

    println("enter exception");
    //exit();
  }
  finally {
  }
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
    //println("Succesfull access to:  "+name);
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
    //deLog("VALID");
    return true;
  } else {
    //deLog("NULL ENCOUNTERED");
    return false;
  }
}
