// Declare and contruct a growing circle object (circle1) from the class GrowingCircles
int radius = 1;
void setup()
{
  size(400,400);
  frameRate(30);
  background(255);
}

void draw()
{

}

void mousePressed()
{
 
  for(int i = radius; i < 100; i = i+10) {
     strokeWeight(2);
     noFill();
    ellipse(mouseX, mouseY, i, i);
    //background(255);
  }
  
}