class Segment
{
  // data  
  // *************************************************************************************************
  int segmentLength;
  // use "static" keyword to make class variable
  PVector center;
  float startAngle;
  //float currentAngle; // will use this when we start animating
  //float endAngle; // will use this when we start animating
  float newLength;
  boolean isEmpty;
  
  // constructor 
  // *************************************************************************************************
  Segment(int x, int y) {
    segmentLength = $gridWidth;
    float p = segmentLength/2;
    center = new PVector(x+p,y+p);
    startAngle = 0; 
    //currentAngle = startAngle;
    //endAngle = startAngle;
    newLength = segmentLength;
    isEmpty = true;
  }
  
  //Segment(int x, int y, boolean isLeft) {
  //  segmentLength = $gridWidth;
  //  float p = segmentLength/2;
  //  center = new PVector(x+p,y+p);
  //  if (isLeft) { // left
  //    startAngle = 0;
  //  } else if (!isLeft) { // right
  //    startAngle = PI/2;
  //  }
  //  currentAngle = startAngle;
  //  endAngle = startAngle;
  //  newLength = segmentLength;
  //}
  
  // helper methods
  // *************************************************************************************************
  boolean isEmpty() {
    return isEmpty; 
  }
  
  float getStartAngle() {
    return this.startAngle;  
  }
  
  int getStartAngleBool() {
    if (this.startAngle > (PI/3)) {
      return 1; // learning right
    } else {
      return 0; // not leaning right
    }
  }
  
 
  
  float getLength(float angle) {
    //https://www.desmos.com/calculator/mu1snong2u
    return 0.6714*angle*angle-1.0548*angle+sqrt(2);
  }
  
  // int getLength() {
  //   return this.segmentLength; 
  // }

  //PVector getCenter() {
  //  return this.center; 
  //}


  // methods
  // *************************************************************************************************
    void setAngle(float _angle) {
      startAngle = _angle;
    }
    
    void setStartAngle(boolean t) {
     if (t) {
      startAngle = PI/2; // "leaning"
     } else {
      startAngle = 0;  // not "leaning"
     }
    }
    
    void setRandomAngle() {
      float p = random(0,1);
      if (p < 0.5) {
       startAngle = 0;  // left 
      } else {
       startAngle = PI/2; // right 
      }
    }

    void show() {
      float l = getLength(startAngle);
      float k = (segmentLength/sqrt(2));
      float p = round((l*k)/2);
      pushMatrix();
      translate(center.x,center.y); // move to center + 1/2 line length
      rotate(startAngle);
      line(-p,-p,p,p);
      popMatrix();
      if(debug) {
        fill(255,0,0);
        ellipse(center.x,center.y,5,5);
      }
    }
  
 
}
