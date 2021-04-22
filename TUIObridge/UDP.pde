import hypermedia.net.*;
UDP udp;

String udpTargetIP="localhost";
int udpTargetPort=6100;
int inPort=5000;
boolean udpLineFeed=false;

void setupUDP() {
  udp = new UDP( this, inPort );
  //udp.log( true );     // <-- printout the connection activity
  udp.listen( true );

  //deLog("Target: "+udpTargetIP+"  Port: "+udpTargetPort);
  deLog(inf, udpa, "UDP client started with target  "+udpTargetIP+":"+udpTargetPort);
}

void sendUDP(String input) {
  String message  = input;

  if (udpLineFeed) {
    message  = message+"\n";
  } else {
  }
  udp.send( message, udpTargetIP, udpTargetPort );
}

void receive( byte[] data, String ip, int port ) {  // <-- extended handler


  // get the "real" message =
  // forget the ";\n" at the end <-- !!! only for a communication with Pd !!!
  //data = subset(data, 0, data.length-2);
  String message = new String( data );

  // print the result
  //println( "receive: \""+message+"\" from "+ip+" on port "+port );
  deLog(inf, udpa, message);
  switchPage(message);
}
