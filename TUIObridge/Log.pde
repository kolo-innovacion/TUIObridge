import java.io.FileWriter;
import java.io.IOException;

void setupLog0() {
  //String localDir = System.getProperty("user.dir");
  //println(localDir);
  String filePath = "append01.txt";
  String appendText = "This String will be appended to the file.";
  appendUsingFileWriter(filePath, appendText);
  appendUsingFileWriter(filePath, appendText);
  appendUsingFileWriter(filePath, appendText);
}

void appendUsingFileWriter(String filePath, String text) {
  File file = new File(filePath);
  FileWriter fr = null;
  try {
    // Below constructor argument decides whether to append or override
    fr = new FileWriter(file, true);
    //fr.write(text);
    fr.append(text+"\n");
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
