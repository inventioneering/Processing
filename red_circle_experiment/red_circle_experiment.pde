void setup()
{
  // set canvas size to 500px by 500px
  size(500,500);
  
  // make background black
  background(0);
  
}


void draw()
{
  // fill it with red
  fill(255,0,0);
  
  // draw a circle
  // make circle follow mouse
  ellipse(mouseX,mouseY,50,50);
  
  
  
}