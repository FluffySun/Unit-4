void drawButton(String label, float x, float y, float w, float h) {
  //clickable+hover+text center
  rectMode(CORNER);
  boolean over=(mouseX>=x && mouseX<=x+w && mouseY>=y && mouseY<=y+h);
  if(over)fill(200, 200, 200);
  else fill(150, 150, 150);
  stroke(0);
  rect(x, y, w, h, 8);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(14);
  text(label, x+w*0.5, y+h*0.5);
  rectMode(CENTER);
}

void checkButton(float x,float y,float w,float h) {
  //sense mouse inside button
  buttonIsOver=(mouseX>=x && mouseX<=x+w && mouseY>=y && mouseY<=y+h);
}
