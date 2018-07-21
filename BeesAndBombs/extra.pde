float getLength(float angle) { // in radians
  //https://www.desmos.com/calculator/mu1snong2u
  return 0.6714*angle*angle-1.0548*angle+sqrt(2);
}

void segment(float length) {
  float p = length/2;
  line(-p, -p, p, p);
}

void drawRotated(float angle, float length) {
  float l = length*($gridWidth/sqrt(2));
  pushMatrix();
  translate(height/2, width/2);
  rotate(angle);
  segment(l);
  popMatrix();
}

void example() {
  float angle = map(mouseX, 0, width, 0, PI/2);
  if(debug) { println("Angle: " + angle); }
  drawRotated(angle, getLength(angle));
}




void drawGrid(int size) {
 
  pushStyle();
  strokeWeight(1);
  int rows, cols;
  cols = width/size;
  rows = height/size;
  
  for (int i = 0; i < cols+1; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows+1; j++) {

      // Scaling up to draw a rectangle at (x,y)
      int x = i*size;
      int y = j*size;
      fill(255);
      stroke(0);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      rect(x, y, size, size);
    }
  }
  popStyle();
}


void box() {
 pushMatrix();
 pushStyle();
 strokeWeight(2);
 translate(width/2, height/2);
 rect(0,0,50,50); 
 popStyle();
 popMatrix();
}
