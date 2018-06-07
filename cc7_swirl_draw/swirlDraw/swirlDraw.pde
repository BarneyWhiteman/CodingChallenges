float px;
float py;

int count = 16;

float offset;

void setup() {
  size(1000, 1000);
  background(0);
  stroke(50);
  offset  = (2 * PI)/count;
  for(int i = 0; i < count; i ++) {
    line(width/2, height/2, width/2 + cos(i * offset) * width,height/2 + sin(i * offset) * height);
  }
  colorMode(HSB);
  strokeWeight(3);
}

void draw() {}

void mousePressed() {
  px = mouseX;
  py = mouseY;
}

void mouseDragged() {
  
  
  float ang = atan2(mouseY - height/2, mouseX - width/2);
  float dist = sqrt(sq(mouseY - height/2) + sq(mouseX - width/2));
  
  float pang = atan2(py - height/2, px - width/2);
  float pdist = sqrt(sq(py - height/2) + sq(px - width/2));
  
  stroke(map(dist, 0, sqrt(sq(width/2) * 2), 0, 255), 255, 255);
  
  for(int i = 0; i < count; i ++) {
    float x1 = cos(ang + i * offset) * dist + width/2;
    float x2 = cos(pang + i * offset) * pdist + width/2;
    float y1 = sin(ang + i * offset) * dist + height/2;
    float y2 = sin(pang + i * offset) * pdist + height/2;
    
    line(x1, y1, x2, y2);
  }
  
  px = mouseX;
  py = mouseY;
  
}
