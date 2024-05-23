void click(){
   mouseReleased=false;
   if(mousePressed) hadPressed=true;
   if(hadPressed&&!mousePressed){
      mouseReleased=true;
      hadPressed=false;
   }
}
