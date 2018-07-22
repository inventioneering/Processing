void mapEndPattern() {
  IntList pat = makePattern();
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
