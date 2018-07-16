// drawing methods

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

boolean isPenUpQ() {
  PVector cur = ToDoList[ToDoList.length-1];
  if (cur.x == -30 && cur.y == 0.0 && cur.z == 0.0) {
    if(debug) { println("pen is up!"); }
    return true;
  } else {
    if(debug) { println("pen is not up"); }
    return false;
  }
}

boolean isPenDownQ() {
  PVector cur = ToDoList[ToDoList.length-1];
  if (cur.x == -31 && cur.y == 0.0 && cur.z == 0.0) {
    if(debug) { println("pen is down!"); }
    return true;
  } else {
    if(debug) { println("pen is not down"); }
    return false;
  }
}


// drawPoint(mouseX, mouseY)
void drawPoint(float xStart, float yStart) {
  // check to see if any other points have been drawn
 // if(firstPoint) {
  if(isParkedQ()) {
    penUp();
    ToDoList = (PVector[]) append(ToDoList, new PVector(xStart,yStart)); // Command Code: Move to first (X,Y) point
  penDown();
  firstPoint = false;
}  else {
   ToDoList = (PVector[]) append(ToDoList, new PVector(xStart,yStart)); // Command Code: Move to first (X,Y) point
}
 
  if(debug) {
  println(ToDoList);
  //println(xStart, yStart);
  }
}

// drawBox(mouseX, mouseY, 500, 300)
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
