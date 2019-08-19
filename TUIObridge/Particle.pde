// A simple Particle class

class Particle {
  PVector position=new PVector();
  PVector velocity;
  PVector acceleration;
  float lifespan;
  int radius;
  float alfa;

  Particle(int x, int y) {
    //acceleration = new PVector(0, 0.05);

    //acceleration = new PVector(-0.250f, random(-0.50f, 0.450f));

    acceleration = new PVector(random(-0.60f, 0.20f), random(-0.50f, 0.450f));
    velocity = new PVector(random(-1.0f, 1.0f), random(-2.0f, 1.0f));
    //velocity = new PVector(0.10f, 0.10f);
    position.x=x;
    position.y=y;
    lifespan = 125.0;
    lifespan = random(5.0f, 125.0f);
    radius=int(random(3.0, 9.0));
    alfa=random(0.50f, 1.0f);
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 5.0;
  }

  // Method to display
  void display() {
    noStroke();
    //stroke(255, lifespan);
    fill(255, 255, 255, lifespan*alfa);
    //fill(255, 0, 0, 255);
    //ellipse(position.x, position.y, 8, 8);
    ellipse(position.x, position.y, radius, radius);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
