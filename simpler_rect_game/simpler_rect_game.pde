int x, y = 1;
int yChange = 4;
int boxSpeed = 6;
int boxX, boxY = 1;
int boxWidth = 60;
int boxHeight = 20;
int gameOver = 0;


void setup()
{
  background(255);
  rectMode(CENTER);
  size(400, 600);
  frameRate(60);

  x = int(random(0, width));
}


void draw()
{
  if(gameOver == 0)
  {
  background(255);
  
  // create empty (black) band
  fill(0);
  rect(width/2, 0.75*height, width, boxHeight);
  
  // draw first "hole"
  fill(255);
    noStroke();
    rect(boxX,0.75*height,boxWidth,boxHeight);
  
  
  // right arrow, move "hole"
  if (keyCode == 39)
  {
    fill(255);
    noStroke();
    rect(boxX,0.75*height,boxWidth,boxHeight);
    if(boxX <= width-boxWidth/2 | boxX >= 0+boxWidth/2)
    {
     boxX += boxSpeed; 
    }
  }
  
  // left arrow, move "hole"
  if (keyCode == 37)
  {
    fill(255);
    noStroke();
    rect(boxX,0.75*height,boxWidth,boxHeight);
    if(boxX <= width-boxWidth/2 | boxX >= 0+boxWidth/2)
    {
     boxX -= boxSpeed; 
    }
  }
  
  // keep rectangular hole from going off screen
   if(boxX <= (0+boxWidth/2))
   {
     boxX = boxWidth/2; 
   }
 
   if(boxX >= (width-boxWidth/2))
   {
     boxX = width - boxWidth/2; 
   }

  // draw falling circle
  fill(0, 255, 0);
  ellipse(x, y, 30, 30);
  y += yChange;

  if (y >= height)
  {
    y = 0;
    x = int(random(0, width));
  }
  
  // check for collisions between falling circle and edges of "hole"
  
  // check three points, left side, bottom, right
  
  // check to see if the ball is at the top edge of the black band
  if(y+10 >= int(0.75*height-boxHeight/2) && y <= int(0.75*height+boxHeight/2))
  {
    if(x < boxX-boxWidth/2 | x > boxX+boxWidth/2)
    {
     //background(255,0,0); 
     gameOver = 1;
    }
  }
  }
  
  else if(gameOver == 1)
  {
    background(0,255,0);
    fill(255);
    textSize(32);
    text("Game Over!",width/2-90,height/2);
    text("Press R to Restart",width/2-130,height/2+80);
  }
  
}

void keyPressed()
{
  if(key == 'r' | key == 'R')
  {
    gameOver=0;
    y = 1;
    x = int(random(0, width));
 }
  
}