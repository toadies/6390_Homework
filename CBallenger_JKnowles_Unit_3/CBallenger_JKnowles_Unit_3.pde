int wheelRadius = 30;
int carWheelBase;
float speedVelocity = 70;

void setup(){
  size(600,300); 
  carWheelBase = (width / 3);
}

void draw(){
  background(255);
  
  
  
  // Front Wheel
  pushMatrix();
    translate(carWheelBase, height-wheelRadius-10);
    rotate(-frameCount / speedVelocity);
    drawWheel(0,0,wheelRadius);
  popMatrix();
  
  // Backwheel
  pushMatrix();
    translate(carWheelBase*2, height-wheelRadius-10);
    rotate(-frameCount / speedVelocity);
    drawWheel(0,0,wheelRadius);
  popMatrix();
}
