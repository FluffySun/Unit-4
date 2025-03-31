//Ema (Anyue) Sun
//3.31
//Top down coding

void setup() {
  size(800, 600);
}

void draw() { //on loop
  background (0);
  
  face(200,100); //x, y
  face(500, -200);
}

void face (int x, int y) {
  pushMatrix(); //lock to new coordinate (temporary transformation) 
  //not everything moves to same position)
  
  translate(x, y); //redefine where (0,0) is 
  //don't have to find coordinates everytime
  
  skin();
  hair();
  eye(); //left
  eye(); //right
  mouth();
  
  popMatrix(); //go back to previous settings

}

void skin() {
  fill(blue);
  stroke(black);
  strokeWeight(3);
  rect(200,100,400,400);
}

// Rotate the coordinate system by 45 degrees
      //rotate(radians(45));

      // Draw a rectangle (it will appear tilted)
      //rect(50, 50, 100, 100);
