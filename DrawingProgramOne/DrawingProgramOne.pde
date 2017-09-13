void setup() {
  size(850,1100);
  background(255);
}


void draw() {
  
}

void mouseClicked() {
 background(0); 
}

void mouseDragged() {
 strokeWeight(50);
 stroke(random(255),random(255),random(255));
 line(pmouseX,pmouseY,mouseX,mouseY);
}