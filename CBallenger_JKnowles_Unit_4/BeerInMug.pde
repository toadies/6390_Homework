

void drawBeerInMug(float x, int y, float boundryBottom){
  beginShape();
    // Beer Color
    fill(139,69,19);
    // Beer
    ellipse(125,297, 43,10);
    rect(103, boundryBottom, 43, y - boundryBottom);
;
}
