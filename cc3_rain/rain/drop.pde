class drop {
  
  float x, y, z;
  
  drop(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void update() {
    float spd = map(z, 0, 5, 10, 4);
    y = y + spd;
    if(y > height + 10) {
      y = - 10;
      x = random(width);
    }
  }
  
  void show() {
    float t = map(z, 0, 5, 10, 2);
  
    strokeWeight(t);
    line(x, y, x, y + t * 2);
  }
  
}
