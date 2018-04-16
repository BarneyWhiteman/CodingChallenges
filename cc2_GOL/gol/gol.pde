int[] cells;
int scale = 20;
int size;

float chance = 0.5;

int fr = 10;

boolean paused = false;
boolean delete = false;

void setup() {  
  size(720, 720);
  size = width/scale;
  cells = new int[size * size];
  
  noStroke();
  
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

void setCell(int i, int j, int v) {
  cells[pos(i, j)] = v;
}

void drawGrid() {
  stroke(150);
  for(int i = 0; i < size; i ++) {
    line(i * scale, 0, i * scale, height);
    line(0, i * scale, width, i * scale);
  }
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

int numN(int x, int y) {
  int num = 0;
  
  for(int i = -1; i <= 1; i ++) {
    for(int j = -1; j <= 1; j ++) {
      if(i == 0 && j == 0) continue;
      int ni = x + i;
      int nj = y + j;
      
      if(ni >= 0 && ni < size) {
        num += cells[pos(ni, nj)];
      }
    }
  }
  
  return num;
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

void mouseDragged() {
  int i = mouseX/scale;
  int j = mouseY/scale;
  if(delete) {
    setCell(i, j, 0);
  } else {
    setCell(i, j, 1);
  }
}

void keyPressed() {
  if(key == 'w') {
    fr = constrain(fr - 1, 1, 20);
  }
  if(key == 's') {
    fr = constrain(fr + 1, 1, 20);
  }
  if(key == 'd') {
    delete = !delete;
  }
  if(key == ' ') {
    paused = !paused;
  }
  if(key == 'c') {
    zero();
  }
}
