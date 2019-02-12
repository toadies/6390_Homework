void reunionTower(){
 image(img, 0, 0);
 color newG = color(random(0,200),random(0,255),random(0,255));
 color newY = color(random(0,255),random(0,255),random(0,255));
 color newR = color(random(0,255),random(0,255),random(0,255));

 for(int x = 0; x < imageMap.length/4; x++){
   for( int y = 0; y < imageMap[x].length/4.9; y++){
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
  if( activateImage && rotateTower ) {
     img.updatePixels();    
  }

}
