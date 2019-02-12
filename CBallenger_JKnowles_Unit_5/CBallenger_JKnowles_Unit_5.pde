//Controls
int hackGreenX, hackGreenY;
int hackYellowX, hackYellowY;
int hackRedX, hackRedY;
int createRaveX, createRaveY;
int rotateTowerX, rotateTowerY;
int buttonSize = 20;
boolean hackGreen = false;
boolean hackYellow = false;
boolean hackRed = false;
boolean createRave = false;
boolean rotateTower = false;
boolean buttonOver = false;
boolean activateImage = false;

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
  size(canvasWidth + 100, canvasHeight); 
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

 
  //Buttons
  hackGreenX = canvasWidth + 5;
  hackGreenY = 10;
  hackYellowX = hackGreenX + buttonSize + 5;
  hackYellowY = hackGreenY;
  hackRedX = hackYellowX + buttonSize + 5;
  hackRedY = hackYellowY;
  createRaveX = canvasWidth + 5;
  createRaveY = hackGreenY + buttonSize + 5;
  rotateTowerX = createRaveX + buttonSize + 5;
  rotateTowerY = createRaveY;
  //int hackYellowX, hackYellowY;
  //int hackRedX, hackRedY;
  fill(0,255,0);
  rect(hackGreenX, hackGreenY, buttonSize, buttonSize);
  fill(255,255,0);
  rect(hackYellowX, hackYellowY, buttonSize, buttonSize);
  fill(255,0,0);
  rect(hackRedX, hackRedY, buttonSize, buttonSize);
  fill(255);
  rect(createRaveX, createRaveY, buttonSize, buttonSize);
  fill(0,0,255);
  rect(rotateTowerX, rotateTowerY, buttonSize, buttonSize);
  noFill();
} 

void draw() {
    image(img, 0, 0);
  
  //update(mouseX, mouseY);
  
  if (hackGreen) {
    hackColors(2);
  }
  if (hackYellow) {
    hackColors(1);
  }
  if (hackRed) {
    hackColors(3); 
  }
  if (createRave) {
    rave();
  } else if (rotateTower) {
    reunionTower();
  }
}

void mousePressed() {
  // Green
  if ( overButton(hackGreenX, hackGreenY, buttonSize) ) {
    hackGreen = !hackGreen;
    activateImage = true;
  } else if ( overButton(hackYellowX, hackYellowY, buttonSize) ) {
    hackYellow = !hackYellow;
    activateImage = true;
  } else if ( overButton(hackRedX, hackRedY, buttonSize) ) {
    hackRed = !hackRed;
    activateImage = true;
  } else if ( overButton( createRaveX, createRaveY, buttonSize) ) {
    createRave = !createRave;
    rotateTower = false;
    activateImage = true;
  } else if ( overButton( rotateTowerX, rotateTowerY, buttonSize) ) {
    rotateTower = !rotateTower;
    createRave = false;
    activateImage = true;
  } else {
    activateImage = false;
  }
}

boolean overButton(int x, int y, int size)  {
  if (mouseX >= x && mouseX <= x+size && 
      mouseY >= y && mouseY <= y+size) {
    return true;
  } else {
    return false;
  }
}
