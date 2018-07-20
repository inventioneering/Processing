// https://twitter.com/beesandbombs/status/1019924265540431872

void box() {
 pushMatrix();
 translate(width/2, height/2);
 rect(0,0,50,50); 
 popMatrix();
}

void segment() {
 line(-25,-25,25,25);
}

void drawRotated(float amount) {
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(amount));
  segment();
  popMatrix();
}

void setup() {
  size(600,600);
  background(255);
  rectMode(CENTER);
  stroke(0);
  strokeWeight(2);
  smooth(8);
  //noLoop();
}

void draw() {
  background(255);
  box();
  
 float amount = map(mouseX, 0, width, 0, 90);
     drawRotated(amount);
}
  //for(int i = 0; i < width; i+=50) {
  //  for(int j = 0; j < height; j+=50) {
  //    if(j%2 !=0) {
  //      shape(segment, i, j);
  //    } else {
  //      pushMatrix();
  //      translate(i,j);
  //      rotate(radians(90));
  //      shape(segment, i, j);
  //      popMatrix();
  //    }
      
  //  } 
  //}





void rotate() {
 
  smooth();

  pushMatrix();
  // move the origin to the pivot point
  translate(40, 40); 
  
  // then pivot the grid
  rotate(radians(45));
  
  // and draw the square at the origin
  fill(0);
  rect(0, 0, 40, 40);
  popMatrix(); 
}
