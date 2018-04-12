class Particle {
 
  PVector pos;
  PVector vel;
  
  float r, mr;
  
  float spd = 0.1;
  float max = 2;
  
  Particle(PVector pos, float r, float mr) {
    this.pos = pos;
    this.r = r;
    this.mr = mr;
    
    vel = new PVector(random(-1, 1), random(-1, 1));
  }
  
  void update(Particle[] p, int i) {
    float h = map(pos.x, 0, width, 0, 255);
    pos.add(vel);
    
    if(pos.x < -10) pos.x = width;
    if(pos.x > width + 10) pos.x = 0;
    if(pos.y < -10) pos.y = height;
    if(pos.y > height + 10) pos.y = 0;
    
    vel.x = constrain(vel.x + random(-spd, spd), -max, max);
    vel.y = constrain(vel.y + random(-spd, spd), -max, max);
    
    for(int j = i + 1; j < p.length; j ++) {
      float ang = atan2(pos.y - p[j].pos.y, pos.x - p[j].pos.x);
      float dist = pos.dist(p[j].pos);
      if(dist < r) {
        stroke(h, 255, map(dist, 0, r, 255, 0));
        strokeWeight(map(dist, 0, r, 3, 0));
        line(pos.x, pos.y, p[j].pos.x, p[j].pos.y);
        
        float force = map(dist, 0, r, 4, 0);
        vel.x += force * cos(ang);
        vel.y += force * sin(ang);
      }
    }
    
    float ang = atan2(pos.y - mouseY, pos.x - mouseX);
    float dist = pos.dist(new PVector(mouseX, mouseY));
    if(dist < r) {
      
      float force = map(dist, 0, r, 30, 0);
      vel.x += force * cos(ang);
      vel.y += force * sin(ang);
    }
    
    noStroke();
    fill(h, 255, 255);
    ellipse(pos.x, pos.y, 5, 5);
  }
  
}
