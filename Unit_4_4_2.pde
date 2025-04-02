//Ema (Anyue) Sun
//3.31
//Top down coding

color beige=#fdf0d5;
color red=#c1121f;
color black=#000000;
color blue=#669bbc;

void setup() {
  size(800, 600);
}

void draw() { //on loop
  background (beige);
  
  face(200,100); //x, y
  face(300, 200);
  face(400,300);
}

void face (int x, int y) {
  pushMatrix(); //lock to new coordinate (temporary transformation) 
  //not everything moves to same position)
  
  translate(x, y); //redefine where (0,0) is 
  //don't have to find coordinates everytime
  
  skin();
  hair();
  eye(100,200); //left
  eye(300,200); //right
  mouth();
  
  popMatrix(); //go back to previous settings

}

void skin() {
  fill(blue);
  stroke(black);
  strokeWeight(3);
  rect(0,0,400,400);
}

void hair() {
  strokeWeight (25);
  int x=0;
  while (x<=400) {
    line(x,-50,x,50);
    x=x+50;
  }
//put strokeWeight back to normal
   strokeWeight (3);
}

void eye(int x, int y) {
  fill(beige);
  ellipse (x,y,100,50); //white part
  fill (red);
  circle (x,y,50); //pupil
  fill(black);
  circle(x,y,25); //center
}

void mouth() {
  fill(beige);
  rect(100,250,200,100); //mouth
  line(100,300,300,300); //teeth
  line(150,250,150,350);
  line(200,250,200,350);
  line(250,250,250,350);
}

// Rotate the coordinate system by 45 degrees
      //rotate(radians(45));

      // Draw a rectangle (it will appear tilted)
      //rect(50, 50, 100, 100);
