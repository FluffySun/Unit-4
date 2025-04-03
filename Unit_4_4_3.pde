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
  
  face(100,100,1); //x, y, scale factor
  face(400, 100,0.5);
  face(100,400,0.5);
  face(400,400,0.5);
}

void face (int x, int y, float s) {
  pushMatrix(); //lock to new coordinate (temporary transformation) 
  //not everything moves to same position)
  
  translate(x, y); //redefine where (0,0) is (parameters)
  //don't have to find coordinates everytime
  //scale()-size of shape, rotate()-spin
  scale (s); //happens within pushMatrix, not affect void draw()
  rotate(PI/2); //360=2PI
  //rotate on the tip right now, see how to set where it rotates?
  //->rect(-50,-50,100,100)->that would be the tip then, so then it could rotate in middle (0,0,0,0)
  
  skin();
  hair();
  eye(100,200); //left
  eye(300,200); //right
  eye(200,100); //middle
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

// Rotate the coordinate system by x degrees
      //rotate(radians(x));

      // Draw a shape (it  will appear tilted)
      //rect(50, 50, 100, 100);
