import processing.video.*;

XML config;
XML pres;
int winX;
int winY;
boolean fullScr=false;
float fps;

int viewport_x;
int viewport_y;

int partsPerCursor;
int partSize;
//String presName="adidasFloor.bpf";

XML initState;
XML[] statesArr;
XML[] transArr;
boolean exitFlag=false;

void winSetup() {
  surface.setLocation(viewport_x, viewport_y);
  surface.setResizable(false);
  surface.setTitle("TUIO Bridge 0.1.0");

  deLog(inf, cona, "Window fixed to viewport on  X: "+viewport_x+"  and  Y: "+viewport_y);
}

boolean loadPres() {
  if (exitFlag) {
    return true;
    //do nothing
  } else {
    pres = loadXML("presentation.bpf");

    if (pres==null) {
      deLog(err, cona, "Unable to load -presentation.bpf- file. Program can't run without this. Please check documentation.");
      return true;
    } else {

      deLog(inf, cona, "presentation.bpf file loaded.");

      XML zones=nextLevel(pres, "zones");
      XML zone=nextLevel(zones, "zone");
      XML playlist=nextLevel(zone, "playlist");
      XML rootStates=nextLevel(playlist, "states");//the xml rootStates contains init state, states and transitions


      initState=nextLevel(rootStates, "initialState");//this will be initial page
      initPage=initState.getContent();

      deLog(deb, cona, "Initial page is "+initPage);


      statesArr=rootStates.getChildren("state");//this will be  the pages
      ////println(statesArr.length);

      transArr=rootStates.getChildren("transition");//buttons and timeouts
      ////println(transArr.length);
      return false;
    }
  }
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
  if (exitFlag) {
  } else {


    pages=new ArrayList<Page>();//global creation of Page objects array

    for (int i=0; i<statesArr.length; i++) {
      XML tempState=nextLevel(statesArr[i], "name");
      String tempName=tempState.getContent();
      ////println("Page and index:  "+tempName);
      //pages.add(new Page(i, tempName));
      Movie tempMovie = new Movie(this, tempName);
      delay(100);
      //tempMovie.loop();
      pages.add(new Page(i, tempName, tempMovie));
      delay(10);
    }
    switchPage(initPage);
  }
}

boolean loadConfig() {

  config = loadXML("config.xml");

  if (config!=null) {

    deLog(inf, cona, "config.xml file loaded.");

    fullScr=boolean(config.getInt("fullscreen", 0));
    deLog(inf, cona, "Fullscreen value: "+fullScr);

    fps=config.getFloat("fps", 30.0);
    //deLog(inf, cona, "FPS: "+fps);

    winX=int(config.getInt("resx", 100));
    deLog(inf, cona, "Window X size: "+winX);

    winY=int(config.getInt("resy", 100));
    deLog(inf, cona, "Window Y size: "+winY);

    scaleX=config.getFloat("scaleX", 1.0);
    deLog(inf, cona, "X scale value: "+scaleX);

    scaleY=config.getFloat("scaleY", 1.0);
    deLog(inf, cona, "Y scale value: "+scaleY);

    viewport_x=config.getInt("viewportX", 0);
    deLog(inf, cona, "Window X offset: "+viewport_x);

    viewport_y=config.getInt("viewportY", 0);
    deLog(inf, cona, "Window Y offset: " +viewport_y);

    partsPerCursor=config.getInt("partsPerCursor", 50);
    deLog(inf, cona, "Particles per cursor:  " +partsPerCursor);

    partSize=config.getInt("partSize", 10);
    deLog(inf, cona, "Particle size:  " +partSize);

    udpTargetIP=config.getString("targetIP", "255.255.255.255");
    deLog(inf, cona, "UDP target IP address: "+udpTargetIP);

    udpTargetPort=config.getInt("targetPort", 5000);
    deLog(inf, cona, "UDP target port: "+udpTargetPort);
    return false;
  } else {
    deLog(err, cona, "Unable to load -config.xml- file. Program can't run without this. Please check documentation.");
    return true;
  }//end else
}

int extInt(XML obj, String name) {
  return obj.getInt(name, 0);
}

String extString(XML obj, String name) {
  return obj.getString(name, "null");
}


XML nextLevel(XML input, String name) {
  XML temp = input.getChild(name);
  if (checkValid(temp)) {
    ////println("Succesfull access to:  "+name);
    return temp;
  } else {
    //println("NOT able to access to:  "+name);
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
