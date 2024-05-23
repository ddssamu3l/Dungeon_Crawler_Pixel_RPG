class gif {
  PImage image [];
  int frameCounter;
  int b;
  int count;

  gif(int frameNum, String name) {
    b=0;
    image = new PImage [frameNum];
    frameCounter = 0;
   
    if (name.equals("starting screen gif")) {
      for (int x = 0; x<image.length; x++) {
        image[x] = loadImage("frame_"+x+"_delay-0.1s.gif");
      }
    }
    else if(name.equals("manUpAnimation")){
        for (int x = 0; x<image.length; x++) {
           image[x]=loadImage("Human Sprite/_up/sprite_"+x+".png");
        }
    }
    else if(name.equals("manDownAnimation")){
        for (int x = 0; x<image.length; x++) {
           image[x]=loadImage("Human Sprite/_down/sprite_"+x+".png");
        }
    }
    else if(name.equals("manLeftAnimation")){
        for (int x = 0; x<image.length; x++) {
           image[x]=loadImage("Human Sprite/_left/sprite_"+x+".png");
        }
    }
    else if(name.equals("manRightAnimation")){
        for (int x = 0; x<image.length; x++) {
           image[x]=loadImage("Human Sprite/_right/sprite_"+x+".png");
        }
    }
    /*else if (name.equals("end screen gif")) {
      for (int x = 0; x<image.length; x++) {

        image[x] = loadImage("frame_"+x+"_delay-0.1s.gif");
      }
    */
    count=0;
  }
    void show() { 
      frameCounter=frameCounter+1;
      if (frameCounter>=image.length) {
        frameCounter=0;
      }
      image(image[frameCounter], 0, 0,width,height); 
    }
    void show(float x,float y, int w, int h){
        count++;
        if(count%8==0){
        frameCounter=frameCounter+1;
        count=0;
        }
      if (frameCounter>=image.length) {
        frameCounter=0;
      }
      image(image[frameCounter], x-w/2, y-h/2,w,h);  
    }
  }

 
