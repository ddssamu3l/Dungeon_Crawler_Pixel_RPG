// Samuel Deng
// RPG Project
// Jan 13th 2022
import java.util.*;

int mode,start,game,pause,end,win;
int mapX,mapY;
int endingRoomX,endingRoomY;
character myCharacter;
int characterMaxLives;
boolean mouseReleased;
boolean hadPressed;
Boolean up,down,left,right,space;
Button blueButton, greenButton, pinkButton, blackButton;
color bkg;

//color pallette
color blue   = #28E7ED;
color green  = #2DDE07;
color pink   = #F76DDC;
color yellow = #F7CC75;
color saturatedYellow = #F0C116;
color black  = #000000;
color white  = #FFFFFF;
color red    = #D30202;
color easyDifficulty = #67d771;
color mediumDifficulty = #ebd864;
color hardDifficulty = #f17a40;
color impossibleDifficulty=#f32e29;
color endingRoom = #002fff;
gif g;
gif manUp,manDown,manLeft,manRight;

Button button;
Button healthButton;
Button ammoButton;
Button damageButton;

PImage image;
PImage mapFloor;
PImage mapImage;
PImage characterImage;
PFont font;

 Room map[][];

LinkedList <gameObjects>myObjects;
ArrayList <DarknessCell> darkness;
ArrayList <Enemy> endingRoomEnemyList;

Room centerRoom,leftRoom,rightRoom,topRoom,bottomRoom, currentRoom;

final int AMMO = 0;
final int HEALTH = 1;
final int AUTOPISTOL = 2;
final int SNIPERRIFLE = 3;
final int SHOTGUN = 4;

void setup(){
  size(1200,800);
  // load GIFS
  manUp = new gif(4,"manUpAnimation");
  manDown = new gif(4,"manDownAnimation");
  manLeft = new gif(4,"manLeftAnimation");
  manRight = new gif(4,"manRightAnimation");
  g=new gif(16,"starting screen gif");
  
  // fonts
  font = createFont("Pixels.ttf",200);
  textFont(font);
  
  myCharacter = new character();
  characterMaxLives = 10;
  mode = start = 0;
  game = 1;
  pause = 2;
  end = 3;
  win=4;
  myObjects = new LinkedList<gameObjects>();
  
 // load Images
 // map.png, EasyMap.png
 mapImage= loadImage("EasyMap.png");
 mapFloor = loadImage("mapFloor(2).png");
 mapFloor.resize(width-110,height-120);
 characterImage = loadImage("doomCharacter.png");
  map= new Room [mapImage.height][mapImage.width];
  
  initializeDarkness();
  up=down=left=right=space=false;
  myObjects.add(myCharacter);
  initiateMap();
  
  button= new Button("start", width/2,height/4*3,300,200,black,white,150);
  ammoButton = new Button("+",width/6*5,height/3+200,50,50,black,white,50);
  healthButton = new Button("+",width/6*5,height/3+300,50,50,black,white,50);
  damageButton =new Button("+",width/6*5,height/3+400,50,50,black,white,50);
  
 // endingRoomEne
 
 
  
  
}

void draw(){
  if(mode == start)startMenu();
  else if(mode == game) game();
  else if(mode == pause)pause();
  else if(mode == end) end();
  else if(mode == win)win();
}

void drawObjects(){
    int i=0;
  while(i<myObjects.size()){
     gameObjects b = myObjects.get(i);
     b.show();
     b.act();
     if(b.lives<=0){
     myObjects.remove(i); 
     }else{
     i++;
     } 
  } 
}
// This function initializes all the rooms in the level by spawning monsters in them depending on the difficulty that I set for each room.
// The difficulty of each room is saved onto the map's jpeg image as a pixel with a color. The difficulty of a given  
// room is determined by the corrisponding pixel on the map (that represents the given room being initialized) 
// For example, if a given pixel on the map is green, then that means that the corrisponding room that the pixel represents will be an "easy" room, with only one enemy in it.
void initiateMap(){ 
  int mx  = 0;
  int my = 0;
 while(my<=mapImage.height-1){
    color c = mapImage.get(mx,my);
    System.out.println(hex(c));
    if(c != #FFFFFF){
        map[my][mx]=new Room();
    }
    
    if(c == easyDifficulty){
       myObjects.add(new Enemy(100,150,mx,my,(int)random(width/4,width*3/4),(int)random(height/4,height*3/4))); 
    }
    else if(c == mediumDifficulty){
       myObjects.add(new Follower(100,100,mx,my,width/2,height/2));
    }
    else if(c == hardDifficulty){
      myObjects.add(new Follower(100,100,mx,my,3*width/4,height/2));
      myObjects.add(new Follower(100,100,mx,my,width/4,height/2));
    }
    else if(c == hardDifficulty){
      myObjects.add(new Follower(150,100,mx,my,3*width/4,height/2));
      myObjects.add(new Follower(150,100,mx,my,width/4,height/2));
      myObjects.add(new Follower(150,100,mx,my,3*width/4,height/4));
    }
    else if(c == impossibleDifficulty){
      myObjects.add(new Follower(200,100,mx,my,3*width/4,height/2));
      myObjects.add(new Follower(200,100,mx,my,width/4,height/2));
      myObjects.add(new Follower(200,100,mx,my,3*width/4,height/4));
      myObjects.add(new Follower(200,100,mx,my,width/4,height/4*3));
    }
    else if(c == endingRoom){
      endingRoomX=mx;
      endingRoomY=my;
      myObjects.add(new Follower(150,100,0,0,width/4,height/2));
      myObjects.add(new Follower(150,100,0,0,3*width/4,height/2));
      myObjects.add(new Follower(150,100,mx,my,3*width/4,height/4));
      myObjects.add(new Follower(150,100,mx,my,width/4,height/4*3));
      myObjects.add(new Enemy(200,150,mx,my,150,150)); 
      myObjects.add(new Enemy(200,150,mx,my,150,height-150)); 
      myObjects.add(new Enemy(200,150,mx,my,width-150,150)); 
      myObjects.add(new Enemy(200,150,mx,my,width-150,height-150)); 
    }
    mx+=1;
    if(mx>=mapImage.width){
      mx=0;
      my++;
    }
 }
  currentRoom = map[1][1];
  mapX = 1;
  mapY = 1;
}
