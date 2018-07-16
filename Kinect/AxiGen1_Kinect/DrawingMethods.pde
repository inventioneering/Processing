// drawing methods

void motorToHome() {
 MoveToXY(0,0); 
}

void motorHalfway() {
 //MoveToXY(int(floor((740/2)*MotorStepsPerPixel)),0); 
 MoveToXY(MotorMaxY,0); 
}

void penUp() {
  ToDoList = (PVector[]) append(ToDoList, new PVector(-30, 0)); //Command 30 (raise pen)
}

void penDown() {
  ToDoList = (PVector[]) append(ToDoList, new PVector(-31, 0)); //Command 31 (lower pen)
}

boolean isParkedQ() {
  PVector cur = ToDoList[ToDoList.length-1];
  if (cur.x == -35 && cur.y == 0.0 && cur.z == 0.0) {
    if(debug) { println("Parked, yo!"); }
    return true;
  } else {
    if(debug) { println("not paaaaaaarked"); }
    return false;
  }
}

void drawPoint(float xStart, float yStart) {
  // check to see if any other points have been drawn
  if(isParkedQ()) {
    penUp();
    ToDoList = (PVector[]) append(ToDoList, new PVector(xStart,yStart)); // Command Code: Move to first (X,Y) point
    penDown();
  } else {
   ToDoList = (PVector[]) append(ToDoList, new PVector(xStart,yStart)); // Command Code: Move to first (X,Y) point
  }
 
  if(debug) {
  println(ToDoList);
  //println(xStart, yStart);
  }
}

PVector getKinectObjectPostion(float x, float y) {
  // uh, I'm gonna build this out
 return new PVector(x+random(-100,100), y+random(-100,100));
}

void movePenWithMouse(float x, float y) {
 MoveRelativeXY(mouseX, mouseY); 
}

void kinectDrawing(float xStart, float yStart) {
  penUp();

  // Command Code: Move to first (X,Y) point
  ToDoList = (PVector[]) append(ToDoList, new PVector(xStart, yStart));

  penDown();
  
  
  PVector cur;
  
  // I want to be able to toggle the kinectDrawing mode with a key press
  // I cannot listen for key presses inside a while loop so... this doesn't work right now.
  for(int i = 0; i< 10; i++) {
    cur = getKinectObjectPostion(xStart, yStart);
    ToDoList = (PVector[]) append(ToDoList, new PVector(cur.x, cur.y));
    drawToDoList();
    Paused = false;
    pause();
    //Paused = true;
  }
  
  penUp();
}

void drawBox(float xStart, float yStart, float width, float height)
{
  penUp();

  // Command Code: Move to first (X,Y) point -- at top left corner of rectangle
  ToDoList = (PVector[]) append(ToDoList, new PVector(xStart, yStart));

  penDown();

  // DRAW BOX. Top Left -> Top Right -> Bottom Right -> Bottom Left
  // Command - Move from top left to top right corner
  ToDoList = (PVector[]) append(ToDoList, new PVector(xStart + width, yStart));
  // Command - Move from top right to bottom right corner
  ToDoList = (PVector[]) append(ToDoList, new PVector(xStart + width, yStart + height));
  // Command - Move from bottom right to bottom left corner
  ToDoList = (PVector[]) append(ToDoList, new PVector(xStart, yStart + height));
  // Command - Move back to top left point
  ToDoList = (PVector[]) append(ToDoList, new PVector(xStart, yStart));

  penUp();
}
