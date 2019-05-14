XML xml;

void configSetup() {
  xml = loadXML("config.xml");
  XML display = xml.getChild("display");
  //display.getContent();
  //firstChild.getChild("button");
  //println(firstChild.getString("species"));
}
