int wheelRadius = 30;
int carWheelBase;
float speedVelocity = 70;

void setup(){
  size(600,300); 
  carWheelBase = (width / 3);
  print(PI);
  print(PI/2);
}

void draw(){
  background(0,100,255);
  fill(0,255,0);
  rect(0,height/3*2,width,height);
  
  //Build Car
  
  //Body
  fill(255);
  rect(carWheelBase, height-wheelRadius-150, carWheelBase, height-wheelRadius-140 );
  
  // Fender
  fill(192,192,192);
  arc(carWheelBase, height-wheelRadius-10, wheelRadius*2*1.3,wheelRadius*2*1.3, PI, PI * 2);
  arc(carWheelBase*2, height-wheelRadius-10, wheelRadius*2*1.3,wheelRadius*2*1.3, PI, PI * 2);

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
