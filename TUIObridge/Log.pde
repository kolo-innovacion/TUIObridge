import java.io.FileWriter;
import java.io.IOException;

int DEBUG=1;
String filePath = "log.txt";
void setupLog() {
  deLog("PROGRAM START");
}

void deLog(String text) {
  File file = new File(filePath);
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
