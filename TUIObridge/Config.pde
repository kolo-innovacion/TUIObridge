XML xml;

void configSetup() {
  xml = loadXML("mammals.xml");
  XML firstChild = xml.getChild("animal");
  println(firstChild.getString("species"));
}
