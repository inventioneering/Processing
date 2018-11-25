void makeRectangle(float x, float y) {
  float minDist = -20;
  float maxDist = 20;
  
  // use these values for pseudo randomness in position of rectangle 
  x = x + map(randomizer.getPseudoRandom(),0,1,minDist,maxDist);
  y = y + map(randomizer.getPseudoRandom(),0,1,minDist,maxDist);
  
  // use these value for perlin randomness in position of rectangle
  // x = x + map(randomizer.getPerlinRandom(),0,1,minDist,maxDist);
  // y = y + map(randomizer.getPerlinRandom(),0,1,minDist,maxDist);
  
  float firstX = x;
  float firstY = y;
  
  // change these to control size of rectangles
  float minLength = 10;
  float maxLength = 50;
 
  // use these values for pseudo randomness in size of rectangle
  float h = map(randomizer.getPseudoRandom(),0,1,minLength,maxLength);
  float w = map(randomizer.getPseudoRandom(),0,1,minLength,maxLength);
  
  // use these values for pelin randomness in size of rectangle
  //float h = map(randomizer.getPerlinRandom(),0,1,minLength,maxLength);
  //float w = map(randomizer.getPerlinRandom(),0,1,minLength,maxLength);
  
  
    //dropPen(); // place here to enable draglines
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y));  
    dropPen(); // place here to remove drag lines
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
 
   //dropPen(); // place here to enable drag lines
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y));  
   dropPen();  // place here to remove drag lines
   
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

  ArrayList<PVector> circlePoints;  //used to hold onto points for a circle that will be drawn

  
  void findCirclePoints(float startX, float startY, float size) {
    circlePoints.clear();
    for(float i = 0; i<PI; i+=PI/36) {
      float tx = size*cos(i)*cos(i) + startX;
      float ty = size*cos(i)*sin(i) + startY;
      circlePoints.add(new PVector(tx,ty));
      //println(circlePoints.get(0).x);  // debugging
    }
  }
  
void makeCircle(float x, float y, float size) {

  findCirclePoints(x, y, size);
  //dropPen(); // place here to enable drag lines
  ToDoList = (PVector[]) append(ToDoList, new PVector(circlePoints.get(0).x, circlePoints.get(0).y));
  dropPen(); //place here to remove drag lines
  
  for(int i = 1; i<circlePoints.size(); i++) {
    PVector temp = circlePoints.get(i);
    ToDoList = (PVector[]) append(ToDoList, new PVector(temp.x, temp.y));
  }
   raisePen();
}

 //void calculateValuePairs(float val) {
 //   valueVectors.clear();
 //   for(float i = 0; i<30*PI; i+=increment) {
 //     float tx = size*sin(-val*i)*cos(i) + width/2;
 //     float ty = size*sin(-val*i)*sin(i) + height/2;
 //     valueVectors.add(new PVector(tx,ty));
 //   }
 // }
