PImage img;
color pixels_2d[][]; // 
int n;
void setup() {
  img = loadImage("pumpkinface.jpg");
  pixels_2d = new color[img.width][img.height];
  n = img.pixels.length;
  size(600, 600);
}
void draw() {
  
  img.loadPixels();  
  convertPixelArr(img, pixels_2d); // Populate the 2d array with the 1d pixels array
  
  insertionSort(img.pixels, 0, n -1);
  img.updatePixels();
  image(img, 0, 0, width, height);
  
}

/*
  Takes an image and a 2d array and populates the 2d
  array with the 1d pixel values.
*/
void convertPixelArr(PImage img, color colorArrTwoD[][]){
  color p[] = img.pixels;
  for(int x = 0; x < img.width; x++){
    for(int y = 0; y < img.height; y++){
      int index = x + y * img.width;
      colorArrTwoD[x][y] = p[index];
    }
  }
}

/*
  Implementation of insertion sort.
 Takes in an array of colors and orders them by brightness.
 Takes the left and right index of the array to sort by.
 */
void insertionSort(color Arr[][], int lx,int ly, int rx, int ry) {
  if (l < 0 || r >= Arr.length || l > r) {
    println("Left or Right index out of bounds");
    return;
  }

  for (int i = l + 1; i <= r; i ++) {
    color tmp = Arr[i];
    int j = i - 1;

    while (j >= 0 && brightness(tmp) < brightness(Arr[j])) {
      Arr[j + 1] = Arr[j];
      j -= 1;
    }
    Arr[j + 1] = tmp;
  }
}
