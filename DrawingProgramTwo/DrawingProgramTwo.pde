void setup() {
  size(850,1100);
  background(255);
}


void draw() {
  
}

void mouseClicked() {
 background(255); 
}

void mouseDragged() {
 if(mouseButton == LEFT) {
   strokeWeight(50);
   stroke(random(255),random(255),random(255));
   line(pmouseX,pmouseY,mouseX,mouseY);
 }
}

void mousePressed() {
 if(mouseButton == RIGHT) {
  background(255); 
 }
}