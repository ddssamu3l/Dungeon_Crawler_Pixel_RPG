class Room {
  Boolean topExit, bottomExit, leftExit, rightExit;

  Room() {
  }

  void drawRoom() {
    topExit = bottomExit = leftExit = rightExit = false; 
    rectMode(CORNER);
    background(67);
    fill(255);
    strokeWeight(5);
    stroke(3);
    drawRoomExits();
  fill(#A5A5A5);
  //image(mapFloor,50, 60);
  rect(60, 60, width-120, height-120);
  if(myCharacter.lives == 1){ fill(red); rect(0,0,width,height,5);}
  }
//=======================================================================================================================================
  void checkRoom() {
    if (topExit) {    
      if (myCharacter.loc.y<=90 && (myCharacter.loc.x>width/2+100|| myCharacter.loc.x<width/2-100))myCharacter.loc.y=90;
      if (myCharacter.loc.y<=40 && (myCharacter.loc.x<width/2+100 && myCharacter.loc.x>width/2-100)) {
        mapY=mapY-1; 
        myCharacter.loc.x=width/2;
        myCharacter.loc.y=height-50;
      } // top
    } else {
      if (myCharacter.loc.y<=90) {
        myCharacter.loc.y=90;
      }
    }

    if (rightExit) {
      if (myCharacter.loc.x>=width-90 && (myCharacter.loc.y>height/2+100|| myCharacter.loc.y<height/2-100))myCharacter.loc.x=width-90;
      if (myCharacter.loc.x>=width-40 && (myCharacter.loc.y<height/2+100&& myCharacter.loc.y>height/2-100)) {
        mapX+=1; 
        myCharacter.loc.x=50;
        myCharacter.loc.y=height/2;
      } // right
    } else {
      if (myCharacter.loc.x>=width-90) {
        myCharacter.loc.x=width-90;
      }
    }

    if (leftExit) {
      if (myCharacter.loc.x<=90 && (myCharacter.loc.y>height/2+100|| myCharacter.loc.y<height/2-100))myCharacter.loc.x=90;
      if (myCharacter.loc.x<=40 && (myCharacter.loc.y<height/2+100&& myCharacter.loc.y>height/2-100)) {
        mapX-=1; 
        myCharacter.loc.x=width-50; 
        myCharacter.loc.y=height/2;
      } // left
    } else {
      if (myCharacter.loc.x<=90) {
        myCharacter.loc.x=90;
      }
    }

    if (bottomExit) {
      if (myCharacter.loc.y>=height-90 && (myCharacter.loc.x>width/2+100|| myCharacter.loc.x<width/2-100))myCharacter.loc.y=height-90;
      if (myCharacter.loc.y>=height-40 && (myCharacter.loc.x<width/2+100 && myCharacter.loc.x>width/2-100)) {
        mapY+=1; 
        myCharacter.loc.x=width/2;
        myCharacter.loc.y=70;
      }
    } else {
      if ( myCharacter.loc.y>=height-90)myCharacter.loc.y=height-90;
    }
    //println(mapY+" "+mapX);
  }
  void drawRoomExits(){
    fill(yellow);
    noStroke();
      if (map[mapY-1][mapX]!= null) {
      rect(width/2-100,0, 200, 100);//top circle
      topExit=true;
    }
    if (map[mapY+1][mapX]!= null) {
      rect(width/2-100, height-100, 200, 100);//bottom circle
      bottomExit=true;
    }
    if (map[mapY][mapX-1]!= null) {
      rect(0, height/2-100, 100, 200);// left circle
      leftExit=true;
    }
    if (map[mapY][mapX+1]!= null) {
      rect(width-100, height/2-100, 100, 200);//right circle
      rightExit=true;
    } 
  }
}
