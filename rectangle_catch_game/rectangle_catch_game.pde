
float boxX = 1;
float boxY = 1;
float boxHeight = 20;
float boxWidth = 40;
int dropSpeed = 5;
int speedControl = 4;
float dropHeight = 50; 
float randomX = 20;
float holeCenter = 1;
float leftEdgeOfHole = 1;
float rightEdgeOfHole = 1;
int gameOver = 0;

void setup()
{
 background(255);
 size(400,600);
 rectMode(CENTER);
 frameRate(60);
 
 // you've got to assign these in void setup() AFTER you've 
 // declared the size() of the canvas.
 boxX = width/2;
 boxY = height * 0.75;
}

void draw()
{
  
  if(gameOver == 0)
  {
  background(255);
  fill(255,0,0);
  rect(width/2, boxY, width, boxHeight);
  fill(255);
  noStroke();
  rect(boxX,boxY, boxWidth, boxHeight); 

 fill(0,255,0);
 
  if(keyCode == 39)
  {
    //keyCode = 36;
    background(255);
    fill(255,0,0);
    rect(width/2, boxY, width, boxHeight);
    noStroke();
    fill(255);
    rect(boxX,boxY, boxWidth, boxHeight);  
    boxX += speedControl;
  }
  
  // left arrow key press
  if(keyCode == 37)
  {
    //keyCode = 36;
    background(255);
    fill(255,0,0);
    rect(width/2, boxY, width, boxHeight);
    noStroke();
    fill(255);
    rect(boxX,boxY, boxWidth, boxHeight);  
    boxX -= speedControl;
  }
  
 if(boxX <= (0+boxWidth/2))
 {
  boxX = boxWidth/2; 
 }
 
 if(boxX >= (width-boxWidth/2))
 {
  boxX = width - boxWidth/2; 
 }
 
 if(dropHeight < height)
 {
   fill(0,255,0);
   ellipse(randomX, dropHeight, 30, 30);
   dropHeight += dropSpeed;
 }
 
 if(dropHeight >= height)
 {
   fill(0,255,0);
   randomX = random(0,width);
   dropHeight = 50;
   ellipse(randomX, dropHeight, 30, 30);
   dropHeight += dropSpeed;
 }
 
 if(dropHeight == boxY)
 {
   if(randomX < boxX - boxWidth/2 | randomX > boxX + width/2)
   {
    gameOver = 1; 
   }
 }
 

  }
  else
  {
      // calculations
    holeCenter = boxX;
    leftEdgeOfHole = boxX-boxWidth/2;
    rightEdgeOfHole = boxX+boxWidth/2;
    background(0);
    textMode(CENTER);
    fill(255);
    text("Game Over!",width/2,height/2);
    text("Press R to Restart",width/2,height/2+20);
  }  
}

void keyPressed()
{
  if(key == 'r' | key == 'R')
  {
    gameOver=0;
    dropHeight = 50;
    randomX = random(0,width/2);
 }
  
}