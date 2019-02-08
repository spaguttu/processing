PImage img;
PImage img2;
void setup() {
  size (800, 270);
  img = loadImage("bas.jpg");
  img2=img.get();
  img2.loadPixels();
  for (int i=0; i<img2.pixels.length; i++) {
    float max=-1;
    int scelto = i;
    for (int j=i; j<img2.pixels.length; j++) {
      color pix=img2.pixels[j];
      float luce=brightness(pix);
      if (luce>max) {
        scelto=j;
        max=luce;
      }
    }
    color temporaneo = img2.pixels[i];
    img2.pixels[i]=img2.pixels[scelto];
    img2.pixels[scelto]=temporaneo;
  }
  img2.updatePixels();
}

void draw() {
  background(0);
  image(img, 0, 0);
  image(img2, 400, 0);
}
