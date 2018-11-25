// This is the function that you will adapt to create what you are looking fors



void makeShapes(float startX, float startY, int shapeCount) {
  int shapeNumber = 0;
  while(shapeNumber < shapeCount) 
  {
    //makeRectangle(startX+random(-20,20), startY+random(-20,20));
    //makeTriangle(startX+random(-20,20), startY+random(-20,20), 40);
    makeCircle(startX+random(-20,20), startY+random(-20,20),50);
    shapeNumber++;
  }
}

void makeRectangles(float startX, float startY, int rectangleCount) {
  int rectangleNumber = 0;
  while(rectangleNumber < rectangleCount) 
  {
    makeRectangle(startX+random(-20,20), startY+random(-20,20));
    rectangleNumber++;
  }
}

void makeRectangleGrid(int rowCount, int columnCount, int numShapes) {
  float firstX = mouseX;
  float firstY = mouseY; 
  float xPos = firstX;
  float yPos = firstY;
  
  int spacerSize = 90;
  
  int rowNumber = 0;
  int columnNumber = 0;
  
  while(columnNumber < columnCount) 
  {
    while(rowNumber < rowCount) 
    {
      raisePen();
      makeShapes(xPos, yPos, numShapes);
      yPos = firstY + (rowNumber+1)*spacerSize;
      rowNumber++;
    }
    yPos = firstY;
    xPos = firstX + (columnNumber+1)*spacerSize;
    columnNumber++;
    rowNumber = 0;
  }
  

}

// helper functions
void dropPen() {
   ToDoList = (PVector[]) append(ToDoList, new PVector(-31, 0)); //Command 31 (lower pen)
}

void raisePen() {
   ToDoList = (PVector[]) append(ToDoList, new PVector(-30, 0)); //Command 30 (raise pen)
}

void GenerateMoreArtwork()
{
  float xStart = mouseX;
  float yStart = mouseY;
  float xPos = xStart;
  float yPos = yStart;
  
  raisePen();

  ToDoList = (PVector[]) append(ToDoList, new PVector(xPos, yPos)); // move to first point
  
  dropPen();
  
 
 //makeRectangles(mouseX, mouseY, 5);
 makeRectangleGrid(4,4,7);
 
 //makeRectangle(mouseX, mouseY);
 //grid();
  
  //raisePen();
}

void GenerateMoreArtwork_old()
{
  // these are imported from original function, replecates original behavior
  float xStart = mouseX;
  float yStart = mouseY;
  float radius = 5 + random(25);
  int steps = 100;
  
  int i = 0;
  float r;
  float xPos = xStart;
  float yPos = yStart;

  ToDoList = (PVector[]) append(ToDoList, new PVector(-30, 0)); //Command 30 (raise pen)

  // Command Code: Move to first (X,Y) point
  ToDoList = (PVector[]) append(ToDoList, new PVector(xPos, yPos)); 

  ToDoList = (PVector[]) append(ToDoList, new PVector(-31, 0)); //Command 31 (lower pen)

  
  // Trivial example of a generative method: 
  // Construct a random walk of constant-length steps.
  // Continue walking until maximum number of steps OR
  //     until we hit the walls of our page.

  while (i < steps)
  {
    r = random(TWO_PI);

    xPos = xPos + (radius * cos(r));
    yPos = yPos + (radius * sin(r));   

    if ((xPos < MousePaperLeft) || (xPos > MousePaperRight))
      break;
    if ((yPos < MousePaperTop) || (yPos > MousePaperBottom))
      break;

    // Command Code: Move to (X,Y)
    ToDoList = (PVector[]) append(ToDoList, new PVector(xPos, yPos)); 

    i++;
  }

  ToDoList = (PVector[]) append(ToDoList, new PVector(-30, 0)); //Command 30 (raise pen)
}
