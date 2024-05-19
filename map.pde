void drawMap(){
 //image(mapImage,100,100,125,125);
 noStroke();
 int x = 50;
  int y =50;
  int mx  = 0;
  int my = 0;
 while(my<=mapImage.height-1){
    color c = mapImage.get(mx,my);
    fill(c);
    if(mapX == mx && mapY == my) // MARKS THE CURRENT LOCATION OF THE CHARACTER IN THE MAP. mapX and mapY represents the current room location that the character is in.
      fill(black); // When drawing the map on the screen, if the current pixel being drawn is equal to the room location that the character is in, highlight as black.
    square(x,y,10);
    x+=10;
    mx+=1;
    if(mx>=mapImage.width){
      mx=0;
      y+=10;
      x=50;
      my++;
    }
 }
}
