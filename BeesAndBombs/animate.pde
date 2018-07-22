// get the startAngle and endAngle for a given segment

void animate() {
  Segment a = $segments.get(0);
  Segment b = $segments.get(1);
  Segment c = $segments.get(2);
  
  float sA = a.getStartAngle();
  float cA = a.getCurrentAngle();
  float eA = a.getEndAngle();
  
  float sB = b.getStartAngle();
  float cB = b.getCurrentAngle();
  float eB = b.getEndAngle();
  
  float sC = c.getStartAngle();
  float cC = c.getCurrentAngle();
  float eC = c.getEndAngle();
  
  println("sA: "+ sA + " cA: "+cA+ " eA: "+eA);
  println("sB: "+ sB + " cB: "+cB+ " eB: "+eB);
  println("sC: "+ sC + " cC: "+cC+ " eC: "+eC);
}


void updateCurrent() {  // should be an object method for SegmentClass
  // test on first element in $segments ArrayList<Segment>
  int duration = 2;                             // in seconds
  int totalFrames = $fRate*duration;
  float sA = $segments.get(0).getStartAngle();
  float eA = $segments.get(0).getEndAngle();
  float angle = sA - eA;                       // flip if misbehaving
  float angleIncrement = -1*(angle/totalFrames);  // split the distance between start and end into equal parts
  
  // update currentAngle
  if($segments.get(0).getCurrentAngle() <= $segments.get(0).getEndAngle()) {
    $segments.get(0).incrementCurrentAngle(angleIncrement);
  }
  
}
