size(600,600);
background(255);
colorMode(HSB);

int d=1200;
while(d>=0){
  noStroke();
 float b=map(d,600,0,0,255);//glowy ball
fill(100,255,b);
//HSB:hue, saturation, brightness
ellipse(300,300,d,d);
d=d-10;//get smaller
}
