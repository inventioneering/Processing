int param = 25;

void setup() {
  // make canvas 480px by 480px
  size(480,480);
}


void draw() {
  //background(255);

  if(mousePressed == true) {
    ellipse(width/2, height/2, param, param);
    param++;
  } 
  //additonal space so it easier to follow 
  else {
    param = 25;
    ellipse(width/2, height/2, param, param);
  }

}
