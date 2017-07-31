class Player {
  float xcor;
  float ycor;
  float wid;
  float len;
  boolean isGravityOn = true; 
  float gravity = 0;
  PImage bird;
  
  Player(float x, float y, float w, float l) {
    xcor = x;
    ycor = y;
    wid = w;
    len = l;
  }//end of constructor

  void makeGravity() {
    if (isGravityOn == true) {
      gravity = gravity + 0.1;
    }
  }

  void resetGravity() {
    gravity = 0;
  }

  void drawPlayer() {
    fill(255, 255, 0);
    if (isGravityOn == true) {
      ycor= ycor +gravity;
    }
    image(bird, xcor, ycor);
  }//end of draw player
  
  
  float getX(){
    return xcor;
  }

  float getY() {
    return ycor;
  }

  float getW() {
    return wid;
  }

  float getL() {
    return len;
  }


  void setY(float newY) {
    ycor = newY;
  }

  void setW(float newW) {
    wid = newW;
  }
}//end of class 