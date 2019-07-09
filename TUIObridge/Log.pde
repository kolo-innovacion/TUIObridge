ArrayList<String> logList;
String logString="";

void setupLog() {

  logList=new ArrayList<String>();
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
