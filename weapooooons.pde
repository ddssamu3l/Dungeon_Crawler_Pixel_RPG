class Weapon {
  int damage;
  int shotTimer;
  int threshold;
  float bulletSpeed;
  int size;
  float ammoCount;
  float magSize;
  String weaponName;
  Weapon() {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed=5;
  }

  Weapon(int thr, float bs, int s, int d, float ammo,float mag, String name) {
    shotTimer = 0;
    threshold = thr;
    bulletSpeed=bs;
    size = s;
    damage = d;
    ammoCount = ammo;
    magSize =mag;
    weaponName = name;
  }

  void update() {
    shotTimer++;
  }

  void shoot() {
    if (ammoCount>0) {
      if (shotTimer>=threshold) {
        PVector aimVector= new PVector((mouseX-myCharacter.loc.x), (mouseY-myCharacter.loc.y)); 
        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(aimVector, #FFCB8B, size, damage, mapX, mapY));
        shotTimer=0;
        ammoCount--;
      }
    }
  }
}

class pistol extends Weapon {
   pistol(){
      super(25, 12, 6, 4, 30, 20, "pistol");
   }
}

class autoPistol extends Weapon {
  autoPistol() {
    super(10, 10, 6, 4, 10,20, "autoPistol");
  }
}

class sniperRifle extends Weapon {

  sniperRifle() {
    super(200, 20, 10, 50, 100,3, "sniperRifle");
  }
}

class shotgun extends Weapon {

  shotgun() {
    super(100, 6, 7, 4, 20,5, "shotgun");
  }
  void shoot() {
    if (ammoCount>0) {
      if (shotTimer>=threshold) {
        PVector aimVector= new PVector(mouseX-myCharacter.loc.x, mouseY-myCharacter.loc.y); 
        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(aimVector.copy().rotate(-0.3).setMag(aimVector.mag()+random(-1, 1)), #FFCB8B, size, damage, mapX, mapY));
        myObjects.add(new Bullet(aimVector.copy().rotate(-0.3).setMag(aimVector.mag()+random(-1, 1)), #FFCB8B, size, damage, mapX, mapY));
        myObjects.add(new Bullet(aimVector.copy().setMag(aimVector.mag()+random(-1, 1)).rotate(-0.1), #FFCB8B, size, damage, mapX, mapY));
        myObjects.add(new Bullet(aimVector.copy().setMag(aimVector.mag()+random(-1, 1)).rotate(0), #FFCB8B, size, damage, mapX, mapY));
        myObjects.add(new Bullet(aimVector.copy().setMag(aimVector.mag()+random(-1, 1)).rotate(0), #FFCB8B, size, damage, mapX, mapY));
        myObjects.add(new Bullet(aimVector.copy().setMag(aimVector.mag()+random(-1, 1)).rotate(0.1), #FFCB8B, size, damage, mapX, mapY));
        myObjects.add(new Bullet(aimVector.copy().setMag(aimVector.mag()+random(-1, 1)).rotate(0.3), #FFCB8B, size, damage, mapX, mapY));
        shotTimer=0;
        ammoCount--;
      }
    }
  }
}
