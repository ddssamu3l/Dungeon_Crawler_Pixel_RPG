class Enemy extends gameObjects{
  int roomX;
  int roomY;
  float shotInterval;
    PImage image;
    int maxHealth;
  Enemy(int Lives, int s, int X, int Y,int lx,int ly){
       loc = new PVector (lx,ly);
     v = new PVector(0,0);
     lives = Lives;
     maxHealth = Lives;
     size=s;
     roomX=X;
     roomY=Y;
     shotInterval = random(50,100);
     image = loadImage("towerImage.png");
  }  
  
  void show(){
    if(mapX == roomX && mapY == roomY ){             // Check if the enemy is in the same room as the character before displaying enemies
      image(image,loc.x-size/2,loc.y-size/2,size,size);
       pushMatrix();
      translate(loc.x, loc.y); 
      strokeWeight(2);
      stroke(0);
      fill(red);
      rect(-maxHealth/3-17, -75, maxHealth, 8);
      fill(green);
      rect(-maxHealth/3-17, -75, lives, 8);
      popMatrix();
      print(roomX+" "+roomY);
    }
  }
  
  void act(){
    if(mapX == roomX && mapY == roomY){                // CHECK IF THE ENEMY IS IN THE SAME ROOM AS THE CHARACTER
     super.act();
     checkGameObjectsLoop();
     enemyShotFiring();
     enemyDropItem();
     if (!myCharacter.isInvincible) { // check if enemy collides with character
           print("enemy touched");
           println(roomX+" "+roomY);
           float d = dist(myCharacter.loc.x, myCharacter.loc.y, loc.x, loc.y);
           if (d<=size/2+myCharacter.size/2-25) {
            myCharacter.lives--;
            myCharacter.isInvincible=true;
          }
        }
    }
  }
  
  void enemyShotFiring(){//=======================================================================ENEMY SHOT FIRING CODE============================================================
   if(shotInterval <=0){
        myObjects.add(new enemyBullet(new PVector(myCharacter.loc.x-loc.x,myCharacter.loc.y-loc.y),loc.copy(), black,10,mapX,mapY)); 
        shotInterval = random(50,100);
     }
     shotInterval--;
     
  }
  
  void enemyDropItem(){
     if(lives <= 0 ){
        if(myCharacter.lives!=myCharacter.maxHealth){myCharacter.lives++;}
            myCharacter.xp+=10;
            myCharacter.upgradableXp+=10;
            myCharacter.myWeapon.ammoCount = myCharacter.myWeapon.ammoCount*1.2;
            myObjects.add(new Item(loc.x,loc.y, roomX, roomY));
        myObjects.add(new message(new PVector(0,-1),loc.x,loc.y-20,"+"+10+"XP"));
        myCharacter.killCount++;
     }
  }
  
  void checkGameObjectsLoop(){
   int i = 0;
     while(i<myObjects.size()){ //=============================================ENEMY DAMAGE TAKING CODE==========================================================
         gameObjects obj = myObjects.get(i);
         if(obj instanceof Bullet && !(obj instanceof enemyBullet)){
             float d = dist(obj.loc.x,obj.loc.y,loc.x,loc.y);
             if(d<=size/2+obj.size/2){
                lives = lives-obj.damage;
                obj.lives = 0;
              }     
           }
           
           
      i++;
     } 
  }
}
