// get the startAngle and endAngle for a given segment

void animate() {
  Segment a = $segments.get(0);
  //Segment b = $segments.get(1);
  //Segment c = $segments.get(2);
  
  float sA = a.getStartAngle();
  float cA = a.getCurrentAngle();
  float eA = a.getEndAngle();
  
  int sAB = a.getStartAngleBool();
  int cAB = a.getCurrentAngleBool();
  int eAB = a.getEndAngleBool();
  
  //float sB = b.getStartAngle();
  //float cB = b.getCurrentAngle();
  //float eB = b.getEndAngle();
  
  //float sC = c.getStartAngle();
  //float cC = c.getCurrentAngle();
  //float eC = c.getEndAngle();
  
  println("start: "+ sAB + " end:  "+eAB);
  println("start: "+ sA + " end:  "+eA);
  //println("sB: "+ sB + " cB: "+cB+ " eB: "+eB);
  //println("sC: "+ sC + " cC: "+cC+ " eC: "+eC);
}

boolean moveRequiredQ(Segment a) {
  return a.getStartAngle() !=a.getEndAngle();
}

void updateCurrent() {  // should be an object method for SegmentClass
  // test on first element in $segments ArrayList<Segment>
  int duration = 2;                             // in seconds
  int totalFrames = $fRate*duration;
  float sA = $segments.get(0).getStartAngle();
  float eA = $segments.get(0).getEndAngle();
  float angle = sA - eA;                          // flip if misbehaving
  float angleIncrement = -1*(angle/totalFrames);  // split the distance between start and end into equal parts
  
  // update currentAngle
  Segment s = $segments.get(0);
  int start = s.getStartAngleBool();
  int end = s.getEndAngleBool();
  int current = s.getCurrentAngleBool();
  if(start != end) {
    if(current != end) { // should make sure we stop moving
      $segments.get(0).incrementCurrentAngle(angleIncrement);
      println("s: " + start + " c: " + current + " e: "+ current + " --MOVING--");
    }
  }
}
