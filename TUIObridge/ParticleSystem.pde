// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

ParticleSystem ps;

PVector gOrigin = new PVector(0, 0);

PVector p0 = new PVector(0.0f, 0.0f);
PVector p1 = new PVector(1.0f, 0.0f);
PVector pv = new PVector(0.0f, 0.0f);


class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle(int px, int py) {
    //particles.add(new Particle(gOrigin));
    particles.add(new Particle(px, py));
  }

  void run() {
    int count=0;
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
        count++;
        //exit();
        //println("X");
      }
    }
    //println("KILLED:  "+count);
  }
}

void setupPS() {
  ps = new ParticleSystem(new PVector(100.0f, 100.0f));
}

void spawn(int x, int y) {
  for (int i=0; i<100; i++) {
    ps.addParticle(x, y);
  }
}
