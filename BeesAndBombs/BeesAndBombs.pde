// trying to copy: https://twitter.com/beesandbombs/status/1019924265540431872

// Globals
// *************************************************************************************************
int $gridWidth = 100; //10, 20, 30, 50 for (600,600) canvas size
boolean grid = false;
boolean debug = false;
boolean looping = false;
Segment s1;
Segment s2;
Segment s3;
int $cols, $rows;
ArrayList<Segment> segments = new ArrayList<Segment>();
ArrayList<Segment> list = new ArrayList<Segment>();
// *************************************************************************************************


// Helper methods
// *************************************************************************************************
void drawRandom() {
   //show first row of ArrayList
  for (int i = 0; i<$cols*$rows; i++) {
    float angle;
    //angle = map(mouseX, 0, width, 0, PI/2);
    float r = random(0,1);
    if(r < 0.5) {
     angle = PI/2; 
    } else {
      angle = 0;
    }
    segments.get(i).setAngle(angle);
    segments.get(i).show(); 
  }
}


// Setup
// *************************************************************************************************
void setup() {
  size(600, 600);
  background(255);
  smooth(8);
  rectMode(CORNER);
  stroke(0);
  strokeWeight(2);
  noLoop();

  $cols = width/$gridWidth;
  $rows = height/$gridWidth;
 
  // fill up segments ArrayList
  //for (int i = 0; i<cols; i++) {
  // for (int j = 0; j<rows; j++){
  //  segments.add(new Segment(0+$gridWidth*j,0+$gridWidth*i)); 
  // }
  //}
  //drawGrid($gridWidth);
  //fillSegments();
  patternAll();
 
  
  
    
    // TESTING
    // ********************************************************
    println("rows: "+ $rows + " cols: "+$cols);
    // ********************************************************
}




// Draw
// *************************************************************************************************
void draw() {
  background(255);
  //if(grid) { drawGrid($gridWidth); } // toggle with 'g' key

  // if looping
  if (looping) {
    generateNewImage();
    showSegments();
  }
 
}
