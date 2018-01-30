void setup() 
{
 size(800,600);  // make canvas 400 x 400 pixels
 strokeWeight(5); // change line thickness
 smooth(8); // make curves more smooth
}


void draw() {
 
  fill(255,0,255); // pink
  rect(40,40,50,50); // make rectangle
  
  fill(255,0,0);  // red
  rect(200,200,100,100); // make rectangle
  
  // vertical lines
  line(10,0,10,height);  
  line(50,0,50,height);
  line(200,0,200,height);
  line(400,0,400,height);
  line(700,0,700,height);
  
  // horizontal lines
  line(0,10,width,10);
  line(0,50,width,50);
}