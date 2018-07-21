void keyPressed() {
 if(key == 'g') {
  grid = !grid; 
  if(grid) {
    printD("grid",true);
  } else {
    printD("grid",false); 
  }
  //drawGrid($gridWidth);
 }
 
 if(key == 'd') {
  debug = !debug;
  if(debug) {
    printD("debug",true);
  } else {
    printD("debug",false); 
  }
 }
 
 if(key == 'l') {
  looping = !looping;
  if(looping) {
   loop(); 
  } else {
   noLoop(); 
  }
 }
 
 if(key == 'r') {
  background(255);
  drawRandom(); 
  //loop();
 }
}

void printD(String m, boolean t) {
  if (t) {
    println(m + ": on");
  } else {
    println(m + ": off");
  }
}
