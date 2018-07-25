// a way to hold onto and manipulate all of the patterns available to present on screen
// a PatternContainer object has Pattern objects

class Timer
{
  // instance data  
  // *************************************************************************************************
  float startTime;
  float currentTime;
  float duration;
  boolean timerRunning;
  
  // constructor 
  // *************************************************************************************************
   Timer() {
     startTime = millis();
     currentTime = startTime;
     duration = 4000; // 10 second default timer..... Note: # of seconds * 1000 = value
     timerRunning = false;
  }
  
  // methods
  // *************************************************************************************************
  
  void startTimer() {
    timerRunning = true;
    startTime = millis();
  }
  
  void startTimer(int _duration) {
    timerRunning = true;
    startTime = millis();
    duration = _duration;
  }
  
  float getTimeRemaining() {
    currentTime = millis();
    float timePassed = currentTime - startTime;
    if( (timePassed) > duration ) {
      stopTimer();
    }
    float timeRemaining = (duration - timePassed)/1000;
    println("timeRemaining: "+timeRemaining);
    return timeRemaining; // return time left in seconds
  }
  
  void stopTimer() {
    timerRunning = false;
  }
  
  boolean isTimerRunning() {
    return timerRunning;
  }
}
