
void setup() {
  size(500, 200);  
  background(255);
 
}

void draw() {
  int buffer = 10;
  int vPos = 180;
  int len = width - buffer;
  
  // first line
  line(buffer,vPos,len,vPos);
   
  // "line" with middle 1/3 removed
  line(buffer,vPos-10,buffer+len/3,vPos-10);
  line(buffer+2*len/3,vPos-10,len, vPos-10);
  
  // triangle height
  float tHeight = len/6*sqrt(3);
  
  // Middle equilateral trinalge drawn
  line(buffer+len/3,vPos-10, width/2, vPos-10-tHeight);
  line(width/2, vPos-10-tHeight, len-len/3+buffer, vPos-10);
  
  
  
 
}