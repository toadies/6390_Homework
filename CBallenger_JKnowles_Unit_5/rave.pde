void rave(){
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
  
  if( activateImage && createRave ){
    img.updatePixels(); 
  }
}
