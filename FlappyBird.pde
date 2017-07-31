/*
Hi Collin!!!!!!!!!!!!
From M.
*/
import java.text.DecimalFormat;
DecimalFormat df = new DecimalFormat("0.###");
float score = 0;
Player birdy = new Player(475, 225, 50, 50);
Pipe[] pipes;
PImage cloud;
float xpos = 0;
void setup() {
  size(2000, 550);
  pipes = new Pipe[4];
  pipes[0] = new Pipe(900);
  pipes[1] = new Pipe(1500);
  pipes[2] = new Pipe(2100);
  pipes[3] = new Pipe(2700);
  
  cloud = loadImage("cloud.png");
  birdy.bird = loadImage("bird.png");
  birdy.bird.resize(50, 50);
  
  for (int i = 0; i < pipes.length; i++) {
      pipes[i].pipe = loadImage("pipe.png");
    }
}//end of setup

void draw() {
  if (collide() == false) {
    score = score + (0.001*pipes[1].speed);
    background(43, 247, 255);
    image(cloud, xpos, 300);
    xpos = xpos-1.5;
    birdy.drawPlayer();
    birdy.makeGravity();
    for (int i = 0; i < pipes.length; i++) {
      pipes[i].drawPipe();
    }//end of for loop
    fill(80, 190, 30);
    noStroke();
    rect(0, 499, 2000, 16);
    fill(195, 155, 45);
    rect(0, 515, 2000, 35);
  }//end of if statement
  else {
    background(0);
    textAlign(CENTER);
    textSize(100);
    fill(255, 255, 255);
    text("Game Over", width/2, height/2);
    text("Score: "+df.format(score), width/2, 400);
  }//end of else statement
}//end of draw

boolean collide() {
  boolean col = false;
  float playerX = birdy.getX();
  float playerY = birdy.getY();
  float playerL = birdy.getL();
  float playerW = birdy.getW();
  for (int i = 0; i < pipes.length; i++) {
    float pipeX = pipes[i].getX();
    float pipeLen1 = pipes[i].getY1();
    float pipeLen2 = pipes[i].getY2();
    if (playerX < pipeX + 75 && playerX + playerW > pipeX && playerY < pipeLen1 || playerX < pipeX + 75 && playerX + playerW > pipeX && playerY + playerL > 500 - pipeLen2 || playerY + playerL > 500) {
      col = true;
    }//end of if statement
  }//end of for loop
  return col;
}//end of collide

void keyPressed() {
  float y = birdy.getY();
  if (collide() == false) {
    if (keyPressed == true) {
      if (keyCode == UP) {
        birdy.resetGravity();
        birdy.setY(y-40);
      }//end of keycode identifier
    }//end of keyPressed identifier
  }//end of collide if statement
}//end of keypressed