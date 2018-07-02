ArrayList<PVector> mountain1 = new ArrayList<PVector>();
ArrayList<PVector> mountain2 = new ArrayList<PVector>();
ArrayList<PVector> mountain3 = new ArrayList<PVector>();

float m1y;
float m2y;
float m3y;

float m1s = 100;
float m2s = 50;
float m3s = 25;

void setup() {
  size(1080, 720);
  m1y = height/2;
  m2y = height/4;
  m3y = height/6;
  generate(mountain1, m1y, m1s);
  generate(mountain2, m2y, m2s);
  generate(mountain3, m3y, m3s);
  noStroke();
}


void draw() {
  background(100, 200, 255);
  move(mountain1, 4, m1y, m1s);
  move(mountain2, 2, m2y, m2s);
  move(mountain3, 1, m3y, m3s);
  
  fill(0, 100, 50);
  show(mountain3);
  fill(0, 125, 25);
  show(mountain2);
  fill(0, 155, 0);
  show(mountain1);
  
}

void move(ArrayList<PVector> mountain, float speed, float y, float size) {
  for(int i = 0; i < mountain.size(); i ++) {
    mountain.get(i).x -= speed;
  }
  if(mountain.get(1).x < 0) {
    mountain.remove(0);
  }
  while(mountain.get(mountain.size() - 1).x < width + 2 * size) {
    mountain.add(new PVector(mountain.get(mountain.size() - 1).x + size + random(-size/2, size/2), y + random(-size, size)));
  }
}

void generate(ArrayList<PVector> mountain, float y, float size) {
  mountain.add(new PVector(0, y + random(-size, size)));
  while(mountain.get(mountain.size() - 1).x < width) {
    mountain.add(new PVector(mountain.get(mountain.size() - 1).x + size + random(-size/2, size/2), y + random(-size, size)));
  }
}

void show(ArrayList<PVector> mountain) {
  beginShape();
  vertex(width, height);
  vertex(0, height);
  for(int i = 0; i < mountain.size(); i ++) {
    vertex(mountain.get(i).x, mountain.get(i).y);
  }
  endShape(CLOSE);
}
