import processing.video.*;
 
// Schnittstelle zur Kamera
Capture cam;
 
// Speicher fÃ¼r die Einzelbilder aus 
// der 'Vergangenheit'
PImage[] buffer;
 
// Anzahl der Einzelbilder pro 
// Sekunde fÃ¼r Sketch und Aufnahme 
int fps = 21;
 
// ZeitverzÃ¶gerung in Sekunden
int lagSeconds = 2;
 
// Abspielposition und damit SchlÃ¼ssel
// fÃ¼r das EinfÃ¼gen/Auslesen aus dem Buffer
int index = 0;
 
// Status ob der Bildspeicher schon 
// einmalig komplett gefÃ¼llt wurde
boolean filled = false;
 
// Anzahl der Spalten im Sketchfenster
int cols = 6;
 
void setup () {
  size (318, 278);
  frameRate (fps);
  cam    = new Capture (this, 320, 240, 20);
  buffer = new PImage[lagSeconds * fps];
}
 
void draw () {   
  // BildgrÃ¶ÃŸe fÃ¼r Raster ermitteln
  float imgWidth = width / cols;
  float aspect = imgWidth / cam.width;
  float imgHeight = cam.height * aspect;
 
  // FÃ¼r jedes Feld im 'Bildspeicher'
  for (int i=0; i < buffer.length; i++) {
    // Wenn ein Bild existiert
    if (buffer[i] != null) {
      // Berechne die Position im Raster
      float x = (i % cols) * imgWidth;
      float y = floor (i / cols) * imgHeight;
 
      image (buffer[i], x, y, imgWidth, imgHeight);
    }
  }
}
 
void captureEvent (Capture theCam) {
  // Lies das aktuelle Kamerabild aus
  theCam.read ();
  // Speicher eine Kopie im Buffer an 
  // der Position des Bildes welches 
  // gerade ausgelesen wurde
  buffer[index] = theCam.get ();
  // ErhÃ¶he die Position fÃ¼r das Auslesen
  // um eins, auf das Ã¤lteste Bild im Buffer
  index++;
 
  // Wenn am Ende des Buffers angekommen,
  // springe wieder an den Anfang.
  if (index >= buffer.length) {
    index = 0;
    if (!filled) {
      filled = true;
    }
  }
}