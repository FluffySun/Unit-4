//Ema Sun
//4.25
//Unit 4 Project


void setup() {
  size(1000, 800);
  background(#023e8a);

  igloo(50,50);
    structure();
    roof();
  
  //flower();
  //butterfly();
  //star(); maybe

  water();
}
  
void igloo(int x, int y) {
  pushMatrix();
  translate(x,y);
}

void structure(){
  fill(random(0,255),random(0,255),random(0,255), 100);
  
  ellipse(50,350,200,200);
  ellipse(300,350,200,200);
  ellipse(550,350,200,200);
  ellipse(800,350,200,200);
  
  popMatrix();
}

void roof(){
  fill();
  rect();
  traingle();
}

void water() {
  fill(#ade8f4, 200);
  rect(0,450,1000,350); //more round edges variable
  
  
}
