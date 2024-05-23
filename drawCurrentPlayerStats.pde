void drawPlayerCurrentStats(){
  
  
  textSize(70);
  fill(255);
  text("CurrentWeapon: "+myCharacter.myWeapon.weaponName,3*width/4,height/8-50);

  textSize(70);
  text("AMMO: "+myCharacter.myWeapon.ammoCount,5*width/6,height/8);
  text("HEALTH: "+myCharacter.lives,5*width/6,height/8+50); 
  fill(0);
}
