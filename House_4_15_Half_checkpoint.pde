//Ema (Anyue) Sun
//4.15

float r1, g1, b1;//Structure
float r2, g2, b2;//Roof
float r3, g3, b3;//Windows
float r4, g4, b4;//Door
float r5, g5, b5;//Knob

int houseX, houseY;

void setup() {
  size(800, 600);
  background(#fdf0d5);
  
  //position
  houseX = int(random(50, 400));
  houseY = int(random(50, 200));
  
  //color
  r1 = random(255);
  g1 = random(255);
  b1 = random(255);
  
  r2 = random(255);
  g2 = random(255);
  b2 = random(255);
  
  r3 = random(255);
  g3 = random(255);
  b3 = random(255);
  
  r4 = random(255);
  g4 = random(255);
  b4 = random(255);
  
  r5 = random(255);
  g5 = random(255);
  b5 = random(255);
  
  //draw
  house(houseX, houseY);
}

void house(int x, int y) {
  pushMatrix();
  translate(x, y);
  houseStructure();
  roof();
  window(75, 100);  
  window(275, 100); 
  door();
  popMatrix();
}

void houseStructure() {
  fill(r1, g1, b1);
  stroke(0);
  rect(0, 0, 400, 400);
}

void roof() {
  fill(r2, g2, b2);
  triangle(-50, 0, 200, -100, 450, 0);
}

void window(int x, int y) {
  fill(r3, g3, b3);
  stroke(0);
  rect(x, y, 60, 60);
  line(x + 30, y, x + 30, y + 60);
  line(x, y + 30, x + 60, y + 30);
}

void door() {
  fill(r4, g4, b4);
  rect(150, 200, 100, 200);
  fill(r5, g5, b5);
  circle(175, 300, 10);
}
