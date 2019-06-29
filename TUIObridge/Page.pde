class Page {

  int index;
  String name;
  PImage img;
  ArrayList<Button> pButtons;

  Page(int ind, String nam, XML input) {

    pButtons=new ArrayList<Button>();
    index=ind;
    name=nam;
    //imgPath=name+".png";
    //img=loadImage(imgPath);
    img=loadPageImage(name);
    pageDict.set(name, index);
    logln("Page "+name+" has been created.");
    instButtons(input);
    logln("End of buttons creation on  "+name);
  }


  Page(int ind, String nam) {

    pButtons=new ArrayList<Button>();

    index=ind;
    name=nam;
    img=loadMedia(name);

    //pageDict.set(name, index);

    logln("Page "+name+" has been created.");
  }

  PImage loadMedia(String input) {
    PImage temp = loadImage(input);
    if (temp!=null) {
      println(input+"  loaded successfully");
      return temp;
    } else {

      println(input+"  NOT loaded");
      return null;
    }
  }

  void instButtons(XML input) {    
    //println("NEW"+input);
    //println("ORIGINAL: "+curr);
    XML[] buttonArr = input.getChildren("userDefinedEvent");
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
      //end of extraction from XML
      pButtons.add(new Button(tempID, tempX.getIntContent(), tempY.getIntContent(), tempW.getIntContent(), tempH.getIntContent()));
    }
  }
  void showButtons() {  
    for (int i=0; i<pButtons.size(); i++) {
      pButtons.get(i).show();
    }
  }

  PImage loadPageImage(String input) {
    //String pathPNG=input+".png";
    //String pathJPG=input+".jpg";
    //String pathJPEG=input+".jpeg";

    PImage tempImg;

    //first attempt
    tempImg=loadImage(input);

    if (tempImg!=null) {
      println("Unable to load"+input);
      return tempImg;
    } else {
      println("Image Loaded"+input);
      return tempImg;
    }
  }
}
