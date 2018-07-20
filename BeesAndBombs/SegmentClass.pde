class Segment
{
  // data  
  // *************************************************************************************************
  int segmentLength;
  // use "static" keyword to make class variable
  PVector center;
  
  // constructor 
  // *************************************************************************************************
  Segment(int x, int y) {
    segmentLength = $gridWidth;
    float p = segmentLength/2;
    center = new PVector(x+p,y+p);
  }
  
  // helper methods
  // *************************************************************************************************
  float getLength(float angle) {
    //https://www.desmos.com/calculator/mu1snong2u
    return 0.6714*angle*angle-1.0548*angle+sqrt(2);
  }
  
  // methods
  // *************************************************************************************************
  void show() {
    float p = segmentLength/2;
    pushMatrix();
    translate(center.x,center.y); // move to center + 1/2 line length
    line(-p, -p, p, p);
    popMatrix();
    if(debug) {
     fill(255,0,0);
     ellipse(center.x,center.y,5,5);
     //println("showing centers");
    }
  }
  

  
  void rotate(float angle) {
    
  }
  
  void drawRotated(float angle, float length) {
  float l = length*($gridWidth/sqrt(2));
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  segment(l);
  popMatrix();
}
 

}
