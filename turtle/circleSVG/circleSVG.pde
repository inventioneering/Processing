import Turtle.*;
import processing.svg.*;

Turtle t;

void setup() {
  size(500,500);
  background(255);
  stroke(0);
  t = new Turtle(this);
  noLoop();
 //beginRecord(SVG, "circle.svg");
}

void draw () {
   // draw arc
   for (int j = 0; j<8; j++) {
     for (int i = 0; i<60; i++) {
       arc(t,20,6);
     }
     //t.drawTurtle();
     t.left(45);
   }
  // endRecord();
}

void arc(Turtle x, int segmentLength, float angle) {
  x.forward(segmentLength);
  x.right(angle);
}
