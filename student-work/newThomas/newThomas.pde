Ball[] balls = new Ball[200]; // make a new array with 200 slots, or shelves
ArrayList<Ball> balls2 = new ArrayList<Ball>(); // make a new ArrayList with no "shelves"


void setup() {
  // fill up the array named "balls"
  for(int i = 0; i< 50; i++) {
    balls[i] = new Ball(400,200,2);
  }
  
  for(int i = 50; i< 100; i++) {
    balls[i] = new Ball(800,200,2);
  }
  
  for(int i = 100; i< 150; i++) {
    balls[i] = new Ball(800,800,2);
  }
  
  for(int i = 150; i< 200; i++) {
    balls[i] = new Ball(400,800,2);
  }
  
  // fill up the ArrayList named "balls2"
  for(int i = 0; i < 50; i++) {
    balls2.add(new Ball(400,200,2));
    balls2.add(new Ball(800,200,2));
    balls2.add(new Ball(800,800,2));
    balls2.add(new Ball(400,800,2));
  }

  size(1200,900);
  background(0);
  smooth();
  
  println(balls);
  
}

void draw() {
  for(int i = 0; i<balls2.size(); i++) {
   balls2.get(i).update();
   balls2.get(i).display();
  }
  //for(int i = 0; i<balls.length; i++) {
  //  balls[i].update();
  //  balls[i].display();
  //}
  
  //for (Ball b : balls) {
  //  b.update();
  //  b.display();
  //}
}

class Ball {
  PVector position;
  PVector velocity;
  
  float radius, m;
  
  Ball(float x, float y, float r_) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    velocity.mult(2);
    radius = r_;
    m = radius*.1;
  }

  void update() {
    position.add(velocity);
  }
  
  void display() {
    noStroke();
    fill(204);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
}