class Page {

  int index;
  String name;
  String imgPath;
  PImage img;
  ArrayList<Button> pButtons;

  Page(int ind, String n, String imgp) {

    index=ind;
    name=n;
    imgPath=imgp;
  }
  Page(int ind, String n) {

    index=ind;
    name=n;
    imgPath=name+".png";
    img=loadImage(imgPath);
  }  
  Page(int ind, String nam, XML input) {

    pButtons=new ArrayList<Button>();
    index=ind;
    name=nam;
    imgPath=name+".png";
    img=loadImage(imgPath);

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

      temp=nextLevel(temp, "userEvents");
      temp=nextLevel(temp, "userEvent");
      temp=nextLevel(temp, "parameters");
      XML tempX=nextLevel(temp, "x");
      XML tempY=nextLevel(temp, "y");
      XML tempW=nextLevel(temp, "width");
      XML tempH=nextLevel(temp, "height");

      pButtons.add(new Button(tempID, tempX.getIntContent(), tempY.getIntContent(), tempW.getIntContent(), tempH.getIntContent()));
    }
  }
  void showButtons() {  
    for (int i=0; i<pButtons.size(); i++) {
      pButtons.get(i).show();
    }
  }
}