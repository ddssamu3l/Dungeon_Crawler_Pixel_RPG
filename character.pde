class character extends gameObjects {
  PVector downDir;
  PVector leftDir;
  PVector rightDir;
  Boolean isInvincible;
  int invincibleTimer;
  float killCount;
  float xp;
  float upgradableXp;
  float level;
  float maxHealth;
  gif currentAction;
  Weapon myWeapon;
  character() {
    loc = new PVector(width/2, height/2);
    v= new PVector(0, 0);
    dir= new PVector(0, -4);
    downDir = new PVector(0, 4);
    leftDir = new PVector(-4, 0);
    rightDir = new PVector(4, 0);
    //myWeapon = new sniperRifle();
    //myWeapon = new autoPistol();
    //myWeapon = new Weapon();
    myWeapon = new shotgun();
    //myWeapon = new pistol();
    maxHealth=10;
    killCount=0;
    xp=0;
    upgradableXp=0;
    level = 1;
    lives = 10;
    size = 100;
    isInvincible = false;
    invincibleTimer = 100;
    currentAction =manDown;
  }

  void show() {
    currentAction.show(myCharacter.loc.x, myCharacter.loc.y, size/2, size);
  }
  void act() {///////////////////////////////////////////////////////////////////////////
    super.act();
    checkCharacterLevel();
    characterMove();
    myWeapon.update();
    if (space) {
      myWeapon.shoot();
    }
    checkCharacterDamage();
    if (killCount>=12) {
      mode = win;
    }
  }

  void checkCharacterLevel() {
    if (xp>=level*20) {
      level+=1;
      myObjects.add(new message(new PVector(0, -1), loc.x, loc.y-50, "Level_Up"));
      myCharacter.myWeapon.damage*=1.1;
      maxHealth+=2;
      lives+=2;
    }
    drawHealthBar();
  }

  void drawHealthBar() {
    pushMatrix();
    translate(loc.x, loc.y);
    strokeWeight(2);
    stroke(0);
    fill(red);
    rect(-maxHealth*3, -50, maxHealth*6, 8);
    fill(green);
    rect(-maxHealth*3, -50, lives*6, 8);
    rotate(dir.heading());
    popMatrix();
  }
  void characterMove() {
    if (up) {
      v.y = -4;
      currentAction = manUp;
    } else if (down) {
      v.y=4;
      currentAction = manDown;
    } else v.y=0;
    if (left) {
      v.x = -4;
      currentAction = manLeft;
    } else if (right) {
      v.x = 4;
      currentAction = manRight;
    } else v.x=0;
    if (!up && !down && !left && !right) {
      v.x=0;
      v.y=0;
    }
  }
  //=========================================================================  CHARACTER DAMAGE TAKING CODE==============================================================
  void checkCharacterDamage() {
    int i = 0;
    while (i<myObjects.size()) {
      gameObjects obj = myObjects.get(i);
      if (obj instanceof enemyBullet && !isInvincible) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d<=size/2+obj.size/2-10) {
          lives -=1;
          obj.lives = 0;
        }
      }

      i++;
    }
    if (isInvincible) {
      invincibleTimer--;
      stroke(#0000FF);
      noFill();
      circle(loc.x, loc.y, size+35);
    }
    if (invincibleTimer<=0) {
      isInvincible = false;
      invincibleTimer = 100;
    }
    if (lives<=0) {
      mode = end;
    }
  }
}
