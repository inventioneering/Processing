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
