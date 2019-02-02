void drawMug(int x, int y){

  beginShape();
    fill(255);
    ellipse(x + 25,y + 100,50,10);
    rect(x,y,50,100);
    ellipse(x + 25,y,50,10);
  endShape();
}
