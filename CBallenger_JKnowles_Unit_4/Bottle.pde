void drawBottle(int x, int y){
  beginShape();

    // Bottle Color
      fill(#8B6E1E);
    // Base of bottle
      ellipse(x - 75,y, 10,30);
    // Body of bottle
      rect(x - 75,y-15,50,30);
    // Shoulders of bottle
      ellipse(x - 25,y,10,30);
    // Bottle Neck
      rect(x - 30,y-8,50,15);
    // Bottle Mouth
      ellipse(x + 20,y, 10,15);

  endShape();
}
