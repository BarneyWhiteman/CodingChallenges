ArrayList<PVector> points = new ArrayList<PVector>();

float in, out;
float estimation;

void setup() {
  size(720, 720);
  noFill();
  in = 0;
  out = 0;
  
  background(255);  
  ellipse(width/2, height/2, width, height);
  strokeWeight(2);
  newRandomPoint(10);
}

void draw() {
}

void keyPressed() {
  if(key == ' ') {
    newRandomPoint(10);
  }
}

void newRandomPoint(int n) {
  for(int i = 0; i < n; i ++) {
    PVector p = new PVector(random(width), random(height));
    points.add(p);
    if(inCircle(p)) {
      in += 1;
      stroke(0, 255, 0);
    } else {
      out += 1;
      stroke(255, 0, 0);
    }
    point(p.x, p.y);
  }
  estimation = (in/(out + in)) * 4;
  println(estimation);
}

boolean inCircle(PVector p) {
  return dist(width/2, height/2, p.x, p.y) <= width/2;
}
