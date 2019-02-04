
void drawMug(int x, int y){

  beginShape();

    fill(255);

    ellipse(x + 25,y + 100,50,10);

    rect(x,y,50,100);

    ellipse(x + 25,y,50,10);
  
  // Mug Handle
    rect(x+60,y+15,10,60, 0, 50, 50, 0);
    rect(x+50,y+15,10,10);
    rect(x+50,y+65,10,10);
 
  endShape();
}
