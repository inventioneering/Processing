/* These are my alterations of the "Objects" tutorial examples from 
*  https://processing.org/tutorials/objects/
* 
*  You will see my notes below about the changes I made
*
*/


// I decided to add an ArrayList of Car objects instead of creating
// individual Car objects with names like:
// Car myCar1;
// Car myCar2;

// You can read more about ArrayList and why its an awesome data type
// here: https://processing.org/reference/ArrayList.html

ArrayList<Car> cars = new ArrayList<Car>();

// I created these variables to make it easier to read the below when I 
// create a new Car object every time the user clicks the mouse.  Remember, mouseClicked
// only occurs when the user lets go of the mouse press, compared to mousePressed which
// will continue to repeat until the user lets the mouse button go
color randomColor;
int randomSpeed = 1;
int carCounter = 2;
int lastCar;

void setup()
{
 size(200,200);
 // See notes above, I removed these when I decided to organize my cars in an ArrayList
 //myCar1 = new Car(color(255,0,0),0,100,2);
 //myCar2 = new Car(color(0,0,255),0,10,1);
 
 // create two new Car objects and put them in the ArrayList named cars
 cars.add(new Car(color(255,0,0),0,100,2));
 cars.add(new Car(color(0,0,255),0,10,1));
}

void draw()
{
  background(255);
  
  // These are from the first version, before the ArrayList was created
  //myCar1.drive();
  //myCar1.display();
  //myCar2.drive();
  //myCar2.display();
  
  
  // Make sure the car objects are shown each time through the void draw() loop 
  for(int i = 0; i< cars.size(); i++)
  {
  cars.get(i).drive();
  cars.get(i).display();
  }
  
}

// Every time the user clicks (press & release) the mouse button, a new car object is 
// instatiated, and drawn on screen.  The speed and color attributes are chosen at random
// and the posotion is based on where the user clicks.

void mouseClicked()
{
    randomColor = color(random(0,255), random(0,255), random(0,255));
    randomSpeed = int(random(1,6));
    
    // create a new car and add it to the cars ArrayList
    cars.add(new Car(randomColor, mouseX, mouseY, randomSpeed));
    
    // find the index number of the last car in the cars ArrayList.
    // this should always be: 
    // the number of items in list - 1 with a 0-indexed list. 
    lastCar = cars.size() - 1;
    
    // show the last car you just made
    cars.get(lastCar).drive();
    cars.get(lastCar).display();
}

class Car
{
 // car data
 color c;
 float xpos;
 float ypos;
 float xspeed;
 
 // constructor
 Car(color tempC, float tempXpos, float tempYpos, float tempXspeed)
 {
  // pass values from instantiation into the car itself.  Basicially it just 
  // allows each particular car object access to its data.  
  // the methods below won't be able to use these temporary variables like
  // tempC and tempXpos, rather, it can only use items declared above in the
  // car data section.
  c = tempC;
  xpos = tempXpos;
  ypos = tempYpos;
  xspeed = tempXspeed;
 }
 
 // methods
 // These are "functions" you can use on any object of the Car class.  They are used
 // above in both void draw() and void mousePressed() in "dot" syntax i.e.  myCar.display();
 void display()
 {
  stroke(0);
  fill(c);
  rectMode(CENTER);
  rect(xpos,ypos,20,10);
 }
 
 void drive()
 {
  xpos = xpos + xspeed;
  if (xpos > width)
  {
   xpos = 0; 
  }
 }
}