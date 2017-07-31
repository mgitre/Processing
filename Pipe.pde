class Pipe {
  float xcor;
  float len;
  float xcor2;
  float lent;
  float speed = 2;
  PImage pipe;
  int seconds;

  Pipe(float x) {
    xcor = x;
    len = random(300);
  }

  void drawPipe() {
    fill(51, 186, 11);
    lent = 300-len;
    offScreen();
    /*rect(xcor, 0, 75, len);
    rect(xcor, 500-len2, 75, lent);*/
    pipe.resize(75, (int)len);
    image(pipe, xcor, 0);
    pipe.resize(75, (int)lent);
    image(pipe, xcor, 500-lent);
    pipe.resize(100, 25);
    image(pipe, xcor-12.5, len-25);
    image(pipe, xcor-12.5, 500-lent);
    xcor = xcor-speed;
    speed = speed+0.008;
  }


  float getX() {
    return xcor;
  }

  float getY1() {
    return len;
  }

  float getY2() {
    return lent;
  }


  void stopPipe() {
    speed = 0;
  }
  
  float getSpeed() {
    return speed;
  }


  void offScreen() {
    if (xcor < -50) {
      xcor = 2400;
      len = random(300);
    }
  }
}