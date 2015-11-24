int diameter = 10;

void setup() {
  size(500,500);
  background(255);
}


void draw () {
  if (keyPressed) {
    if(key == 'r' || key == 'R') {
       fill(255,0,0);
    }
    
     if(key == 'g' || key == 'G') {
       fill(0,255,0);
    }
    
    
     if(key == 'b' || key == 'B') {
       fill(0,0,255);
    }
    
    
  } else {
   fill(255); 
  }
  
  if (mousePressed) {
      if(diameter <= 300) {
         diameter++;
      } else {
        diameter = 0;
      }
      ellipse(mouseX, mouseY, diameter, diameter);
      
  } else {
    if(diameter >= 10) {
         diameter--;
      } else {
        diameter = 10;
      }
     
      ellipse(mouseX, mouseY, diameter, diameter);
      
 
  }
 
   
   

}