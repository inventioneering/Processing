import Turtle.*;
import processing.svg.*;

Turtle t;

void setup() {
  size(500,500);
  background(255);
  stroke(0);
  t = new Turtle(this);
  noLoop();
  t.setHeading(150);
  t.penUp();
  t.goToPoint(width/2, 100);
  t.penDown();
  //frameRate(10);
  //t.penUp();
 // t.goToPoint(0,25/sqrt(2));
   //beginRecord(SVG, "10Print.svg");
}

//int column = 0;
//int row = 1;
//float diagonalLength = 25;
//float sideLength = diagonalLength/sqrt(2);
//int totalColumns, totalRows;
void draw () {
 // t.penDown();

   arrowhead(7, 400); 
  //tenPrint();
  //endRecord();
}


void arrowhead(int order, float length) {
 if (order % 2 == 0) {
   curve(order, length, 60); 
 } else {
   curve(order, length, -60); 
 }
}

void curve(int order, float length ,int angle) {
  if (order == 0) {
     t.forward(length); 
  } else {
     curve(order -1, length/2, -1*angle); 
     t.left(angle);
     curve(order - 1, length/2, angle);
     t.left(angle);
     curve(order - 1, length/2, -1*angle);
  }
}
