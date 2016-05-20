import processing.video.*;

Capture theCap;

int stageNumber = 1;
float imageSideLength;
String row = "";

void setup()
{
  size(640,640);
  imageSideLength = width;
  noStroke();
  drawBox();
  println(calcDimensions(stageNumber, width));
  
  //theCap = new Capture(this, width, height, 50);
  theCap = new Capture(this, width, height, 50);
  //theCap = new Capture(this);
  theCap.start();
  
}

void draw()
{
  
  if (theCap.available() == true) {
    theCap.read();
  }
  if(stageNumber == 1)
  {
    image(theCap, 0, 0, width, height);
  }
}

void keyPressed()
{
 if(key == ' ')
 {
   background(255);
  drawScreen(stageNumber, width);
  stageNumber++;
  key = 't';
  if(stageNumber > 10)
  {
   stageNumber = 1;
  }
 }
}

void drawBox()
{
  for(int j = 0; j < stageNumber; j++)
  {
    for(int i = 0; i < stageNumber; i++)
    {
      row += "x ";
    }
    println(row);
    row = "";
  }
}

void drawScreen(int stage, int screenWidth)
{
  float side = calcDimensions(stage, screenWidth);
  for(int j = 0; j<stage; j++)
  { 
    for(int i = 0; i<stageNumber; i++)
    {
     //fill(random(100,255),0,0,random(100));
     //rect(i*side, j*side, side, side);
     image(theCap, i*side, j*side, side, side);
    }
  }
}

void drawRow(int stage, int screenWidth)
{
  int side = calcDimensions(stage, screenWidth);
  for(int i = 0; i<stageNumber; i++)
  {
   fill(random(255),random(255),random(255));
   rect(i*side, 0, side, side);
  }
}

int calcDimensions(int a, int screenWidth)
{
  return screenWidth/a;
}