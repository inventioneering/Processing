// a way to hold onto and manipulate all of the patterns available to present on screen
// a PatternContainer object has Pattern objects

class Director
{
  // instance data  
  // *************************************************************************************************
  ArrayList<Pattern> patterns;
  ArrayList<Segment> segments; 
  String showing;
  float startTime;
  float currentTime;
  Timer timer;
  
  // constructor 
  // *************************************************************************************************
   Director() {
     // create timer object
     timer = new Timer();
     
     // only one of these needed. We will change the behavior/attributes of these segments
     segments = new ArrayList<Segment>();

     // contains lots of patterns, can be changed.
     patterns = new ArrayList<Pattern>();
     
     // showing
     showing = "start";
     
     // fill up segments with the right number of segments and default values
     for (int row = 0; row<$rows; row++) {
       for (int col = 0; col<$cols; col++) {
         segments.add(new Segment(0+$gridWidth*col, 0+$gridWidth*row));
       }
     }

     // create "firstPattern"
     addNewPattern();
     // map firstPattern onto "startAngle" for each Segment in segments
     mapPattern(0,"start");
     
     // create "secondPattern"
     addNewPattern();
     // map secondPattern onto "endAngle" for each Segment in segments
     mapPattern(1,"end");
    
  }
  
  // methods
  // *************************************************************************************************
  
  String getShowing() {
    return showing;
  }
  
  void setShowing(String s) {
    showing = s;
  }
  
  // pattern methods
  // *************************************************************************************************
    // append new pattern
    void addNewPattern() {
      patterns.add(new Pattern());
    }
    
    void addTenPatterns() {
      for (int i = 0; i< 10; i++) {
        patterns.add(new Pattern());
      }
    }
    
    void cycleShowPatterns() {
      //timer.startTimer();
      if(timer.isTimerRunning == false)
      println("time left: " + timer.getTimeRemaining());
      timer.getTimeRemaining();
      if(!timer.isTimerRunning()) 
      {
        if(showing == "start")
        {
           showing = "end";
        } 
        else 
        {
           showing = "start";
         }
      }
      showSegments();
    }
    
    // remove pattern
    // apply pattern to segments
    void mapPattern(int patternNumber, String s) {
      //IntList pat = makePattern(); // generate new pattern and hold it.
      IntList pat = patterns.get(patternNumber).getPatternPositions();
      
      if (s == "start") {
        for(int row = 0; row<$rows; row++) {
          for(int col = 0; col<$cols; col++) {
            int index = col + (row*$cols);
            if(pat.get(index) == 1) { // learning right
              segments.get(index).setStartAngle(true);
              segments.get(index).setCurrentAngle(true);
            } else { // leaning left
              segments.get(index).setStartAngle(false);
              segments.get(index).setCurrentAngle(false);
            }
          }
        }
        println("mapped start pattern");
        return;
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
      println("mapped end pattern");
      return;
    }
    
  // show methods
  // *************************************************************************************************
  
  
  // display segments
  void showSegments() {
    String s = showing;
    pushMatrix();
    translate($borderWidth,$borderWidth);
    for (int i = 0; i<$cols*$rows; i++) {
      if (s == "start") {
        segments.get(i).showStart();
        showing = "start";
        //if ($debug) { println("showing start"); }
      } else if (s == "current") {
         segments.get(i).showCurrent();
         showing = "current";
         //if ($debug) { println("showing start"); }
      } else {
        segments.get(i).showEnd();
        showing = "end";
       // if ($debug) { println("showing end"); }
      }
    }
    popMatrix();
  }
  
  void showSegments(String s) {
    pushMatrix();
    translate($borderWidth,$borderWidth);
    for (int i = 0; i<$cols*$rows; i++) {
      if (s == "start") {
        segments.get(i).showStart();
        showing = "start";
        //if ($debug) { println("showing start"); }
      } else if (s == "current") {
         segments.get(i).showCurrent();
         showing = "current";
         //if ($debug) { println("showing start"); }
      } else {
        segments.get(i).showEnd();
        showing = "end";
       // if ($debug) { println("showing end"); }
      }
    }
    popMatrix();
  }
    // animate segments
    
  // interaction methods
  // *************************************************************************************************
  
  Timer getTimer() {
    return timer;
  }
  
  // handle timed events
  // *************************************************************************************************

}
