void mapPattern(String s) {
  IntList pat = makePattern(); // generate new pattern and hold it.
  
  if (s == "start") {
    for(int row = 0; row<$rows; row++) {
      for(int col = 0; col<$cols; col++) {
        int index = col + (row*$cols);
        if(pat.get(index) == 1) { // learning right
          segments.get(index).setStartAngle(true);
        } else { // leaning left
          segments.get(index).setStartAngle(false);
        }
      }
    }
  } 
  
  if (s == "end") {
    for(int row = 0; row<$rows; row++) {
      for(int col = 0; col<$cols; col++) {
        int index = col + (row*$cols);
        if(pat.get(index) == 1) { // learning right
          segments.get(index).setEndAngle(true);
        } else { // leaning left
          segments.get(index).setEndAngle(false);
        }
      }
    }
  }
  
}
