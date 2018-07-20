// trying to copy: https://twitter.com/beesandbombs/status/1019924265540431872

// Globals
// *************************************************************************************************
int gridWidth = 50;
boolean grid = true;
// *************************************************************************************************


float getLength(float x) {
  //https://www.desmos.com/calculator/mu1snong2u
  return 0.6714*x*x-1.0548*x+sqrt(2);
}

void segment(float length) {
  float p = length/2;
  line(-p, -p, p, p);
}

void drawRotated(float angle, float length) {
  float l = length*(gridWidth/sqrt(2));
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  segment(l);
  popMatrix();
}

void example() {
  float angle = map(mouseX, 0, width, 0, PI/2);
  float l = getLength(angle);
  println(angle);
  drawRotated(angle, l);
}

// *************************************************************************************************
void setup() {
  size(600, 600);
  background(255);
  smooth(8);
  rectMode(CENTER);
  stroke(0);
  strokeWeight(2);
}

void draw() {
  background(255);
  if(grid) { drawGrid(gridWidth); } // toggle with 'g' key

  example();
}
