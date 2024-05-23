class Bullet extends gameObjects {
  int BulletColor;
  int roomX;
  int roomY;
  PImage image;

  Bullet() {
  }
  Bullet(PVector aim, color col, int s, int d, int x, int y) {
    lives = 1;
    loc = new PVector(myCharacter.loc.x, myCharacter.loc.y);
    v = aim.copy();
    //v.setMag(13);
    size = s;
    damage=d;
    roomX = x;
    roomY = y;
    c=col;
    image = loadImage("bulletImage.png");
    // image.rotate();
  }

  void show() {
    
    if (roomX == mapX && roomY == mapY) {
      pushMatrix();
      translate(loc.x, loc.y);
      rotate(v.heading());
      image(image, -size*5, -size*5, size*10, size*10);
      popMatrix();
    }
  }

  void act() {   
    if (roomX == mapX && roomY == mapY) {   
      super.act();
      if (loc.x<=80 || loc.x>=width-80 || loc.y<=80 || loc.y>=height-80) {
        lives=0;
      }
    }
  }
}

class enemyBullet extends Bullet {
  enemyBullet(PVector a, PVector location, color col, int size, int x, int y) {
    super(a, col, size, 1, x, y);
    loc = location.copy();
    v.setMag(5.5);
  }
  void show() {
    if (roomX == mapX && roomY == mapY) {
      pushMatrix();
      translate(loc.x, loc.y);
      rotate(v.heading()+PI/2);
      noStroke();
      fill(#FABC7E);
      ellipse(-size, -size*2, size, size*4);
      popMatrix();
    }
  }
  void act() {
    super.act();
  }
}
