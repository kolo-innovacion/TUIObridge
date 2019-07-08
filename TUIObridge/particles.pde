ArrayList<Particle> parts;
Movie partMovie;

void partSetup() {
  partMovie=new Movie(this, "particles00.mp4");
  //partMovie=new Movie(this, "light.mov");
  parts=new ArrayList<Particle>();

  //Movie tempMovie = new Movie(this, tempName);
}
class Particle {
  int posX;
  int posY;
  boolean finished;
  Movie visual;
  Particle(int x, int y, Movie input) {
    posX=x;
    posY=y;
    visual=input;
    visual.loop();
    finished=false;
  };
  void show() {
    image(visual, posX, posY, 50, 50);
    //ellipse(posX, posY, 50, 50);
  }
}
