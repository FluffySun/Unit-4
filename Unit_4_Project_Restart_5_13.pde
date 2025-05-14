//Ema Sun
//4.25
//Unit 4 Project

void setup() {
  size(1000, 800);
  background(#023e8a);
  
  igloo(50,50);
    structure();
    door();
    roof(50, 350);
    roof(300, 350);
    roof(550, 350);
    roof(800, 350);
    
    fence();
  
  flower();
  butterfly();
  
  //star(); maybe

  water();
}

//OBJECT BUTTERFLY
//How to use if function to make an animation-flying horizontal in up area?
//vertical level random and the speed of its horizontal flying also random?
void butterfly() {
    float butterflyX=0;
    float butterflyY=random(50, 150);
    float butterflySpeed=random(1, 3); 

    if (butterflyX<width){
    butterflyX=butterflySpeed+1; 
  }
  drawButterfly(butterflyX,butterflyY);
}
  
  void drawButterfly(float x, float y) {
  fill(255,150,200);
  ellipse(x-10,y,20,30); //left wing
  ellipse(x+10,y,20,30); //right wing
  fill(0);
  ellipse(x,y,5,20); //body
}
  
void igloo(int x, int y) { //How can igloo randomly position without changing inside?
  pushMatrix();
  translate(x,y);
 
}

void structure(){ //How to make the ellipses have different color for each one
//How to make ellipses avoid background color & water color & avoid repeat
//  noStroke();
  fill(random(0,255),random(0,255),random(0,255),random(0,255)); //(hue, saturation, brightness)
  //How to randomize transparency?
  
  strokeWeight(3);
  ellipse(50,350,200,200);
  ellipse(300,350,200,200);
  ellipse(550,350,200,200);
  ellipse(800,350,200,200);
  
  popMatrix();
  
  //fill bottom of circle (not show in water)
  fill(#023e8a);
  rect(0,450,1000,50);

}

void door(){ //HOW do i put the rectangle and the triangle together?=Same function
//why does the limitations not work anymore (not below water level)
  noStroke();
  fill(255);
  
  //rect(50,200,100,100);
  //triangle(100,300,150,200,200,300);
  //triangle(0,300,50,200,100,300);
  
  //Move roof around
  float x = random(0, width - 100);
  float y = random(0, 300);
  pushMatrix();
  translate(x, y);

  scale(random(0.7, 1.5));
  float w = random(80, 120); //width
  float peakY = random(150, 190); //height
triangle(100, peakY, 50, 200, 150, 200); //sides same,peak change

  rect(100-w/2, 200, w, 100); //center
  triangle(100, 200-random(20, 50), 100-w/2, 200, 100+w/2, 200); //trig roof

  popMatrix();
}

  void roof(float x, float y) {//How to make the roof rotate?->rotate(PI/2); 
//Stick to top of structure
// Rotate the coordinate system by x degrees
//rotate(radians(x));

  pushMatrix();
  translate(x, y - 150); //top of ellipse

  float w = random(80, 120);
  float h = random(40, 70);
  scale(random(0.8, 1.2));
  float peakY = -h;

  //Keep roof attached to structure
  fill(255);
  rect(-w/2, 0, w, 100);
  triangle(0, peakY, -w/2, 0, w/2, 0);

  popMatrix();
}


void water() {
  fill(173, 232, 244);
  rect(0,450,1000,350); //more round edges variable
  
}


//need similar to Fence structured with lines code for the igloo object
void fence() { //FENCE NOT WORK?
  stroke(255);
  strokeWeight(4);
  int x = 0;
  while (x<=width) {
    line(x,500,x,600); //vertical
    x=x+30;
  }
  line(0, 510, width, 510);
  line(0, 560, width, 560);
}

void flower(){
  
  
}
