class Follower extends Enemy{

    Follower(int l, int s,int x , int y,int lx, int ly){
       super(l,s,x,y,lx,ly); 
       image = loadImage("virusImage.png");
    }
    
    void show(){
      if(mapX == roomX && mapY == roomY){
       image(image,loc.x-size/2, loc.y-size/2,size,size);
        pushMatrix();
      translate(loc.x, loc.y); 
      strokeWeight(2);
      stroke(0);
      fill(red);
      rect(-maxHealth/3-17, -75, maxHealth, 8);
      fill(green);
      rect(-maxHealth/3-17, -75, lives, 8);
      popMatrix();
      }
    }
    
    void act(){
      if(mapX == roomX && mapY == roomY){
       super.act();
       v=new PVector (myCharacter.loc.x-loc.x,myCharacter.loc.y-loc.y);
       v.setMag(1);
      }
    }
  
}
