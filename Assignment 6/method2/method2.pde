PImage img1;
PImage img2;
PImage img3;
PImage sorted;

void setup(){
  size(1200, 600);
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
  sorted = createImage(img1.width, img1.height, RGB);
  sorted.loadPixels();
  img1.loadPixels();
  sorted = img1.get();
  
  for(int i=0; i < sorted.pixels.length; i+= 3){
    float record = -1;
    int selectedPixel =  i;
    for(int j=i; j < sorted.pixels.length; j+= 10){
    color pix = sorted.pixels[j];
    float b = hue(pix);
    
    if (b > record){
      selectedPixel = j;
      record = b;
    }
    
    color temp = sorted.pixels[i];
    sorted.pixels[i] = sorted.pixels[selectedPixel];
    sorted.pixels[selectedPixel] = temp;
    }
  }
  
  sorted.updatePixels();
  
}

void draw(){
  background(0);
  image(sorted, 0,0);
}
