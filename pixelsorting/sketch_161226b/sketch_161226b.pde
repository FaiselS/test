PImage img;
PImage sorted;
int index =  0;
void setup() {
  size(400 , 200);
  img = loadImage("../Data/sunflower.jpg");
  sorted = createImage(img.width, img.height, RGB);
  sorted.loadPixels();
  //img.loadPixels();
  //for (int i = 0; i < sorted.pixels.length; i++) {
  //  sorted.pixels[i] = img.pixels[i];
  //}
  sorted=img.get();
  sorted.loadPixels();
}

void draw() {
  
    //Selection sort!
    float record= -1;
    int selectedPixel=index;
    for (int j = index; j < sorted.pixels.length; j++) {
      color pix = sorted.pixels[j];
      //float b = brightness(pix);
      float b = hue(pix);
      if (b > record){
        selectedPixel = j;
        record = b;
      }
    
    // swap selectedPixel with i
    color temp = sorted.pixels[index];
    sorted.pixels[index] = sorted.pixels[selectedPixel];
    sorted.pixels[selectedPixel] = temp;
    }

    if (index < sorted.pixels.length - 1) {
      index++;
    }
    
    sorted.updatePixels();

  background (0);
  image(img, 0, 0); //img before
  image(sorted, 200, 0); //img after

}