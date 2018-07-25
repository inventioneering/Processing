// trying to copy: https://twitter.com/beesandbombs/status/1019924265540431872

// Globals
// *************************************************************************************************
int $gridWidth = 20; //10, 20, 30, 50 for(600,600) canvas size
int[] $gridWidthArray = {10,20,30,50,100};
int $gridWidthArrayIndex = 1;
boolean $grid = false;
boolean $debug = false;
boolean $looping = false;
int $fRate = 40; // 40 seems to be smoothest
int $strokeWeight = 3;
int $borderWidth = 100;
int $cols, $rows;
  
// timer
//float $startTime;
//float $currentTime;


// create a Director object to handle interactions between elements
Director director;

//// only one of these needed. We will change the behavior/attributes of these segments
//ArrayList<Segment> $segments = new ArrayList<Segment>();

//// contains lots of patterns, can be changed.
//ArrayList<Pattern> $patterns = new ArrayList<Pattern>();

// *************************************************************************************************


// Helper methods
// *************************************************************************************************
 //fill segments with default Segment objects. Default constructor sets this.startAngle to -1
// we will use this value as a check in subsequent steps.
//void fillSegments() {
//  for (int row = 0; row<$rows; row++) {
//    for (int col = 0; col<$cols; col++) {
//      $segments.add(new Segment(0+$gridWidth*col, 0+$gridWidth*row));
//    }
//  }
//}

//void showSegments(String s) {
//  for (int i = 0; i<$cols*$rows; i++) {
//    if (s == "start") {
//      $segments.get(i).showStart();
//      //if ($debug) { println("showing start"); }
//    } else if (s == "current") {
//       $segments.get(i).showCurrent();
//       //if ($debug) { println("showing start"); }
//    } else {
//      $segments.get(i).showEnd();
//     // if ($debug) { println("showing end"); }
//    }
//  }
//}

//void animateSegments() {
//  for (int i = 0; i<$cols*$rows; i++) {
//    $segments.get(i).animate();
//  }
//}

void calculateProperties() {
  $cols = (width-2*$borderWidth)/$gridWidth;
  $rows = (height-2*$borderWidth)/$gridWidth;
}


// Setup
// *************************************************************************************************
void setup() {
 // $startTime = millis(); // start timer
  size(800, 800);
  background(255);
  smooth(8);
  rectMode(CORNER);
  stroke(0);
  strokeWeight($strokeWeight);
  frameRate($fRate);
 // noLoop();

  //$cols = (width-2*$borderWidth)/$gridWidth;
  //$rows = (height-2*$borderWidth)/$gridWidth;
  calculateProperties();
 
  //drawGrid($gridWidth);
  //fillSegments();
  //mapPattern("start");
  //mapPattern("end");
  if ($grid) { drawGrid($gridWidth); };

  // TESTING
  // ***********************************************************************************************
  println("rows: "+ $rows + " cols: "+$cols);
  println();
  //$testSegment = $segments.get(0);
  // ***********************************************************************************************
 
  director = new Director();
 
}

// clunky way to switch, rely on $global state. Eew.
//String switchDrawing() {
//  background(255);
//  if ($grid) { drawGrid($gridWidth); };
//  if ($showing == "start") {
//    return "end"; 
//  } else {
//    return "start";
//  }
//}

//void rotateStartEnd() {
//  if($grid) { drawGrid($gridWidth); };
 
//  // flip back and forth
//  $currentTime = millis(); // get current time since start
//  if ($currentTime > $startTime + 600) { // after two seconds, switch
//    $showing = switchDrawing();
//    $startTime = $currentTime;
//  } 
//  showSegments($showing);
//}

// Draw
// *************************************************************************************************
void draw() {
  background(255);
  
  director.showSegments();
  //director.cycleShowPatterns();
  
  // create border by shifting drawn segments
  //pushMatrix();
  //translate($borderWidth,$borderWidth);
  
  //director.showSegments("end");
  
  //$showing = "start";
  //rotateStartEnd();
  //showSegments($showing);
  
  //$testSegment.animate();
  //$testSegment.showCurrent();
  
  //animateSegments();
  //showSegments("current");

  //popMatrix();
}
