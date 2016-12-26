PImage img;
PImage sorted;
int index =  0;
void setup() {
  //size(800 , 400);
  size(200 , 100);
  //img = loadImage("../Data/sunflower400.jpg");
  img = loadImage("../Data/1.png");
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
   println(frameRate);
    for (int n =0; n < 100000; n++) {
      //Selection sort!
      float record= -1;
      int selectedPixel=index;
      for (int j = index; j < sorted.pixels.length; j++) {
        color pix = sorted.pixels[j];
        float b = brightness(pix);
        //float b = hue(pix);
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
    }
    
    sorted.updatePixels();

  background (0);
  image(img, 0, 0); //img before
  //image(sorted, 400, 0); //img after
  image(sorted,100, 0); //img after

}