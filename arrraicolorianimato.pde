PImage img;
PImage img2;
int indice=0;
void setup() {
  frameRate=300;
  size (800, 400);
  img = loadImage("mac.jpg");
  img2=img.get();
}
  void draw() {
    println(frameRate);
    img2.loadPixels();
    
    for (int n=0; n<10; n++) {
      float max=-1;
      int scelto = indice;
      for (int j=indice; j<img2.pixels.length; j++) {
        color pix=img2.pixels[j];
        float luce=brightness(pix);
        if (luce>max) {
          scelto=j;
          max=luce;
        }
      }
      color temporaneo = img2.pixels[indice];
      img2.pixels[indice]=img2.pixels[scelto];
      img2.pixels[scelto]=temporaneo;
      if (indice<img2.pixels.length -1){indice++;}
      }
    
    img2.updatePixels();
  

  background(0);
  image(img, 0, 0);
  image(img2, 400, 0);
}
