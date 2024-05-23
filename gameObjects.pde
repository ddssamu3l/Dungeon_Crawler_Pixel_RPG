class gameObjects{
  PVector loc;
  PVector v;
  PVector dir;
  int lives;
  int size;
  int damage;
  int roomX;
  int roomY;
  color c;
  
  gameObjects(){
  }
  
 void show(){
 }
   
  void act(){
    loc.add(v);
  }
  
}
