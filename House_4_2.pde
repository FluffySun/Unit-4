//Ema (Anyue) Sun
//4.2

color beige = #fdf0d5;
color red = #c1121f;
color black = #000000;
color brown = #6B4423;
color gray = #808080;

void setup() {
  size(800, 600);
}

void draw() {
  background(beige);
  house(200, 100);
}

void house(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  houseStructure();
  roof();
  window(75, 100);  // Left window
  window(275, 100); // Right window
  door();
  
  popMatrix();
}

void houseStructure() {
  fill(brown);
  stroke(black);
  rect(0, 0, 400, 400); //house structure
}

void roof() {
  fill(gray);
  triangle(-50, 0, 200, -100, 450, 0); //roof
}

void window(int x, int y) {
  fill(beige);
  stroke(black);
  rect(x, y, 60, 60); // frame
  line(x + 30, y, x + 30, y + 60); // vertical
  line(x, y + 30, x + 60, y + 30); // horizontal
}

void door() {
  fill(red);
  rect(150, 200, 100, 200); // Door
  fill(black);
  circle(175, 300, 10); // Door knob
}
