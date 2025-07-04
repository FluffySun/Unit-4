//Ema Sun
//4.25
//Unit 4 Project
float butterflyX=0;
float butterflyY;
float butterflySpeed;

PImage screenshot;

void setup() { 
  size(1000, 800);
  butterflyY = random(50, 150);   
butterflyX = -random(50, 100);   
butterflySpeed = random(1, 3);
  background(#023e8a);
  
   structure();
  
  int houseCount = 0;
  while(houseCount < 4) {
    float x = 50 + houseCount * 250; // Calculate x position (50, 300, 550, 800)
    house(x);
    houseCount = houseCount + 1;
  }
  water();

  fence();

  int flowerCount = 0;
  while(flowerCount < 6) {
    flower(random(50 + flowerCount*200, 150 + flowerCount*200), random(500, 700));
    flowerCount = flowerCount + 1;
  }

  screenshot = get(0, 0, width, height);
}
 
void house(float x) {
  // Call all house components for one house
  igloo(x, 50);
  structureComponent(x);  // Modified structure function for one component
  
  spots(x, 350);
  door(x, 350);
  roof(x);
  doorpart(x);
}

//NEW 5.23
//5.25 FLOWER
  void flower(float x, float y) {
  pushMatrix();
  translate(x, y);
  scale(random(0.8, 1.3));
  
  //Thing vertical
  stroke(60, 100, 60);
  strokeWeight(6);
  line(0, 0, 0, 100);
  
  //Petals
  colorMode(HSB);
  noStroke();
  
  int d = 50;
  while (d >= 5) {
    float b = map(d, 30, 0, 0, 255);
    fill(random(0, 360), 200, b);//glow petal
    ellipse(0, -30, d, d); //top
    ellipse(30, 0, d, d);  //right
    ellipse(0, 30, d, d);  //bottom
    ellipse(-30, 0, d, d); //left
    d=d-5;
  }
  
  // Center dot
  fill(50, 255, 255);
  ellipse(0, 0, 15, 15);

  colorMode(RGB);
  popMatrix();
}

//!!!NEW BUTTERFLY 6.10!!!
void butterfly(float butterflyX, float butterflyY) {
  pushMatrix();
  translate(butterflyX, butterflyY);
  scale(random(0.95, 1.05));
  drawWings();  // This is the function call within the function
  popMatrix();
  if (butterflyX > width + 50) {
  butterflyX = -random(50, 100);
  butterflyY = random(50, 150);
  butterflySpeed = random(1, 3);
}
}

void drawWings() {
  colorMode(HSB);
  noStroke();
  
  float d = 50;
  while (d >= 5) {
    float b = map(d, 50, 0, 0, 255);
    fill(320, 200, b); // pink
    ellipse(-20, 0, d, d + 20); // left wing
    ellipse(20, 0, d, d + 20);  // right wing
    d = d - 5;
  }

  // Body
  rectMode(CENTER);
  fill(0);
  int side = 30;
  while (side >= 5) {
    rect(0, 0, side, side, 20);
    side = side - 5;
  }

  // Eyes
  d = 15;
  while (d >= 2) {
    float b = map(d, 15, 0, 0, 255);
    fill(200, 255, b); // blue glow
    ellipse(-5, -15, d, d);
    ellipse(5, -15, d, d);
    d = d - 2;
  }

  // Antennas
  stroke(0);
  strokeWeight(2);
  line(-5, -20, -10, -40);
  line(5, -20, 10, -40);

  colorMode(RGB);
}

void igloo(float x, float y) {
  pushMatrix();
  translate(x, y);
  popMatrix();
}

void structure() {
  strokeWeight(3);

  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(50, 350, 200, 200);

  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(300, 350, 200, 200);

  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(550, 350, 200, 200);

  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(800, 350, 200, 200);

  //cover bottom part
  noStroke();
  fill(#023e8a);
  rect(0, 450, 1000, 50);
}

void spots(float centerX, float centerY) {
  float rx = 65; //x radius of ellipse
  float ry = 65; //y radius of ellipse

  int count = 0;

  while (count<10) {
    float x=random(-rx, rx);
    float y=random(-ry, ry);

    //if (() {//what to put here?){
    fill(240, 128, 128, random(60, 150));
    stroke(random(16,224),random(0,170),random(43,255));
    strokeWeight(1);
    
    rect(centerX+x, centerY+y, 15, 8);
    count=count+1;
    //}
  }
}

void door(float x, float y) {//How to make the roof rotate?->rotate(PI/2);
  //Stick to top of structure
  // Rotate the coordinate system by x degrees
  //rotate(radians(x));

  pushMatrix();
  translate(x, y); //top of ellipse

  float w = random(40, 100);
  float h = random(55, 70);
  scale(random(0.8, 1.2));

  //Keep roof attached to structure
  fill(255);
  stroke(random(89,255),random(13,240),random(34,243));
  strokeWeight(5);
  rect(-w/2, 0, w, 100); //base
  triangle(0, -h, -w/2, 0, w/2, 0);

  //triangle(0, peakY, -w/2, 0, w/2, 0);

  popMatrix();
}

void roof(float x) { //!! 5.19 !!
  //spots
  //door+fence

  pushMatrix();
  translate(x, 230);
  //rotate(random(100,180));
  rotate(radians(random(-10, 10)));

  noStroke();
  fill(0);

  scale(random(0.5, 1.5));
  float h = 40; //height
  float w = 80;
  float side = w/2;

  rect(-side, 0, w, h);

  //left
  triangle(-side-20, h, -side, 0, -side, h);

  //right
  triangle(side+20, h, side, 0, side, h);

  //triangle(100,300,150,200,200,300);
  //triangle(0,300,50,200,100,300);

  //Move roof around
  //float x = random(0, width - 100);
  
  popMatrix();

}

void structureComponent(float x) {
  fill(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(3);
  ellipse(x, 350, 200, 200);

  fill(#023e8a);
  noStroke();
  rect(x - 100, 450, 200, 50);
}

void doorpart(float x) {  //glow the trig+round structure like a lamp/light
  //!! 5.19 !!

  //some shades/transparent spots scattered on the structure
  //fence like structure

  //END

  //HOW do i put the rectangle and the triangle together?=Same function
  //why does the limitations not work anymore (not below water level)
  float y=350;
  pushMatrix();
  translate(x, y);

  stroke (random(162, 205), random(175, 224), random(204, 255));
  
  scale(random(0.5, 1.5));
  float w = random(20, 30); //width
  float h = random(30, 35); //height
  
  //rect(50,200,100,100);
  //triangle(100,300,150,200,200,300);
  //triangle(0,300,50,200,100,300);

  //Move roof around
  //float x = random(0, width - 100);

  fill(0);
  rect(-w/2, 0, w, h, 100); //center 100-w/2,200,w,100
  
  fill(0);
  triangle (0, -30, -w/2, 0, w/2, 0); //(100, 200-random(20, 50), 100-w/2, 200, 100+w/2, 200); //trig roof

  line(-w/4,0,w/4,h);
  line(w/4,0,-w/4,h);

  popMatrix();
}

void window() {
  //Windows:
  fill(#b2f7ef);
  float wx=0;
  float wy=30;
  ellipse(wx, wy, 20, 20);

//window lines
  stroke(0);
  line(wx, wy-10, wx, wy+10);
  line(wx-10, wy, wx+10, wy);
}

void water() {
  pushMatrix();
  translate(500,175);
  fill(173, 232, 244);
  rect(0, 450, 1000, 400);
  
  popMatrix();
}


void fence() {
  fill(#ffee32);
  rect(500, 450, 1000, 100);

  stroke(0);
  strokeWeight(4);
  float x=0;

  while (x<=width) {
    float top=random(430, 440);//top
    float bottom=random(490, 500);//random height bottom
    line(x, top, x, bottom);//vertical
    x=x+random(25, 35);
  }

  //horizontal
  line(0, 440, width, 440);
  line(0, 500, width, 500);

}

void draw() {
  background(#023e8a);
  
  structure();

  int houseCount = 0;
  while (houseCount < 4) {
    float x = 50 + houseCount * 250;
    house(x);
    houseCount++;
  }

  int flowerCount = 0;
  while (flowerCount < 6) {
    flower(100 + flowerCount * 150, 550);
    flowerCount++;
  }

  water();
  fence();
  
  butterfly(butterflyX, butterflyY);
  butterflyX += butterflySpeed;
  if (butterflyX > width + 50) {
    butterflyX = -random(50, 100);
    butterflyY = random(50, 150);
    butterflySpeed = random(1, 3);
  }
}
