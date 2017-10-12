int x = 0;
int y = 0;
int siz = 5;

void setup() {
size(1000,1000);
background(0);
}

void draw() {

}

void drawImage() {
  background(0);
  while(y<height) {
    
     stroke(50,100,255);

if(random(1)>0.5){
  line(x,y,x + siz,y + siz);
} else {
line(x ,y + siz,x + siz,y);
  }
x = x + siz;
if(x >= 1000) {
  x = 0;
  y = y + siz;
} 
    
  }
  x=0;
  y=0;
}

void mousePressed() {
  drawImage(); 
}