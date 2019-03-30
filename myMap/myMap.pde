
float a = random(2,200);
float b = random(2,200);
float c = random(2,200);
float d = random(2,200);
float e = random(2,200);

float myMap(float c, float a, float b, float d, float e) {
 return (c*(e-d)) / (b-a); 
}

float mapIt = map(c,a,b,d,e);
float myOtherMap = myMap(c,a,b,d,e);

void setup() {
 size(200,200); 
 println("map: " + mapIt + " myMap: " + myOtherMap);
}

void draw() {
  
}
