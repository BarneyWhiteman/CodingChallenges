class Branch {
  
  float x, y, a, len;
  int lvl, max;
  
  Branch(float x, float y, float a, float len, int lvl, int max) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.len = len;
    this.lvl = lvl;
    this.max = max;
    show();
  }
  
  void show() {
    pushMatrix();
    translate(x, y);
    
    strokeWeight(map(lvl, 0, max, 10, 1));
    
    line(0, 0, 0, -len);
    
    if(lvl < max) {
      translate(0, -len);
      rotate(a);
      new Branch(0, 0, a, len * 2/3, lvl + 1, max);
      rotate(-2 * a);
      new Branch(0, 0, a, len * 2/3, lvl + 1, max);
    }   
    popMatrix();
  }
  
}
