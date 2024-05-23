void keyPressed(){
  if(mode == game){
   if(keyCode == 'w' || keyCode == 'W') up = true;
   if(keyCode == 's'|| keyCode == 'S') down = true;
   if(keyCode == 'a'|| keyCode == 'A') left = true;
   if(keyCode == 'd'|| keyCode == 'D') right = true;
   if(keyCode == ' ') space = true;
  }
   if((keyCode == 'p' || keyCode == 'P')&& mode == game)mode = pause;
   else if((keyCode == 'p' || keyCode == 'P')&& mode == pause)mode = game;
}

void keyReleased(){
  if(mode == game){
    if(keyCode == 'w'|| keyCode == 'W') up = false;
   if(keyCode == 's'|| keyCode == 'S') down = false;
   if(keyCode == 'a'|| keyCode == 'A') left = false;
   if(keyCode == 'd'|| keyCode == 'D') right = false;
  }
   if(keyCode == ' ') space = false;
}

void mousePressed(){
  if(mode == start){
    mode = game;}
   else if(mode == end || mode == win){
      setup();
   }
}

void mouseReleased(){
  
}
