// a way to hold onto and manipulate all of the patterns available to present on screen
// a PatternContainer object has Pattern objects

class Director
{
  // instance data  
  // *************************************************************************************************
  ArrayList<Pattern> patterns;
  ArrayList<Segment> segments; 
  
  // constructor 
  // *************************************************************************************************
   Director() {
     // only one of these needed. We will change the behavior/attributes of these segments
     segments = new ArrayList<Segment>();

     // contains lots of patterns, can be changed.
     patterns = new ArrayList<Pattern>();
  }
  
  // methods
  // *************************************************************************************************
  
  // pattern methods
    // make pattern
    // add pattern
    // remove pattern
    // apply pattern to segments
    
  // show methods
    // display segments
    // animate segments
    
  // interaction methods
    // handle key presses
    // trigger animations
    // create & show new pattern

}
