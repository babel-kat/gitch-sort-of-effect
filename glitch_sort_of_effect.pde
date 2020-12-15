// Katerina Labrou
// Fall 2020
// Glitch-sort-of Effect


import processing.video.*;
import java.util.Random;

int x, y, mil ;
int x1, x2;

Capture webcam;

void setup(){
  webcam = new Capture(this, 640, 480);        // PImage image apo stream me analysh 640, 480
  size(960, 620);
  background(255);
  x = width/2;
  y = height;
  strokeWeight(5);
  frameRate(20);
  x1 = x2 = x;
  webcam.start();
}

void draw(){
  if (webcam.available()) {
    webcam.read();
  }
  tint(255, 255, 255, 5);
  image(webcam, 0, 0, width, height);
  mil = millis() % 255;   // color
  drawCanvas();
  drawLine();
}


void drawCanvas(){
  stroke(random(mil), 0, random(20, 90), 20);
  strokeWeight(4 * mil);            // 4 - fill canvas width
  line(x, 0, x, y);
}

void drawLine(){
  strokeWeight(mil / 2);
  stroke(255, 255, 0, 10);  
  moveLine();
  displayLine();
}

void moveLine(){
  int delay = 500;
  int step = (int) random(4,10);
  x1 += step;
  if (x1 > width + delay) x1= width / 2;
  x2 -= step;
  if (x2 < 0 - delay) x2= width /2;  
}
 
void displayLine(){
  line(x1, y, x1, 0);
  line(x2, y, x2, 0);
} 
