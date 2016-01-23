ArrayList<Pulsar> pulsars = new ArrayList<Pulsar>();
color randomColor;
float randomRadius;
int lastPulsar;
float maxRadius;
float minRadius = 2;

void setup()
{
  size(500,500);
  maxRadius = width/3;
  background(255);
}

void draw()
{
   background(255);
   for(int i = 0; i< pulsars.size(); i++)
   {
   pulsars.get(i).display();
   pulsars.get(i).pulse();
   //pulsars.get(i).shrink();
   }

}

void mousePressed()
{
  randomColor = color(random(255),random(255),random(255));
  randomRadius = random(2,maxRadius);
  
  pulsars.add(new Pulsar(mouseX,mouseY,randomColor, randomRadius));
  
  lastPulsar = pulsars.size()-1;
  
  pulsars.get(lastPulsar).display();
 // pulsars.get(lastPulsar).pulse();
  pulsars.get(lastPulsar).shrink();
  
}


class Pulsar
{
  // data
  color c;
  float radius;
  float changingRadius;
  float xPos;
  float yPos;
  int isGrowing = 1;
  
  // constructor
  Pulsar(float _xPos, float _yPos, color _c, float _radius) {
    c = _c;
    radius = _radius;
    xPos = _xPos;
    yPos = _yPos;
    changingRadius = radius;
    }
  
  // methods
  void display()
  {
   noStroke();
   fill(c);
   ellipseMode(CENTER);
   ellipse(xPos,yPos,changingRadius,changingRadius);
   //println("display");
  }
 
  void grow()
  {
    changingRadius++;
  }
  
  void shrink()
  {
    changingRadius--;
    //println("secondRadius" + changingRadius);
  }
  
  void pulse()
  {
    if(changingRadius < maxRadius && isGrowing == 1)
    {
      changingRadius++;
     // println("growing");
    }
    
    if(changingRadius >= maxRadius)
    {
      isGrowing = 0; 
      //println("max value");
    }
    
    if(changingRadius > minRadius && isGrowing == 0)
    {
      changingRadius--; 
      //println("shrinking");
    }
    
    if(changingRadius <= minRadius)
    {
      isGrowing = 1; 
      //println("min value");
    }
  }
  
}