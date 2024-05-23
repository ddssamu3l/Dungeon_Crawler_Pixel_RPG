void drawPauseMenu(){
 background(yellow);
  fill(0);
  textSize(250);
  text("PAUSED", width/2,height/15);
  textSize(150);
  text("LEVEL: "+myCharacter.level,width/6,height/3-40);
  text("XP: "+myCharacter.upgradableXp,width/6,height/3+60);
  textSize(100);
  text("AMMO: "+myCharacter.myWeapon.ammoCount,width/6,height/3+200);
  text("HEALTH: "+myCharacter.lives,width/6,height/3+300); 
  //text("DAMAGE: "+myCharacter.myWeapon.damage,width/6,height/3+400); 
}


void drawPauseMenuButtons(){
    ammoButton.show();
    healthButton.show();
}

void pauseMenuButtonInteractions (){
  click();
   if(myCharacter.upgradableXp>0){
      if(ammoButton.clicked){
         myCharacter.myWeapon.ammoCount+=myCharacter.myWeapon.magSize; 
         myCharacter.upgradableXp-=5;
      }
      else if(healthButton.clicked){
        if(myCharacter.lives<myCharacter.maxHealth){
         myCharacter.lives+=2;
         myCharacter.upgradableXp-=5;
        }
      }
      else if(damageButton.clicked){
         myCharacter.myWeapon.damage*=1.1; 
         myCharacter.upgradableXp-=10;
      }
   }
}
