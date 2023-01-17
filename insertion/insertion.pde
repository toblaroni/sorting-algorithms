PImage img;
int n;
void setup() {
  img = loadImage("wrinklecat.jpg");
  n = img.pixels.length;
  size(453, 553);
}

void draw() {
  println(img.width, img.height);
  noLoop();
  int mx = mouseX ;
  int my = mouseY;
  img.loadPixels();
  int w = 500;
  insertionPixelSort(img, w, w, img.width - w * 2, img.height - w * 2);
  println(mx, my);


  img.updatePixels();
  image(img, 0, 0, width, height);
}

/*
  Takes an image and a 2d array and populates the 2d
 array with the 1d pixel values.
 */
void convert2D(PImage img, color pixel2d[][]) {
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int index = x + y * img.width;
      pixel2d[x][y] = img.pixels[index];
    }
  }
}

/* Converts back into 1d array.
 */
void convert1D(PImage img, color pixel2d[][]) {
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y ++) {
      img.pixels[x + y * img.width] = pixel2d[x][y];
    }
  }
}

/*
  Implementation of insertion sort.
 Takes in an array of colors and orders them by brightness.
 Takes the left and right index of the array to sort by.
 */
 
 // Change bx and by to width and height
void insertionPixelSort(PImage img, int tx, int ty, int w, int h) {
  color Arr[][] = new color[img.width][img.height];
  
  // Convert the PImage pixel array to a 2d array.
  convert2D(img, Arr);
  
  // Sort the 2D array by row.
  for (int y = ty; y < ty + h; y++) {
    for (int x = tx; x < tx + w; x++) {


      color tmp = Arr[x][y];
      int j = x - 1;

      while (j >= tx && brightness(tmp) > brightness(Arr[j][y])) {
        Arr[j + 1][y] = Arr[j][y];
        j -= 1;
      }
      Arr[j + 1][y] = tmp;
    }
  }
  
  // Update the PImage's pixel array
  convert1D(img, Arr);
}
