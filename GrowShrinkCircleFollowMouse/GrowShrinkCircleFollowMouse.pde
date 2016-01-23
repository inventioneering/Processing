int param = 25;

void setup() {
  // make canvas 480px by 480px
  size(480,480);
  frameRate(60);
}


void draw() {
  background(255);

    if(mousePressed == true) {
     ellipse(mouseX, mouseY, param, param);
     param++;
    } else {
      if(param > 25)
      {
       background(255);
       param--;
       ellipse(mouseX, mouseY, param, param);
      } else if(param == 25)
      {
        ellipse(mouseX, mouseY, param, param);
      }
     
    }

}