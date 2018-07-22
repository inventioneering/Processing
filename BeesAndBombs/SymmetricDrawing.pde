// assumes: 
// 1. global ArrayList<Segment> named segments exists
// 2. global $gridWidth exists and has been initialized
// 3. globals $rows and $cols exist

// fill segments with default Segment objects. Default constructor sets this.startAngle to -1
// we will use this value as a check in subsequent steps.
void fillSegments() {
  for (int row = 0; row<$rows; row++) {
    for (int col = 0; col<$cols; col++) {
      segments.add(new Segment(0+$gridWidth*col, 0+$gridWidth*row));
    }
  }
}

void showSegments() {
  for (int i = 0; i<$cols*$rows; i++) {
    segments.get(i).show();
  }
}

void topLeft() {
  for (int row = 0; row<($rows/2); row++) {
    for (int col = 0; col<($cols/2); col++) {
      int index = col+(row*$cols);                 // index of current element
      int mirrorIndex = row+(col*$cols);           // index of its "mirror" across diagonal
      if (row == col )                              // on a diagonal
      {                            
        // choose random angle
        segments.get(index).setStartAngle(randomAngle());
      } 
      if (segments.get(index).isEmpty())       // see if its been set to anything beyond default yet
      {   
        // set value and set it's "mirror" value
        boolean angle = randomAngle();
        segments.get(index).setStartAngle(angle);
        segments.get(mirrorIndex).setStartAngle(angle);
      }
    }
  }
}



boolean randomAngle() {
  int p = int(random(0,2)); // random value 0 or 1
  if(p == 1) {
   return true;
  } else {
   return false; 
  }
}
