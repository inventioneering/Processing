
int diameter = 10;  // this is the size of the circle at the start of the sketch

// the basics, yo
void setup() {
  size(500,500);
  background(255);  // white background
}


// I wanted to be able to change the color of the circles if a key was pressed
// I'm thinking about some kind of collaborative drawing program/activity that students could
// use or build with.  It would be cool to extend this idea into a mondrian

void draw () {
  // make it red when you press r
  if (keyPressed) {
    if(key == 'r' || key == 'R') {
       fill(255,0,0);
    }
    // make it green when you press g
     if(key == 'g' || key == 'G') {
       fill(0,255,0);
    }
    
    // make it blue when you press b
     if(key == 'b' || key == 'B') {
       fill(0,0,255);
    }
    
    
  } else {
    // if none of the keys are pressed, just make the circles white
   fill(255); 
  }
  
  // this section only runs when someone is pressing down on the mouse button/trackpad.
  if (mousePressed) {
    // I want the circles to grow in size so as long as diameter doesn't get bigger than 300
    // it is allowed to grow by 1 each time a new circle is drawn
    // im not sure of the default frame rate but I'm guessing at least 10 circles are drawn each second
      if(diameter <= 300) {
         // this is what makes diamter bigger, its the same as diameter = diameter + 1;
         diameter++;
      }
      
      // draw the circle locked on the x and y positions of the mouse.
      ellipse(mouseX, mouseY, diameter, diameter);
      
      // this happens when you've let off the mouse/trackpad... it lets the circles get gradually smaller
  } else {
    if(diameter >= 10) {
         diameter--;
      } else {
        diameter = 10;
      }
     
     // draw the circles
      ellipse(mouseX, mouseY, diameter, diameter);
      
 
  }
 
   
   

}