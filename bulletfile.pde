class Bullet extends GameObject {
  int timer;
  boolean fromUFO;

  Bullet(float x,float y,PVector shipDir,PVector shipVel){
    //player bullet fired -> ship dir+ship vel.+X long time exist
    loc=new PVector(x,y);
    vel=new PVector(0,0);
    dead=false;

    float dx=shipDir.x;
    float dy=shipDir.y;
    float m=dist(0,0,dx,dy);
    if(m>0){
      dx=(dx/m)*10;
      dy=(dy/m)*10;
    }

    vel.x=dx+shipVel.x;
    vel.y=dy+shipVel.y;

    timer=90;
    fromUFO=false;
  }

  Bullet(float x,float y,PVector v,boolean isFromUFO){
    //try to determine if from UFO->generic bullet=longer
    loc=new PVector(x,y);
    vel=new PVector(v.x,v.y);
    dead=false;
    timer=240;
    fromUFO=isFromUFO;
  }

  void act(){
    //moves+disappears+wraps ard screen
    loc.x+=vel.x;
    loc.y+=vel.y;

    timer--;
    if(timer<0) timer=0;
    if(timer==0) dead=true;

    wrapAround();
  }

  void show(){
    //drawplayer vs bullets
    noStroke();
    if(fromUFO) fill(255,120,120);
    else fill(255,255,100);
    ellipse(loc.x,loc.y,5,5);
  }

  void wrapAround(){
    //screen wrap for bullets
    float r=5;
    if(loc.x<-r) {
      loc.x=width+r;
    }
    else if(loc.x>width+r) {
      loc.x=-r;
    }
    if(loc.y<-r) {
      loc.y=height+r;
    }
    else if(loc.y>height+r) {
      loc.y=-r;
    }
  }
}
