// assumes: 
// 1. global ArrayList<Segment> named segments exists
// 2. global $gridWidth exists and has been initialized to an even number
// 3. globals $rows and $cols exist
// 4. $rows == $cols and they are an even number

// fill segments with default Segment objects. Default constructor sets this.startAngle to -1
// we will use this value as a check in subsequent steps.
void fillSegments() {
  for (int row = 0; row<$rows; row++) {
    for (int col = 0; col<$cols; col++) {
      segments.add(new Segment(0+$gridWidth*col, 0+$gridWidth*row));
    }
  }
}

// helper function 
boolean randomAngle() {
  int p = int(random(0,2)); // random value 0 or 1
  if(p == 1) {
   return true;
  } else {
   return false; 
  }
}

// generate the pattern in the top left corner of image
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
        // set value and set it's "mirror" value to match
        boolean angle = randomAngle();
        segments.get(index).setStartAngle(angle);
        segments.get(mirrorIndex).setStartAngle(angle);
      }
    }
  }
}

// map mirror of top left to top right
void topHalf() {
  for (int row = 0; row<($rows/2); row++) {
    int distBetween = 1;                        // set the "offset" between values across L.O.S.
    for (int col = ($cols/2); col<$cols; col++) {
      int index = col+(row*$cols);
      int mirrorIndex = index - distBetween;
      if(segments.get(mirrorIndex).getStartAngle()>(PI/3)) { // check to see if leaning right
        segments.get(index).setStartAngle(false);
      } else {
        segments.get(index).setStartAngle(true);
      }
      distBetween += 2;
    }
  }
}


// map top half onto bottom half
void bottomHalf() {
  int distBetween = 1; // set the "offset" between values between rows in L.O.S.
  for (int row = ($rows/2); row<$rows; row++) {                       
    for (int col = 0; col<$cols; col++) {
      int index = col+(row*$cols);
      int mirrorIndex = col+((row-distBetween)*$cols);
      println("index: " + index + " mirrorIndex: "+mirrorIndex);
      // get mirrorIndex lean and map new index value to opposite
      // 1. read value mirrorIndex
      // 2. get opposite
      // 3. assign to index
      if(segments.get(mirrorIndex).getStartAngle()>(PI/3)) { // check to see if leaning right. floats require a value that's between two extremes. I picked PI/3. Anything between PI/2 and PI/4 would have worked.
        segments.get(index).setStartAngle(false);
      } else {
        segments.get(index).setStartAngle(true);
      }
    }
    distBetween += 2;
  }
}


// show all segments ArrayList
void showSegments() {
  for (int i = 0; i<$cols*$rows; i++) {
    segments.get(i).show();
  }
}

void showSegmentsEnd() {
   for (int i = 0; i<$cols*$rows; i++) {
    segments.get(i).showEnd();
  }
}



// run all the parts.
void generateNewImage() {
  println("----------------- Start Image -----------------");
  topLeft();
  topHalf();
  bottomHalf();
  println("----------------- End Image -----------------");
}
