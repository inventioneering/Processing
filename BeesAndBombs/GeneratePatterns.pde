// assumes: 
// 1. global Intlist named pattern exists... this is being deprecated... You can use makePattern() to generate new pattern
// no global required.
//IntList pattern;

// 2. global $gridWidth exists and has been initialized to an even number
// 3. globals $rows and $cols exist
// 4. $rows == $cols and they are an even number


// helper function
int randomAngleInt() {
  int p = int(random(0,2)); // random value 0 or 1
  if(p == 1) {
   return 1;
  } else {
   return 0; 
  }
}


IntList makePattern() {
  // create empty pattern IntList
  IntList p = new IntList();
  
  // fill it with 2's as default value
  for (int i = 0; i<$rows*$cols; i++) {
      p.append(2);
  }
  
  // create design in top left that will be copied over to top right (to fill top half) and top half
  // will be copied to bottom half in a mirror fashion
    for (int row = 0; row<($rows/2); row++) {
      for (int col = 0; col<($cols/2); col++) {
        int index = col+(row*$cols);                 // index of current element
        int mirrorIndex = row+(col*$cols);           // index of its "mirror" across diagonal
        if (row == col )                              // on a diagonal
        {                            
          // choose random angle and overwrite -1 with this new one
          p.set(index,randomAngleInt());
        } 
        if (p.get(index) == 2)       // see if its been set to anything beyond default yet
        {   
          // set value and set it's "mirror" value to match
          int angle = randomAngleInt();
          p.set(index, angle);
          p.set(mirrorIndex, angle);
        }
      }
    }
  
  // top half
  for (int row = 0; row<($rows/2); row++) {
    int distBetween = 1;                        // set the "offset" between values across L.O.S.
    for (int col = ($cols/2); col<$cols; col++) {
      int index = col+(row*$cols);
      int mirrorIndex = index - distBetween;
      if(p.get(mirrorIndex) == 1) { // check to see if leaning right
        p.set(index, 0);
      } else {
        p.set(index,1);
      }
      distBetween += 2;
    }
  }

  
  // bottom half
    int distBetween = 1; // set the "offset" between values between rows in L.O.S.
    for (int row = ($rows/2); row<$rows; row++) {                       
      for (int col = 0; col<$cols; col++) {
        int index = col+(row*$cols);
        int mirrorIndex = col+((row-distBetween)*$cols);
       // println("index: " + index + " mirrorIndex: "+mirrorIndex);
        if(p.get(mirrorIndex) == 1) { // check to see if leaning right. floats require a value that's between two extremes. I picked PI/3. Anything between PI/2 and PI/4 would have worked.
          p.set(index,0);
        } else {
          p.set(index,1);
        }
      }
      distBetween += 2;
    }
    //pattern = p; // overwrite global "pattern" IntList
    return p; // return IntList for use in mapping
}


//// show all pattern elements ... deprecated
//void showPattern() {
//  for(int row = 0; row<$rows; row++) {
//    for(int col = 0; col<$cols; col++) {
//      int index = col + (row*$cols);
//      print(pattern.get(index)+" ");
//    }
//    println();
//  }
//}

//// run all the parts... deprecated
//void patternAll() {
//  println("----------------- Start Pattern -----------------");
//  makePattern();
//  showPattern();
//  println("----------------- End Pattern -----------------");
//}
