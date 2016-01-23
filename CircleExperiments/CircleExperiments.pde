int param = 25;
int isGrowing = 0;


void setup() {
  // make canvas 480px by 480px
  size(480,480);
  frameRate(120);
  background(255);
 
}


void draw() 
{

    //for(int i = 0; i < 5; i++)
    //{
    //  drawCircle(mouseX+20*i, mouseY);
    //  drawCircle(mouseX, mouseY+20*i);
    //  drawCircle(mouseX-20*i, mouseY);
    //  drawCircle(mouseX, mouseY-20*i);
    //}
    
    drawCircle(mouseX,mouseY);
    

}

void timedCircle()
{
  int startTime = millis();
  while((millis() - startTime) > 2000)
  {
    
    
    
  }
 
  
}

void drawCircle(int xMouse, int yMouse)
{
  if(isGrowing == 1) 
    {
      background(255);
      ellipse(xMouse, yMouse, param, param);
      param++;
    }
    
    if(param == width/6)
    {
      isGrowing = 0;
      param--;
    }
    
    if(isGrowing == 0 && param >= 0)
    {
      background(255);
      ellipse(xMouse, yMouse, param, param);
      param--;
    }
    
    if(param == 0)
    {
     param++;
     isGrowing = 1;
    }
}