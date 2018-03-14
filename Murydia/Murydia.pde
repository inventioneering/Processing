// adapted from: https://www.openprocessing.org/sketch/394718
// for Processing (Java)
int num = 1000;
float vx[] = new float[num];
float vy[] = new float[num];
float x[] = new float[num];
float y[] = new float[num];
float ax[] = new float[num];
float ay[] = new float[num];

float magnetism = 10.0; //引力の強さ マイナスにすると斥力になる。
int radius = 1 ; //描画する円の半径
float gensoku = 0.95; // 粒子の移動を減速させる

void setup(){
  size(800,600);
  noStroke(); 
  fill(0);
  ellipseMode(RADIUS);
  background(0);
  blendMode(ADD);
  
  for(int i = 0; i< num; i++){
    x[i] = random(width);
    y[i] = random(height);
    vx[i] = 0;
    vy[i] = 0;
    ax[i] = 0;
    ay[i] = 0;
  }
}


void draw(){
  fill(0,0,0);
  rect(0,0,width,height);
  
  for(int i=0; i<num; i++){
    float distance = dist(mouseX, mouseY, x[i], y[i]); //dist(x1,y1,x2,y2) ２点間の距離を求める関数
    //加速度は引力の中心からの距離の二乗に反比例する。
    if(distance > 3){ //あまりマウスに近すぎる場合は加速度を更新しない
      ax[i] = magnetism * (mouseX - x[i]) / (distance * distance); 
      ay[i] = magnetism * (mouseY - y[i]) / (distance * distance);
    }
    vx[i] += ax[i]; // 1フレームあたりaxだけ速度vxを増加する。
    vy[i] += ay[i]; // 1フレームあたりayだけ速度vyを増加する.
    
    vx[i] = vx[i]*gensoku;
    vy[i] = vy[i]*gensoku;
    
    x[i] += vx[i];  // 1フレームあたりvyピクセル進ませる。
    y[i] += vy[i];  // 1フレームあたりvyピクセル進ませる。
    
    float sokudo = dist(0,0,vx[i],vy[i]); // 速度のX,Y成分から速度を求める
    float r = map(sokudo, 0, 5, 0, 255); //速度に応じた色を計算
    float g = map(sokudo, 0,5, 64, 255);
    float b = map(sokudo, 0,5, 128, 255);
    fill(r, g, b, 32);
    ellipse(x[i],y[i],radius,radius);
  }
  
}