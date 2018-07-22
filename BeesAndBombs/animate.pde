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
