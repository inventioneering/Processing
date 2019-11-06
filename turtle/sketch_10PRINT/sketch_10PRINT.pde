import Turtle.*;
import processing.svg.*;

Turtle t;

void setup() {
  size(500,500);
  background(255);
  stroke(0);
  t = new Turtle(this);
  noLoop();
  //frameRate(10);
  t.penUp();
  t.goToPoint(0,25/sqrt(2));
   beginRecord(SVG, "10Print.svg");
}

int column = 0;
int row = 1;
float diagonalLength = 25;
float sideLength = diagonalLength/sqrt(2);
int totalColumns, totalRows;
void draw () {
 
  tenPrint();
  endRecord();
}

void tenPrint() {
   totalColumns = int(width/sideLength);
      totalRows = int(height/sideLength);
    while(row <= totalRows) {
     
       //println("total columns: " + totalColumns + " col: " + column + " row: " + row + " width: " + width + " height: " + height + " sideLength:" + sideLength);
       if(column > totalColumns) {
         column = 0;
         row++;
       }
       
        t.goToPoint(column*sideLength,row*sideLength);
        float r = random(0,1);
        if(r<0.42) {
           aSegment(t,diagonalLength);
         } else {
           bSegment(t,diagonalLength);
         }
         column++;
    }
   
}


void keyPressed()
{
  //press the 's' key to save a pdf of your drawing
  if (key == 's') 
  {
    beginRecord(SVG, "10Print.svg");
    draw();
    endRecord();
  }
} 

void aSegment(Turtle x, float dist) {
  x.setHeading(0);
  x.penDown();
  x.right(45);
  x.forward(dist);
  x.penUp();
  x.right(135);
  x.forward(dist/sqrt(2));
  x.setHeading(0);
}

void bSegment(Turtle x, float dist) {
  x.setHeading(90);
  x.penUp();
  x.forward(dist/sqrt(2));
  x.setHeading(-45);
  x.penDown();
  x.forward(dist);
  x.penUp();
  x.right(180);
  x.forward(dist);
  x.setHeading(0);
}
