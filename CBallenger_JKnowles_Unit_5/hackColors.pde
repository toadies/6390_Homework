void hackColors(int colorId){

  for(int x = 0; x < imageMap.length; x++){
    for( int y = 0; y < imageMap[x].length; y++){
      int loc = x + y*img.width;
      if(imageMap[x][y] == colorId ){
        img.pixels[loc] = color(0);
      }
    }
  }
  if( activateImage ){
    img.updatePixels(); 
  }
}
