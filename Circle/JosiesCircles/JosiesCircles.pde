void setup() {
 size(360,360); 
}

void draw() {
 background(0);
 int radius = width/2;

 fill(255,255,255);
 ellipse(width/2,height/2, radius, radius);
 fill(255,0,0);
 ellipse(width/2,height/2,radius-25,radius-25);
 fill(0,255,0);
 ellipse(width/2,height/2,radius-50,radius-50);
 fill(255,20,147);
 ellipse(width/2,height/2,radius-75,radius-75);
 fill(255,140,0);
 ellipse(width/2,height/2,radius-100,radius-100);
}