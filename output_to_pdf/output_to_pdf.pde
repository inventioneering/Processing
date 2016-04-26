import processing.pdf.*;


void setup()
{
 size(400,400,PDF,"output.pdf"); 
}


void draw()
{
  rect(width/2, height/2, 50,50);
  // Exit the program 
  println("Finished.");
  exit();
}