import hypermedia.net.*;
UDP udp;

String targetIP="localhost";
int targetPort=6100;

void setupUDP() {
  udp = new UDP( this, 6077 );
  //udp.log( true );     // <-- printout the connection activity
  udp.listen( true );

  logln("Target: "+targetIP+"  Port: "+targetPort);
}

void sendUDP(String input) {
  String message  = input;
  message = message+"\n";
  udp.send( message, targetIP, targetPort );
}
