// trying to copy: https://twitter.com/beesandbombs/status/1019924265540431872

// Globals
// *************************************************************************************************
int $gridWidth = 20; //10, 20, 30, 50 for(600,600) canvas size
boolean grid = false;
boolean debug = false;
boolean looping = false;
int $cols, $rows;
ArrayList<Segment> segments = new ArrayList<Segment>();
String $showing;
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

// fill segments with default Segment objects. Default constructor sets this.startAngle to -1
// we will use this value as a check in subsequent steps.
void fillSegments() {
  for (int row = 0; row<$rows; row++) {
    for (int col = 0; col<$cols; col++) {
      segments.add(new Segment(0+$gridWidth*col, 0+$gridWidth*row));
    }
  }
}

void showSegments(String s) {
  for (int i = 0; i<$cols*$rows; i++) {
    if (s == "start") {
      segments.get(i).show();
      println("showing start");
    } else {
      segments.get(i).showEnd();
      println("showing end");
    }
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
 
  //drawGrid($gridWidth);
  fillSegments();
  mapPattern("start");
  mapPattern("end");

  // TESTING
  // ***********************************************************************************************
  println("rows: "+ $rows + " cols: "+$cols);
  // ***********************************************************************************************
}



// Draw
// *************************************************************************************************
void draw() {
  background(255);
  drawGrid($gridWidth);

  $showing = "start";
  showSegments($showing);
  
}
