void keyPressed() {
 if(key == 'g') {
  $grid = !$grid; 
  if($grid) {
    printD("grid",true);
  } else {
    printD("grid",false); 
  }
 }
 
 //if(key == 'a') {
 //  // start animation
 //  for (int i = 0; i<$rows*$cols; i++) {
 //    $segments.get(i).startAnimation();
 //  }
   
 //}

 if(key == 'd') {
  $debug = !$debug;
  if($debug) {
    printD("debug",true);
  } else {
    printD("debug",false); 
  }
 }
 
}

// Helper functions
void printD(String m, boolean t) {
  if (t) {
    println(m + ": on");
  } else {
    println(m + ": off");
  }
}
