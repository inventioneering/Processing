float drawLine(float i) {
  rectMode(CENTER);
   rect(midX, baseline, i, 2);
   fill(0);
   i = i+1.1;
   return i;
}

float drawTriangle(float i) {
  
   float baseWidth = 40;
   fill(255);
   
   float x1 = midX - baseWidth;
   float x2 = midX + baseWidth;
   float x3 = midX;
   float y1 = baseline;
   float y2 = y1;
   float y3 = i; 
   
   triangle(x1, y1, x2, y2, x3, y3);
  
  i = i - 1;
  return i;
}
