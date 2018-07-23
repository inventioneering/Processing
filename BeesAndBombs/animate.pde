//// get the startAngle and endAngle for a given segment

//void animate() {
//  Segment a = $segments.get(0);
//  //Segment b = $segments.get(1);
//  //Segment c = $segments.get(2);
  
//  float sA = a.getStartAngle();
//  float cA = a.getCurrentAngle();
//  float eA = a.getEndAngle();
  
//  int sAB = a.getStartAngleBool();
//  //int cAB = a.getCurrentAngleBool();
//  int eAB = a.getEndAngleBool();
  
//  //float sB = b.getStartAngle();
//  //float cB = b.getCurrentAngle();
//  //float eB = b.getEndAngle();
  
//  //float sC = c.getStartAngle();
//  //float cC = c.getCurrentAngle();
//  //float eC = c.getEndAngle();
  
//  println("start: "+ sAB + " end:  "+eAB);
//  println("start: "+ sA + " end:  "+eA);
//  //println("sB: "+ sB + " cB: "+cB+ " eB: "+eB);
//  //println("sC: "+ sC + " cC: "+cC+ " eC: "+eC);
//}

////boolean moveRequiredQ(Segment a) {
////  return a.getCurrentAngleBool() !=a.getEndAngleBool();
////}

//void updateCurrent() {  // should be an object method for SegmentClass
//  // test on first element in $segments ArrayList<Segment>
//  Segment s = $segments.get(0);
//  int duration = 2;                             // in seconds
//  int totalFrames = $fRate*duration;
//  float sA = s.getStartAngle();
//  float cA = s.getCurrentAngle();
//  float eA = s.getEndAngle();
//  boolean animating = false;
  
//  int start = s.getStartAngleBool();
//  int end = s.getEndAngleBool();
//  //int current = s.getCurrentAngleBool();
  
//  float angle = eA - sA;                          // not sure if correct... might be flipped?
//  float angleIncrement = (angle/totalFrames);     // split the distance between start and end into equal parts
  
//   //println("-? " + "sA: " + sA + " cA: " + cA + " eA: "+ eA);
//   //println("? " + "s: " + start + " c: " + cA + " e: "+ end);
//  if(start != end) {
//    animating = true;
//  }
  
//  if(animating) {
//     println("--BEFORE-- " + "sA: " + sA + " cA: " + cA + " eA: "+ eA);
//     println("--BEFORE-- " + "s: " + start + " c: " + cA + " e: "+ end);
//    // $segments.get(0).incrementCurrentAngle(angleIncrement);
//    s.incrementCurrentAngle(angleIncrement); // looks like there is a pointer happening here...
//    println("Incremented by: " + angleIncrement);
//    cA = s.getCurrentAngle();
//   // current = s.getCurrentAngleBool();
//    println("--AFTER--" + "sA: " + sA + " cA: " + cA + " eA: "+ eA);
//    println("--AFTER--" + "s: " + start + " c: " + cA + " e: "+ end);
//    println();
//    if (!s.shouldContinueAnimating()) { animating = false; return; }
//  }

  
  
//}
