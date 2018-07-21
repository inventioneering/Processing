class Segment
{
  // data  
  // *************************************************************************************************
  int segmentLength;
  // use "static" keyword to make class variable
  PVector center;
  float angle;
  float newLength;
  
  // constructor 
  // *************************************************************************************************
  Segment(int x, int y) {
    segmentLength = $gridWidth;
    float p = segmentLength/2;
    center = new PVector(x+p,y+p);
    angle = 0;
    newLength = segmentLength;
  }
  
  // helper methods
  // *************************************************************************************************
  float getLength(float angle) {
    //https://www.desmos.com/calculator/mu1snong2u
    return 0.6714*angle*angle-1.0548*angle+sqrt(2);
  }
  
   int getLength() {
     return this.segmentLength; 
   }

  PVector getCenter() {
    return this.center; 
  }


  // methods
  // *************************************************************************************************
  
  void makeLine() {
    float p = segmentLength/2;
    line(-p,-p,p,p);
  }
  
  void show() {
    float p = round(segmentLength/2);
    pushMatrix();
    translate(center.x,center.y); // move to center + 1/2 line length
    line(-p, -p, p, p);
    popMatrix();
    if(debug) {
     fill(255,0,0);
     ellipse(center.x,center.y,5,5);
    }
  }
  
  void show(float _angle) {
    angle = _angle;
    float l = getLength(angle);
    float k = (segmentLength/sqrt(2));
    float p = round((l*k)/2);
    pushMatrix();
    translate(center.x,center.y); // move to center + 1/2 line length
    rotate(angle);
    line(-p,-p,p,p);
    popMatrix();
    if(debug) {
     fill(255,0,0);
     ellipse(center.x,center.y,5,5);
    }
    }

}
