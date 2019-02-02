float birthRate = 1;
float particleCountCurrent = 0;
int particleCount = 2000;
float boundryBottom = 300; 
float bottleFill = 50;
float[] x = new float[particleCount];
float[] y = new float[particleCount];
int[] sideCount = new int[particleCount];
float[] radius = new float[particleCount];
float[] speedX = new float[particleCount];
float[] speedY = new float[particleCount];
float[] gravity = new float[particleCount];
float[] damping = new float[particleCount];
float[] friction = new float[particleCount];

void setup(){
  size (400,400);
  for( int i = 0; i < particleCount; i += 1){
    x[i] = 125;//random(100, width-100);
    y[i] = 100;
    sideCount[i] = int(random(3, 10));
    speedX[i] = random(-.1, .1);
    speedY[i] = 0; random(-2, 2);
    radius[i] = random(1, 4); 
    gravity[i] = .09;
    damping[i] = .01;
    friction[i] = .05;
  }
}

void draw(){
  background(0);
  drawMug(100,200);
  //fill(255, 20);
  //noStroke();
  //rect(0, 0, width, height);
  for(int i = 0; i < particleCountCurrent; i += 1){
    noStroke();
    fill(255,100,0);
    ellipse(x[i], y[i], radius[i], radius[i]);
    x[i] += speedX[i];
    speedY[i] += gravity[i];
    y[i] += speedY[i];
    
    if( i > bottleFill ) {
      boundryBottom -= 1;
      bottleFill += 10;
    }
    checkCollisions(i, 100, 150, boundryBottom);
  }

  if(particleCountCurrent < particleCount - birthRate){
     particleCountCurrent += birthRate;
  }
}

void checkCollisions(int i, float boundryLeft, float boundryRight, float boundryBottom){
 if (x[i] > boundryRight - radius[i]) {
   x[i] = boundryRight - radius[i];
   speedX[i] = speedX[i] * -1; 
 }
 
 if (x[i] < boundryLeft + radius[i]) {
   x[i] = boundryLeft + radius[i];
   speedX[i] = speedX[i] * -1;
 }
 
 if (y[i] > boundryBottom - radius[i]) {
   y[i] = boundryBottom - radius[i];
   speedY[i] = speedY[i] * -1; 
   speedY[i] *= damping[i]; 
   speedX[i] *= friction[i];
 }
 
 if (y[i] < radius[i]) {
   y[i] = radius[i];
   speedY[i] = speedY[i] * -1;
 } 
}
