PImage img;

void setup() {
  img = loadImage("Ducky.jpg");
  size(600, 600);
}

void draw() {
  img.loadPixels();
  insertionSort(img.pixels, 0, img.pixels.length -1);
  img.updatePixels();
  image(img, 0, 0, width, height);
}

/*
  Implementation of insertion sort.
 Takes in an array of colors and orders them by brightness.
 Takes the left and right index of the array to sort by.
 */
void insertionSort(color Arr[], int l, int r) {
  if (l < 0 || r >= Arr.length || l > r) {
    print("Left or Right index out of bounds");
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
