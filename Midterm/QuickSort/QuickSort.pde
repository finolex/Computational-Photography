PImage img1;
int xWidth = 1919;
int xHeight = 10;
PImage img2 = createImage(xWidth, xHeight, RGB);
PImage totalImage = createImage(480, 270, RGB);
PImage sorted;

void setup(){
  size(960, 270);
  int[] totalArray = new int[0];
  //img1 = loadImage("img1.jpg");
  //img1 = loadImage("img2.jpg");
  //img1 = loadImage("img3.jpg");
  //img1 = loadImage("img4.jpg");
  //img1 = loadImage("img5.jpg");
  img1 = loadImage("img6.jpg");
  
  img1.loadPixels(); 
  img2.loadPixels();
  totalImage.loadPixels();

  for (int i =0; i < 27; i++){
    img2.pixels = subset(img1.pixels, (480 * (i*10)), (480*10));
    println(img2.pixels.length);
    img2.pixels = quickSort(img2.pixels);
    totalArray = concat(totalArray, img2.pixels);
    println(totalArray.length);
  }
  
  totalImage.pixels = totalArray;
  
  img1.updatePixels();
  totalImage.updatePixels();
}

void draw(){
  background(0);
  image(img1, 0,0);
  image(totalImage, 480,0);
}

int[] quickSort(int[] data) {
  int lenD = data.length;
  int pivot = 0;
  int ind = lenD/2;
  int i, j = 0, k = 0;
  if (lenD<2) {
    return data;
  } else {
    int[] L = new int[lenD];
    int[] R = new int[lenD];
    int[] sorted = new int[lenD];
    pivot = data[ind];
    for (i=0;i<lenD;i++) {
      if (i!=ind) {
        if (data[i]<pivot) {
          L[j] = data[i];
          j++;
        }
        else {
          R[k] = data[i];
          k++;
        }
      }
    }
    int[] sortedL = new int[j];
    int[] sortedR = new int[k];
    arraycopy(L, 0, sortedL, 0, j);
    arraycopy(R, 0, sortedR, 0, k);
    sortedL = quickSort(sortedL);
    sortedR = quickSort(sortedR);
    arraycopy(sortedL, 0, sorted, 0, j);
    sorted[j] = pivot;
    arraycopy(sortedR, 0, sorted, j+1, k);
    return sorted;
  }
}

//class QuickSort 
//{ 
//    int partition(int array[], int low, int high) 
//    { 
//        int pivot = array[high];  
//        int i = (low-1); // index of smaller element 
//        for (int j=low; j<high; j++) 
//        { 
//            if (array[j] <= pivot) 
//            { 
//                i++; 
  
//                // swap arr[i] and arr[j] 
//                int temp = array[i]; 
//                array[i] = array[j]; 
//                array[j] = temp; 
//            } 
//        } 
  
//        // swap arr[i+1] and arr[high] (or pivot) 
//        int temp = array[i+1]; 
//        array[i+1] = array[high]; 
//        array[high] = temp; 
  
//        return i+1; 
//    } 
  
  
//    void sort(int array[], int low, int high) 
//    { 
//        if (low < high) 
//        { 
//            int pi = partition(array, low, high); 
  
//            sort(array, low, pi-1); 
//            sort(array, pi+1, high); 
//        } 
//    }
//} 
