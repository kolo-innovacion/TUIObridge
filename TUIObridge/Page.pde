class Page {

  int index;
  String name;
  String imgPath;
  PImage img;
  ArrayList<Button> pButtons;

  Page(int ind, String nam, XML input) {

    pButtons=new ArrayList<Button>();
    index=ind;
    name=nam;
    imgPath=name+".png";
    img=loadImage(imgPath);
    pageDict.set(name, index);
    logln("Page "+name+" has been created.");
    instButtons(input);
    logln("End of buttons creation on  "+name);
  }
  void instButtons(XML input) {    
    //println("NEW"+input);
    //println("ORIGINAL: "+curr);
    XML[] buttonArr = input.getChildren("userDefinedEvent");
    //logln(buttonArr);
    for (int i=0; i<buttonArr.length; i++) {
      XML temp = buttonArr[i];

      String tempID=temp.getString("name");
      String tempCall=temp.getString("callPage");

      temp=nextLevel(temp, "userEvents");
      temp=nextLevel(temp, "userEvent");
      temp=nextLevel(temp, "parameters");
      XML tempX=nextLevel(temp, "x");
      XML tempY=nextLevel(temp, "y");
      XML tempW=nextLevel(temp, "width");
      XML tempH=nextLevel(temp, "height");
      //end of extraction from XML
      if (tempCall==null) {//button with no callpage
        //   println("No callpage for button  "+tempID);

        pButtons.add(new Button(tempID, tempX.getIntContent(), tempY.getIntContent(), tempW.getIntContent(), tempH.getIntContent()));
      } else {//button WITH callpage
        //println("Button   "+tempID+"  calls page  "+tempCall);

        pButtons.add(new Button(tempID, tempX.getIntContent(), tempY.getIntContent(), tempW.getIntContent(), tempH.getIntContent(), tempCall));
      }
    }
  }
  void showButtons() {  
    for (int i=0; i<pButtons.size(); i++) {
      pButtons.get(i).show();
    }
  }
}
