int x;
int y;

void setup()
{
  background(0);
  size(600,400);
  x = width/2;
  y = height/2;
}



void draw()
{
  fill(230);
  noStroke();
  ellipse(x,y,2,2); 
}

void keyPressed()
{
 if(keyCode == UP)
 {
  y--;
 }
 
 if(keyCode == DOWN)
 {
  y++;
 }
 if(keyCode == LEFT)
 {
  x--;
 }
 
 if(keyCode == RIGHT)
 {
  x++;
 }
 
 if(key == 'e')
 {
  background(0);
 }
 
 
 
 
 
 
  
  
  
}