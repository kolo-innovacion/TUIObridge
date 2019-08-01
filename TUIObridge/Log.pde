import java.io.FileWriter;
import java.io.IOException;

boolean logDebug=true;

String de="DEBUG";
String in="INFORMATION";
String wa="WARNING";
String er="ERROR";
String tr="TRACE";

String buta="BUTTON";
String cona="CONFIG";
String dica="DICTIONARY";
String disa="DISPLAY";
String loga="LOGGER";
String paga="PAGE";
String para="PARTICLES";
String tuia="TUIO";
String udpa="UDP";
String tima="TIMER";

int DEBUG=1;

void setupLog() {
  deLog("PROGRAM START");
}

void deLog(String level, String agent, String text) {

  if ((agent.equals("DEBUG"))&&(logDebug==false)) {
    //do not log (only case)
  } else {

    File file = new File("log.txt");
    FileWriter fr = null;
    try {
      fr = new FileWriter(file, true);
      fr.append(timestamp()+level+"\t"+agent+"\t"+text+"\n");
    } 
    catch (IOException e) {
      e.printStackTrace();
    } 
    finally {
      try {
        fr.close();
      } 
      catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
}

void deLog(String text) {
  File file = new File("log.txt");
  FileWriter fr = null;
  try {
    // Below constructor argument decides whether to append or override
    fr = new FileWriter(file, true);
    //fr.write(text);
    fr.append(timestamp()+getLevel(DEBUG)+"LOGGER\t"+text+"\n");
  } 
  catch (IOException e) {
    e.printStackTrace();
  } 
  finally {
    try {
      fr.close();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
  }
}

String timestamp() {
  String output = "";
  output+=year()+"-";
  output+=logForm(month())+"-";
  output+=logForm(day())+"T";
  output+=logForm(hour())+":";
  output+=logForm(minute())+":";
  output+=logForm(second())+".";
  output+=String.format("%03d", (millis()%1000));
  return output+"\t";
}
String getLevel(int input) {

  String output;
  switch (input) {
  case 1: 
    output="DEBUG"; 
    break;
  case 2: 

    output="INFO"; 
    break;
  case 3: 

    output="WARN"; 
    break;
  case 4: 

    output="ERROR"; 
    break;
  default: 

    output="TRACE"; 
    break;
  }
  return output+"\t";
}

String logForm(int input) {
  return String.format("%02d", input);
}
