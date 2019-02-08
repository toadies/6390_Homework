PImage img; 
int canvasWidth = 0;
int canvasHeight = 0;
int imageMap[][];

void settings()
{
  img = loadImage("untitled-7.jpg");
  img.resize(img.width/2,0);
  canvasWidth = int(img.width);
  canvasHeight = int(img.height);
  size(canvasWidth, canvasHeight); 
}

void setup() { 
  println(canvasWidth);
  println(canvasHeight);
  
  imageMap = new int[canvasWidth][canvasHeight];

  img.loadPixels();
  for (int x = 0; x < canvasWidth; x++) {
    for (int y = 0; y < canvasHeight; y++ ) {
      int loc = x + y*img.width;
      float r = red (img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      //Trap Yellow Lights
      if( g > 120 && r > 100  ){
        imageMap[x][y] = 1;
      }
      //Trap Greens
      else if( g > 160 & b < 200 & r < 200 ){
        imageMap[x][y] = 2;
      }
      //Trap Reds
      else if( r > 100){
        imageMap[x][y] = 3; 
      }
      else{
       imageMap[x][y] = 0;
      }
    }
  }

 
} 

void draw(){
  image(img, 0, 0);
  
  color newG = color(random(0,255),0,random(0,255));
  color newY = color(random(0,255),0,random(0,255));
  color newR = color(0,random(0,255),random(0,255));
  
  for(int x = 0; x < imageMap.length; x++){
    for( int y = 0; y < imageMap[x].length; y++){
      int loc = x + y*img.width;
      if(imageMap[x][y] == 1 ){
        img.pixels[loc] = newY;
      }
      else if( imageMap[x][y] == 2 ){
       img.pixels[loc] = newG;
      }
      else if( imageMap[x][y] == 3 ){
       img.pixels[loc] = newR;
      }
    }
  }
  img.updatePixels();
}
