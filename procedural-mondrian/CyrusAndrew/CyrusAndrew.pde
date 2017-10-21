int lastX = 200; 
int lastY = 200; 

void setup() {
 
  
  size (800, 400);
  stroke(255);
  background(192, 64, 0);
  smooth();
  frameRate(2);
  
}
 
void draw() {
  
  int r = int(random(256));
  int g = int(random(256));
  int b = int(random(256));
   
  stroke(0,0,0);
  fill (r, g, b);
  
}
  
void mousePressed(){
  rect(lastX,lastY, random(101), random(101));
lastX = mouseX;
lastY = mouseY;
}
