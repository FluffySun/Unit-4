//Ema Sun
//4.25
//Unit 4 Project


void setup() {
  size(800, 600);
  background(#fdf0d5);
  
  drawSlipper(100, 150);
  drawSlipper(450, 130);
  drawSlipper(120, 400);
  drawSlipper(470, 370);
}

void drawSlipper(float x, float y) {
  pushMatrix();
  translate(x, y);
  scale(0.8);
  rotate(random(-0.2, 0.2)); 
  
  drawToe();
  drawHeel();
  drawRibbon1();
  drawRibbon2();
  
  popMatrix();
}

void drawToe() {
  fill(255, 192, 203); //pink
  stroke(0);
  triangle(0, 0, 60, 0, 30, -60); //pointed toe
}

void drawHeel() {
  fill(255, 182, 193);
  stroke(0);
  rect(10, 0, 40, 20); //heel
}

void drawRibbon1() {
  stroke(150, 75, 100);
  strokeWeight(3);
  line(10, -20, 50, -30); //ribbon
}

void drawRibbon2() {
  stroke(150, 75, 100);
  strokeWeight(3);
  line(10, -30, 50, -20); //cross ribbon
}
