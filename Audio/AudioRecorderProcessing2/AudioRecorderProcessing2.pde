import ddf.minim.*;

Minim minim;

AudioInput mic;
AudioRecorder left;
AudioRecorder right;
AudioSample Pright;
AudioSample Pleft;

void setup ()
{
 size(800,900);
 
 minim = new Minim(this);
 
 mic = minim.getLineIn();
 
 
 left = minim.createRecorder(mic,"data/left.wav");
 right = minim.createRecorder(mic,"data/right.wav");
  
}

void draw()
{
  
}

void keyPressed()
{
  
 // record stop/save controls for left sample
 if(keyCode == LEFT)
 {
   if(left.isRecording())
   {
     left.endRecord();
     left.save();
   }
 
 else
 {
   left.beginRecord();
 }
}

// record stop.save controls for the right sample
if(keyCode == RIGHT)
{
  if(right.isRecording())
  {
    right.endRecord();
    right.save();
  }
  
  else
  {
    right.beginRecord();
  }
}

// play the right sample
if(keyCode == UP)
{
  Pright = minim.loadSample("right.wav");
  Pright.trigger();
}

// play the left sample
if(keyCode == DOWN)
{
  Pleft = minim.loadSample("left.wav");
  Pleft.trigger();
}

 
}
