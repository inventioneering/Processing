PImage a;


void setup() {
  size(600,600);
  background(255);
  smooth();
  noStroke();
  a = loadImage("bow.png");
  frameRate(20);
  imageMode(CENTER);
  image(a,width/2,height/2);
  
}

int x = 0;
void draw() {
  background(255);
  image(a,width/2,height/2);
  // move the origin to the pivot point
  if(x > 360) { x = 0; }
  x += 2;
  pushMatrix();
  translate(width/2, height/2); 
  
  // map atan2 values to -PI/2 to PI/2
  float map = map(atan2(mouseY,mouseX),0,PI/2,-PI/2,PI/2);
  
  // then pivot the grid
  rotate(map);
  
  // and draw the square at the origin
  
  image(a,0,0);
  popMatrix();
}


 
