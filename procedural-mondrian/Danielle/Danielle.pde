//This is my attempt at recreating one of 
//mondian's paintings with code


//set up the canvas
void setup() {
 
size(1131, 707);
background(50);  
noStroke();

}
//lines between rects are 9
void draw() {
  left();
  
  redblue();
  
  fill(255,0, 0);          //red rects
  rect(108, 84, 265, 265); //big red
  
  fill(255, 226, 0);        //yellow rect
  rect(382, 15, 177, 60);   //to the right of the left corner
  rect(245, 565, 58, 128);  //rect next to the white on the left of the bottom red
  rect(758, 15, 60, 60);     //small rect on top right side 
 
  fill(0);
  rect(826, 15, 60, 60);  //small black rect on top right side
  rect(666, 632, 84, 60); //samll black rect on bottom right side 
 
  fill(255);                //white rects
  rect(314, 565, 58, 128);  //rect to the left of the bottom red
  rect(573, 632, 84, 60);   //little rect on the bottom right side
  
  //drawing the blue rectangle by translating the red one
  fill(0, 172, 255);
  pushMatrix();
  translate(650, 274);
  rect(108, 84, 265, 265);      
  popMatrix();
  
  //drawing the yellow medium rect on top right side 
  fill(255, 226, 0); 
  pushMatrix();
  translate(1131, 707);
  rotate(radians(180));
  rect(244, 564, 128, 58);
  popMatrix();
  
  //drawing the right side of the screen by translating the left()
  pushMatrix();
  translate(1131, 707);
  rotate(radians(180));
  left();
  popMatrix();
  
  //drawing the top red and blue rects by translating redblue()
  pushMatrix();
  translate(190, -412);
  redblue();
  popMatrix();
}

void left() {
  
  fill(255);              //white rects
  
  //rects in top left corner
  rect(15, 15, 129, 60);  //white rect in top left corner
  rect(152, 15, 221, 60); //white rect right of top left corner
  
  //2 white rect just under the top left corner one
  rect(15, 84, 83, 128);  //top one
  rect(15, 221, 83, 196); //bottom one
  
  //three white rects under two yellows in the top center/left 
  rect(382, 221, 84, 128);    //first two congruent ones
  rect(475, 221, 84, 128); 
  rect(382, 358, 177, 60);    //one under the other two
  
  //two more white rects under big red one
  rect(244, 358, 128, 60);  //top one
  rect(244, 427, 128, 60);  //bottom one
  
  //two white rects in bottom left corner
  rect(15, 632, 221, 60);      //bottom left rect
  rect(108, 496, 128, 126);    //white square in bottom left corner
  
  fill(0);                  //black rects
  
  //square under big red
  rect(107, 358, 128, 129);    
  //rect under two white under big red
  rect(244, 496, 128, 60); 
  
  fill(255, 226, 0);              //yellow rects
  
  //yellow rect in the top center/left
  rect(382, 84, 177, 128);        //biger one
  
  //yellow rect on the left side
  rect(15, 426, 84, 196); 

}

void redblue() {
 
  fill(255,0, 0);         //red rect
  //littler red on bottom
  rect(382, 564, 177, 128);
  fill(0, 172, 255);
  rect(382, 427, 177, 128);
}
