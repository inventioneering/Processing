// create variables for centerpoint of canvas and scale valu
int midX = 0;
int midY = 0;
int baseline = 0;
float scale = 1;
float shapeBaseWidth = 40;
//float shapeBaseWidth = 100;
int backgroundColor = 210;

// use the y-values of the sine function on [0,pi/2] to grow the line
float[] sineValues = new float[numOfCalculations];
float increment = HALF_PI/sineValues.length;
float sineInput = 0;
int index = 0;
