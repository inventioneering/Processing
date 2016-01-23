int param = 25;

void setup() {
  // make canvas 480px by 480px
  size(480,480);
  frameRate(60);
  background(255);
}


void draw() {
 // background(255);

    //if(mousePressed == true) 
    //{
    // background(255);
    // ellipse(mouseX, mouseY, param, param);
    // param++;
    //} else {
    //  if(param > 25)
    //  {
    //   background(255);
    //   param--;
    //   ellipse(mouseX, mouseY, param, param);
    //  } else if(param == 25)
    //  {
    //    background(255);
    //    ellipse(mouseX, mouseY, param, param);
    //  }
     
    //}

}

void mousePressed()
{
  int startTime = millis();
  noFill();
  strokeWeight(2);
  //ellipse(mouseX, mouseY, param, param);
  startTime = grow(param, startTime);
}

void growCircle()
{
  for(int i = 0; i < width; i += 10)
  {
    ellipse(mouseX, mouseY, i, i);
  }
}

int grow(int _param, int _startTime)
{
  ellipse(mouseX, mouseY, _param, _param);
  
  if(millis() > _startTime + 200)
  {
    _param += 10;
    ellipse(mouseX, mouseY, _param, _param);
    return millis();
  } 
  else
    {
    fill(255,0,0,50);
    ellipse(mouseX, mouseY, 50, 50);
    return _startTime;
    }
}