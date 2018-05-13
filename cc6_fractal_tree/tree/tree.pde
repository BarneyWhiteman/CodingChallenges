

void setup() {
  size(1080, 720);
  
}

void draw() {
  background(255);
  new Branch(width/2, height, map(mouseX, 0, width, 0, PI/2), 200, 0, 10);
}
