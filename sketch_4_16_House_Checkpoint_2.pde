//Ema (Anyue) Sun
//4.16

void setup() {
  size(800, 600);
  background(#fdf0d5);
  // First house
  drawHouse(100, 100);
  // Second house
  drawHouse(450, 100);
  // Third house
  drawHouse(100, 350);
  // Fourth house
  drawHouse(450, 350);
}

void drawHouse(float x, float y) {
  pushMatrix();
  translate(x, y);
  scale(0.8); 
  drawStructure();
  drawRoof();
  drawWindow(30, 50);
  drawWindow(210, 50);
  drawDoor();
  popMatrix();
}

void drawStructure(){
  fill(random(255), random(255), random(255));
  stroke(0);
  rect(0, 0, 300, 200);
}

void drawRoof() {
  pushMatrix();
  translate(150, 0);
  rotate(PI/random(0,4));
  fill(random(255), random(255), random(255));
  triangle(-170, 0, 0, -100, 170, 0);
  popMatrix();
}

void drawWindow(float x, float y){
  fill(random(255), random(255), random(255));
  stroke(0);
  rect(x, y, 50, 50);
  line(x + 25, y, x + 25, y + 50);
  line(x, y + 25, x + 50, y + 25);
}

void drawDoor() {
  fill(random(255), random(255), random(255));
  rect(120, 100, 60, 100);
  fill(random(255), random(255), random(255));
  ellipse(130, 150, 10, 10); //knob
}
