Movie particles;

void partSetup() {
  particles=new Movie(this, "particles00.mp4");

  //Movie tempMovie = new Movie(this, tempName);
}
class Particle {
  int posX;
  int posY;
  boolean finished;
  Particle(int x, int y) {
    posX=x;
    posY=y;
    finished=false;
  };
}
