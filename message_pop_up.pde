class message extends gameObjects{
  
    String text;
    int opacity;
    message(PVector _vel,float x,float y, String t){
       loc =new PVector(x,y);
       size = 75;
       lives = 50;
       v = _vel;
       text = t;
       roomX=mapX;
       roomY=mapY;
    }
    
    void show(){
       if(roomX==mapX){
         noStroke();
         fill(#63EAE2);
         textSize(size);
         text(text,loc.x,loc.y);
       }
       lives--;
    }
    
    void act(){
      if(roomX==mapX){
       super.act(); 
      }
    }
  
}
