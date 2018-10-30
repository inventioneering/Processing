// inspired by: https://www.youtube.com/watch?v=bEyTZ5ZZxZs
int x = 0;
int y = 0;
int spacing = 20;
float probability = 0;

void setup() {
 size(400,400);
 background(0);
 frameRate(100);
}

void draw() {
  stroke(255);
  if(random(1) < probability) {
    line(x, y, x + spacing, y + spacing);
  } else {
    line(x, y + spacing, x + spacing, y);
  }
  
  x = x + spacing;
  
  if (x > width) {
    x = 0;
    y = y + spacing;
  }
  
  println("Probability: "+ probability);
}

void reset() {
  background(0);
   x = 0;
   y = 0;
}

void keyPressed() {
 if(key == 'c') {
   reset();
 }
 
 if(keyCode == LEFT) {
   reset();
   probability = probability - 0.05;
   if(probability < -0.05) {
     probability = 0; // reset
   }
 }
 
 if(keyCode == RIGHT) {
   reset();
   probability = probability + 0.05;
   if(probability > 1.1) {
     probability = 0; // reset
   }
 }
}
