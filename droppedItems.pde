class Item extends gameObjects {

  int itemType;
  Weapon w;
  PImage itemImage;
  int imageSize;

  Item(float x, float y, int rx, int ry) {
    roomX = rx;
    roomY = ry;
    loc = new PVector(x, y);
    v = new PVector(0, 0);
    c = yellow;
    size =50;
    itemType = (int)random(0, 5);
    lives = 1;
    imageSize = 40;
    if(itemType == HEALTH){
          itemImage=loadImage("healthPotion.png");
      }
      else if(itemType == AMMO){
          itemImage = loadImage("ammoImage.png");
      }
      else if(itemType == SHOTGUN){
          itemImage = loadImage("shotgunImage.png");
      }
      else if(itemType == SNIPERRIFLE){
         itemImage = loadImage("sniperRifleImage.png"); 
      }
      else{
         itemImage = loadImage("autoPistolImage.png"); 
      }
  }
  void show() {
    if (roomX == mapX && roomY == mapY) {
      super.show();
      noStroke();
      fill(c);
      ellipse(loc.x, loc.y, size, size);
      image(itemImage,loc.x-imageSize/2,loc.y-imageSize/2,imageSize,imageSize);
    }
  }
  void act() {
    if (roomX == mapX && roomY == mapY) {
      super.act(); 
      if (dist(loc.x, loc.y, myCharacter.loc.x, myCharacter.loc.y)<=size+20) {
        checkItemType();
        lives=0;
      }
    }
  }
  
  //==================================================================================
  
  
  void checkItemType() {
    if (itemType == AMMO) {
        myCharacter.myWeapon.ammoCount = myCharacter.myWeapon.ammoCount*1.2;
    } else if (itemType == HEALTH) {
        if (myCharacter.lives<myCharacter.maxHealth) {
          myCharacter.lives++;
        }
        myObjects.add(new message(new PVector(0, -1),loc.x,loc.y-50,"HEALTH+"));
    }
    else if(itemType == AUTOPISTOL){
       myCharacter.myWeapon= new autoPistol();
       myCharacter.myWeapon.ammoCount=50;
       myObjects.add(new message(new PVector(0, -1),loc.x,loc.y-50,"AUTOPISTOL PICKED UP"));
    }
    else if(itemType == SHOTGUN){
        myCharacter.myWeapon= new shotgun();
       myCharacter.myWeapon.ammoCount=10;
       myObjects.add(new message(new PVector(0, -1),loc.x,loc.y-50,"SHOTGUN PICKED UP"));
    }
    else if(itemType == SNIPERRIFLE){
        myCharacter.myWeapon= new sniperRifle();
       myCharacter.myWeapon.ammoCount=5;
       myObjects.add(new message(new PVector(0, -1),loc.x,loc.y-50,"SNIPER RIFLE PICKED UP"));
    }
  }
}
