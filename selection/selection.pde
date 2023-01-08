PImage img;

void setup() {
  img = loadImage("Ducky.jpg");
  size(600, 600);
}


void draw() {
  image(img, 0, 0, width, height);
  img.loadPixels();
  selectionSort(img.pixels, 0, img.pixels.length / 2);
  img.updatePixels();
}

/*
  Implentation of selection sort.
 Takes an array of colors, left index and right index.
 Sorts array by brightness of colors.
 */
void selectionSort(color Arr[], int l, int r) {
  if (l < 0 || r >= Arr.length || l > r) print("Incorrect parameters");

  for (int i = l; i < r; i ++) {
    float min = brightness(Arr[i]);
    int minIndex = i; // Store the index so we don't have to work out the brightness everytime
    for (int j = i + 1; j <= r; j ++)
      // Find the index of the pixel with the lowest brightness
      if (brightness(Arr[j]) < min)
        minIndex = j;

    // If the minIndex has changed then swap the values.
    if (minIndex != i) {
      color tmp = Arr[i];
      Arr[i] = Arr[minIndex];
      Arr[minIndex] = tmp;
    }
  }
}
