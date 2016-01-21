int r = 10;
int g = 10;
int b = 10;
int brushSize = 50;

void setup() 
{
  size(800,800);
  background(255);
}


void draw() 
{
 
  fill(r,g,b);
  noStroke();
  rect(0,0,100,12);
  fill(255);
  text((r + "," + g + "," + b),10,10);
 
  
  if(keyPressed == true)
  {
  
  if(key == 'r')
  {
   r++;
   if (r > 255)
   {
    r = 0; 
   } 
  }
  
  else if(key == 'g')
  {
   g++;
   if (g > 255)
   {
    g = 0; 
   }
  }
  
  else if(key == 'b')
  {
   b++;
   if (b > 255)
   {
    b = 0; 
   } 
  }
  
}
}

void mouseDragged()
{
  if(mouseButton == LEFT)
  {
     strokeWeight(brushSize);
     stroke(r,g,b);
     line(pmouseX, pmouseY, mouseX, mouseY); 
  }
}

void mousePressed()
{
 if(mouseButton == RIGHT)
 {
  background(255); 
 }
}