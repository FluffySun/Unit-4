//Ema Sun
//4.25
//Unit 4 Project
  float butterflyX=0;
  float butterflyY;
  float butterflySpeed;

void setup() {
  size(1000, 800);
  background(#023e8a);
  
  igloo(50,50);
    structure();
    
    spots(50,300);
    spots(300,300);
    spots(550,300);
    spots(800,300);
    
    //Spots on structure (different shade)
    
    door(50,350);
    door(300,350);
    door(550,350);
    door(800,350);
    
    roof(50);
    roof(300);
    roof(550);
    roof(800);
    
    lamp(50);
    lamp(300);
    lamp(550);
    lamp(800);
    
    fence();
  
  flower();
  //butterfly(50,100); how do i add more butterflies
  butterfly();

  //star(); maybe

  water();
  
  butterflyY=random(50,150);
  butterflySpeed=random(1,3);
  
  drawButterfly(butterflyX,butterflyY);
  
  butterflyX+= butterflySpeed;
  if (butterflyX>width+20) {
    butterflyX= -random(100,300);
    butterflyY= random(50,150);
  }
}
  
//  float butterflyY=random(50, 150);
//  float butterflySpeed=random(1, 3); 

//OBJECT BUTTERFLY
//How to use if function to make an animation-flying horizontal in up area?
//vertical level random and the speed of its horizontal flying also random?

void butterfly() { //!! 5.19 !!fish swimming in water? shining eye-while loop
    float butterflyX=0;

    if (butterflyX<width){
    butterflyX=butterflySpeed+1; 
  }
  drawButterfly(butterflyX,butterflyY);
  //rotate(PI/4); how do i move this?:(((((((((((((
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

//void structure(){ //How to make the ellipses have different color for each one
//How to make ellipses avoid background color & water color & avoid repeat
//  noStroke();
  //fill(random(0,255),random(0,255),random(0,255),random(0,255)); //(hue, saturation, brightness)
  //How to randomize transparency?
  
  //strokeWeight(3);
  //ellipse(50,350,200,200);
  //ellipse(300,350,200,200);
  //ellipse(550,350,200,200);
  //ellipse(800,350,200,200);
  
  //popMatrix();
  
  //fill bottom of circle (not show in water)
  //fill(#023e8a);
  //rect(0,450,1000,50);

//}


//NEW?
void structure() {
  strokeWeight(3);
  
  fill(random(0,255),random(0,255),random(0,255),random(100, 255));
  ellipse(50,350,200,200);
  
  fill(random(0,255),random(0,255),random(0,255),random(100, 255));
  ellipse(300,350,200,200);
  
  fill(random(0,255),random(0,255),random(0,255),random(100, 255));
  ellipse(550,350,200,200);
  
  fill(random(0,255),random(0,255),random(0,255),random(100, 255));
  ellipse(800, 350, 200, 200);

  //cover bottom part
  noStroke();
  fill(#023e8a);
  rect(0,450,1000,50);
}

void spots(float x,float y){
  fill(240, 128, 128,150);
  rect(x,y,40,20);
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
  rect(-w/2, 0, w, 100); //base
  triangle(0, -h, -w/2, 0, w/2, 0);
  
  //Windows:
  fill(#b2f7ef);
  ellipse(-w/2+h,-h,20,20);
 
  //Window lines-color does not work with stroke
  line(-w/2+h,-h,-w/2,-h+w);
  
  //triangle(0, peakY, -w/2, 0, w/2, 0);

  popMatrix();
}

void roof(float x){ //!! 5.19 !!
//spots
//door+fence

  float y=200;
  pushMatrix();
  translate(x, y);
  //rotate(random(100,180));
  rotate(radians(random(0,30)));
  
  noStroke();
  fill(0);
  
  scale(random(0.5, 1.5));
  float h = 40; //height
  float w = 80;
  float side = w/2;
  
  rect(-side,0, w,h);
    
  //left
  triangle(-side-20,h,-side,0,-side,h);
  
  //right
  triangle(side+20,h,side,0,side,h);
  
  //triangle(100,300,150,200,200,300);
  //triangle(0,300,50,200,100,300);
  
  //Move roof around
  //float x = random(0, width - 100);
  
  popMatrix();
}

void lamp(float x){  //glow the trig+round structure like a lamp/light 
//!! 5.19 !!

//some shades/transparent spots scattered on the structure
//fence like structure

//END
  
//HOW do i put the rectangle and the triangle together?=Same function
//why does the limitations not work anymore (not below water level)
  float y=350;
  pushMatrix();
  translate(x, y);
  
  noStroke();
  fill(0);
  
  //rect(50,200,100,100);
  //triangle(100,300,150,200,200,300);
  //triangle(0,300,50,200,100,300);
  
  //Move roof around
  //float x = random(0, width - 100);

  scale(random(0.5, 1.7));
  float w = random(20, 30); //width
  float h = random(35, 40); //height

  rect(-w/2, 0, w, h,100); //center 100-w/2,200,w,100
  triangle (0,-30,-w/2,0,w/2,0); //(100, 200-random(20, 50), 100-w/2, 200, 100+w/2, 200); //trig roof

  popMatrix();
}

void water() {
  popMatrix();
  
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
