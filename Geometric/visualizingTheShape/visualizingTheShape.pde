float sideLength = 80;
float triangleHeight = (sideLength/2 * sqrt(3));

void setup() {
  size(500, 250);
  fill(255);
  stroke(0);
  strokeWeight(2);
  
  
}


void draw() {
  
   float x1 = width/2 - sideLength/2; 
   float x2 = width/2 + sideLength/2;
   float x3 = width/2;
   float y1 = height/2 + sideLength/2; 
   float y2 = y1;
   float y3 = (height/2 + sideLength/2 - triangleHeight);

   noFill();
   ellipseMode(CENTER);
   ellipse(x1, height/2, sideLength, sideLength);
   ellipse(x2, height/2, sideLength, sideLength);

   fill(255);
   rectMode(CENTER);
   rect(width/2, height/2, sideLength, sideLength);
 
   triangle(x1, y1, x2, y2, x3, y3);
 
}
