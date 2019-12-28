// https://twitter.com/Hau_kun/status/1210295522881236992

float t;int i,j;
void setup(){size(720,720,P3D);}
void draw(){
clear();
t+=.04;
for(j=1;j<5;j++)
for(i=0;i<441;i++){
fill(255-(j-t%1)*60);
if(noise(i,(int)t+j)>.4||i==220)continue;
resetMatrix();
translate(i%21*40-400,i/21*40-400,-200*j+t%1*200);
box(40);
}
}
