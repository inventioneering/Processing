ArrayList<PVector> history = new ArrayList<PVector>();

void setup() {
  size(400,400);
  history.add(new PVector(mouseX,mouseY));
  history.add(new PVector(mouseX,mouseY));
  strokeWeight(2);
}


void draw() {

  fill(0);
  float x = mouseX; // replace with portValues[0]
  float y = mouseY; // replace with portValues[1]
  
  // add new vector to point history
  PVector point = new PVector(x,y); 
  history.add(point);
  
  // make a line segment out of the last two points
  // replicate behavior of:
  // line(pmouseX,pmouseY,mouseY,mouseY);
  PVector newPt = history.get(history.size()-1);
  PVector oldPt = history.get(history.size()-2);
  
  
  line(oldPt.x,oldPt.y,newPt.x,newPt.y);
  
}