int n = 200;
drop[] d;

void setup() {
  size(1080, 720);
  stroke(0, 100, 255);
  d = new drop[n];
  for(int i = 0; i < d.length; i ++) {
    d[i] = new drop(random(width), random(-10, 20), random(5));
  }
  
}

void draw() {
  background(150);
  for(int i = 0; i < d.length; i ++) {
    d[i].show();
    d[i].update();
  }
  
}
