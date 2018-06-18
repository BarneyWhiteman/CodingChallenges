int tileSize = 16;
float scl = 0.07;

float xRO, yRO, xTO, yTO, x, y;
float speed = 5;
int buffer = 10;

int w, h;

int[] tiles;

PImage[] sprites = new PImage[4];

void setup() {
  sprites[0] = loadImage("water.png");
  sprites[1] = loadImage("sand.png");
  sprites[2] = loadImage("grass.png");
  sprites[3] = loadImage("forest.png");  
  size(1080, 720);
  w = width/tileSize + buffer;
  h = height/tileSize + buffer;
  tiles = new int[(w) * (h)];
  
  noStroke();
  colorMode(HSB);
  drawTerrain();
  
}

void draw() {
  clear();
  drawTerrain();
}

void keyPressed() {
  if(key == ' ') {
    noiseSeed(millis());
    drawTerrain();
  }
  if(key == 'w') y -= speed;
  if(key == 's') y += speed;
  if(key == 'a') x -= speed;
  if(key == 'd') x += speed;
}

void drawTerrain() {
  xRO = x % tileSize;
  yRO = y % tileSize;
  xTO = (int)x/tileSize;
  yTO = (int)y/tileSize;
  for(int i = 0; i < w; i ++) {
    for(int j = 0; j < h; j ++) {
      tiles[i + j * w] = getTile(i, j);
    }
  }
  for(int i = 0; i < w; i ++) {
    for(int j = 0; j < h; j ++) {
      image(sprites[tiles[i + j * w]], (i - buffer/2) * tileSize - xRO, (j - buffer/2) * tileSize - yRO, tileSize, tileSize);
    }
  }
}

int getTile(int x, int y) {
  float v = noise((xTO + x) * scl, (yTO + y) * scl);
  if(v < 0.35) {
    //water
    return 0;
  } else if(v < 0.5) {
    //sand
    return 1;
  } else if(v < 0.7) {
    //grass
    return 2;
  } else {
    //forest
    return 3;
  }
}
