// assumes: 
// 1. global Intlist named pattern exists
IntList pattern = new IntList();

// 2. global $gridWidth exists and has been initialized to an even number
// 3. globals $rows and $cols exist
// 4. $rows == $cols and they are an even number

// fill pattern with -1's. We will use this value as a check in subsequent steps.
void fillPattern() {
  for (int i = 0; i<$rows*$cols; i++) {
      pattern.append(2);
    }
  //println(pattern);
}

int randomAngleInt() {
  int p = int(random(0,2)); // random value 0 or 1
  if(p == 1) {
   return 1;
  } else {
   return 0; 
  }
}

void makePattern() {
  // topLeft
    for (int row = 0; row<($rows/2); row++) {
      for (int col = 0; col<($cols/2); col++) {
        int index = col+(row*$cols);                 // index of current element
        int mirrorIndex = row+(col*$cols);           // index of its "mirror" across diagonal
        if (row == col )                              // on a diagonal
        {                            
          // choose random angle and overwrite -1 with this new one
          pattern.set(index,randomAngleInt());
        } 
        if (pattern.get(index) == 2)       // see if its been set to anything beyond default yet
        {   
          // set value and set it's "mirror" value to match
          int angle = randomAngleInt();
          pattern.set(index, angle);
          pattern.set(mirrorIndex, angle);
        }
      }
    }
  
  // top half
  for (int row = 0; row<($rows/2); row++) {
    int distBetween = 1;                        // set the "offset" between values across L.O.S.
    for (int col = ($cols/2); col<$cols; col++) {
      int index = col+(row*$cols);
      int mirrorIndex = index - distBetween;
      if(pattern.get(mirrorIndex) == 1) { // check to see if leaning right
        pattern.set(index, 1);
      } else {
        pattern.set(index,0);
      }
      distBetween += 2;
    }
  }

  
  // bottom half
  
}






//// map top half onto bottom half
//void bottomHalf() {
//  int distBetween = 1; // set the "offset" between values between rows in L.O.S.
//  for (int row = ($rows/2); row<$rows; row++) {                       
//    for (int col = 0; col<$cols; col++) {
//      int index = col+(row*$cols);
//      int mirrorIndex = col+((row-distBetween)*$cols);
//      println("index: " + index + " mirrorIndex: "+mirrorIndex);
//      // get mirrorIndex lean and map new index value to opposite
//      // 1. read value mirrorIndex
//      // 2. get opposite
//      // 3. assign to index
//      if(segments.get(mirrorIndex).getStartAngle()>(PI/3)) { // check to see if leaning right. floats require a value that's between two extremes. I picked PI/3. Anything between PI/2 and PI/4 would have worked.
//        segments.get(index).setStartAngle(false);
//      } else {
//        segments.get(index).setStartAngle(true);
//      }
//    }
//    distBetween += 2;
//  }
//}


//// show all pattern elements
void showPattern() {
  for(int row = 0; row<$rows; row++) {
    for(int col = 0; col<$cols; col++) {
      int index = col + (row*$cols);
      print(pattern.get(index)+" ");
    }
    println();
  }
}



//// run all the parts.
void patternAll() {
  println("----------------- Start Pattern -----------------");
  fillPattern();
  makePattern();
  showPattern();
  println("----------------- End Image -----------------");
}
