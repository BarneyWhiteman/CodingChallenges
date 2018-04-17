
ArrayList<strike> s = new ArrayList<strike>();

void setup() {
  size(1080, 720);
}

void draw() {
  background(150);
  for(int i = s.size() - 1; i >= 0; i --) {
    s.get(i).update(20);
    s.get(i).show();
    if(s.get(i).dead) s.remove(i);
  }
  if(s.size() < 5) {
  s.add(new strike(new PVector(random(width), 50), 100, 0, 5));
  }
}

void mouseReleased() {
  s.add(new strike(new PVector(mouseX, mouseY), 100, 0, 5));
}
