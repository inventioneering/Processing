// create new integer array
int [] randomCounts;

void setup() {
  size(640, 360);
  // make room for 20 things inside the array
  randomCounts = new int[20];
}

void draw() {
  background(255);
 
  // make a new variable 
  int index = int(random(randomCounts.length));
  
  randomCounts[index]++;
  
  stroke(0);
  fill(175);
  
  int w = width/randomCounts.length;
  
  for (int x = 0; x < randomCounts.length; x++) {
   rect(x*w, height-randomCounts[x],w-1,randomCounts[x]); 
  }
  
  
}
