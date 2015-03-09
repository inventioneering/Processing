PImage img;

void setup() {
  img = loadImage("Logo.png");
  size(1000,1000);
}

void draw() {
  image(img, 0, 0);
}
