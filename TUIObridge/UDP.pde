import hypermedia.net.*;
UDP udp;

String targetIP="localhost";
int targetPort=6100;
int inPort=6000;

void setupUDP() {
  udp = new UDP( this, inPort );
  //udp.log( true );     // <-- printout the connection activity
  udp.listen( true );

  logln("Target: "+targetIP+"  Port: "+targetPort);
}

void sendUDP(String input) {
  String message  = input;
  //message = message+"\n";
  udp.send( message, targetIP, targetPort );
}

void receive( byte[] data, String ip, int port ) {  // <-- extended handler


  // get the "real" message =
  // forget the ";\n" at the end <-- !!! only for a communication with Pd !!!
  //data = subset(data, 0, data.length-2);
  String message = new String( data );

  // print the result
  println( "receive: \""+message+"\" from "+ip+" on port "+port );
  switchPage(message);
}
