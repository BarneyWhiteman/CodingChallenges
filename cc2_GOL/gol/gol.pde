
int cells[];
int scale = 20;
int size;

boolean paused = false;
boolean delete = false;

float chance = 0.5;

int fr = 10;

void setup() {  
  size(720, 720);
  size = width/scale;
  
  cells = new int[size * size];
  
  for(int i = 0; i < cells.length; i ++) {
    if(random(1) < chance) {
      cells[i] = 1;
    } else {
      cells[i] = 0;
    }
  }  
}

void draw() {
  background(255);
  drawCells();
  drawGrid();
  
  if(frameCount % fr == 0 && !paused) {
    nextCells();
  }
}

int numN(int i, int j) {
  int num = 0;
  
  for(int x = -1; x <= 1; x ++) {
    for(int y = -1; y <= 1; y ++) {
      if(x == 0 && y == 0) continue;
      int ni = i + x;
      int nj = j + y;
      num += cells[pos(ni, nj)];
    }
  }
  return num;
}

void nextCells() {
  int[] next = cells.clone();
  for(int i = 0; i < size; i ++) {
    for(int j = 0; j < size; j ++) {
      int n = numN(i, j);
      if(cells[pos(i, j)] == 1) {
        if(n < 2 || n > 3) {
          next[pos(i, j)] = 0;
        }
      } else {
        if(n == 3) {
          next[pos(i, j)] = 1;
        }
      }
    }
  }
  cells = next.clone();
}

void drawGrid() {
  stroke(150);
  for(int i = 0; i < size; i ++) {
    line(i * scale, 0, i * scale, height);
    line(0, i * scale, width, i * scale);
  }
  noFill();
  stroke(255, 0, 0);
  int x = mouseX/scale;
  int y = mouseY/scale;
  rect(x * scale, y * scale, scale, scale);
}

void drawCells() {
  noStroke();
  fill(0);
  for(int i = 0; i < size; i ++) {
    for(int j = 0; j < size; j ++) {
      if(cells[pos(i, j)] == 1) {
        rect(i * scale, j * scale, scale, scale);
      }
    }
  }
}

void zero() {
  for(int i = 0; i < cells.length; i ++) {
    cells[i] = 0;
  }  
}

int pos(int i, int j) {
  i = constrain(i, 0, size - 1);
  j = constrain(j, 0, size - 1);
  
  return i + j * size;
}

void setCell(int i, int j, int v) {
  cells[pos(i, j)] = v;
}

void mouseDragged() {
  if(delete) {
    setCell(mouseX/scale, mouseY/scale, 0);
  } else {
    setCell(mouseX/scale, mouseY/scale, 1);
  }
}

void keyPressed() {
  if(key == 'w') {
    fr = constrain(fr - 1, 1, 20);
  }
  if(key == 's') {
    fr = constrain(fr + 1, 1, 20);
  }
  if(key == ' ') {
    paused = !paused;
  }
  if(key == 'd') {
    delete = !delete;
  }
  if(key == 'c') {
    zero();
  }
}
