ArrayList<Particle> p = new ArrayList<Particle>();

void setup() {
  size(1080, 720);
  colorMode(HSB);
  noStroke();
  burst(100);
}

void draw() {
  background(0);
  for(int i = p.size() - 1; i >= 0; i --) {
    p.get(i).update();
    if(p.get(i).dead) {
      p.remove(i);
      continue;
    }
    p.get(i).show();
  }
}

void keyPressed() {
  if(key == ' ') {
    burst(100);
  }
}

void burst(int num) {
  int c = int(random(255));
  for(int i = 0; i < num; i ++) {
    float a = int(random(8)) * PI/4;
    p.add(new Particle(width/2, height/2, a, c));
  }
}
