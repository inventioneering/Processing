void makeRectangle(float x, float y) {
  float firstX = x;
  float firstY = y;
  float h = random(10,50);
  float w = random(10,50);
 
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y));  
   dropPen();
   x += w;
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y));
   y+= h;
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y));
   x -= w;
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y));
   
   ToDoList = (PVector[]) append(ToDoList, new PVector(firstX, firstY));
   raisePen();
}

void makeTriangle(float x, float y, float range) {
  float firstX = x;
  float firstY = y;
 
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y));  
   dropPen();
   
   x += random(-range, range);
   y += random(-range, range);
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y));
   
   x = firstX;
   y = firstY;
   x += random(-range, range);
   y += random(-range, range);
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y));
  
   ToDoList = (PVector[]) append(ToDoList, new PVector(firstX, firstY));
   raisePen();
}
