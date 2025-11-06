class Asteroid extends GameObject {

  int type;
  float r;

  int angleDeg;
  int angVelDeg;

  Asteroid() {
    //spawns a big asteroid @ a randm place+creates a slow spin
    type=1;
    loc=new PVector(random(width), random(height));
    vel=new PVector(0, 0);
    dead=false;
    float spd=random(1, 2);
    r=32;
    float vx=random(-1, 1);
    float vy=random(-1, 1);
    float m=dist(0, 0, vx, vy);
    if (m<0.0001) {
      vx=1;
      vy=0;
      m=1;
    }
    vel.x=(vx/m)*spd;
    vel.y=(vy/m)*spd;

    //added
    angleDeg=int(random(0, 360));
    if (random(1)<0.5) {
      angVelDeg=1;
    } else {
      angVelDeg=-1;
    }
    //added
  }

  Asteroid(int t, PVector startPos) {
    //spawns a child asteroid (type sets size & speed) @ specific place
    type=t;
    loc=new PVector(startPos.x, startPos.y);
    vel=new PVector(0, 0);
    dead=false;

    float spd;
    if (type==1) {
      r=32;
      spd=random(0.5, 1);
    } else if (type==2) {
      r=22;
      spd=random(1, 1.5);
    } else {
      r=12;
      spd=random(1.5, 2);
    }

    float vx=random(-1, 1);
    float vy=random(-1, 1);
    float m=dist(0, 0, vx, vy);
    if (m<0.0001) {
      vx=1;
      vy=0;
      m=1;
    }
    vel.x=(vx/m)*spd;
    vel.y=(vy/m)*spd;
  }

  void act() {
    //moves the asteroid & wraps ard screen edges & + spin angle
    loc.x+=vel.x;
    loc.y+=vel.y;
    wrapAround();

    //added
    angleDeg+=angVelDeg;
    if (angleDeg>=360) {
      angleDeg-=360;
    }
    if (angleDeg<0) {
      angleDeg+=360;
    }
  }
  //added

  void show() {
    //draws asteroid @ position->rotation makes whole shape spin (X make diff. for smallest type)
    noStroke();
    fill(p1);
    circle(loc.x, loc.y, r*2);

    pushMatrix();
    translate(loc.x, loc.y);

    rotate(frameCount*0.01);

    noStroke();
    if (type==1) {
      beginShape();
      fill(p2);
      vertex(0, -r*0.8);
      vertex(-r*0.6, r*0.7);
      vertex(r*0.6, r*0.7);
      endShape(CLOSE);
    } else if (type==2) {
      rectMode(CENTER);
      fill(p3);
      rect(0, 0, r*0.9, r*0.55);
    } else {
      fill(p4);
      circle(0, 0, r*0.8);
    }
    popMatrix();
  }

  void wrapAround() {
    //opposite side
    float m=r;
    if (loc.x<-m) loc.x=width+m;
    else if (loc.x>width+m) loc.x=-m;
    if (loc.y<-m) loc.y=height+m;
    else if (loc.y>height+m) loc.y=-m;
  }

  void onHit(ArrayList<Asteroid> asts) {
    //handles hits->2X2Xdisappear
    if (type==1) {
      spawnChildren(asts, 2, 2);
    } else if (type==2) {
      spawnChildren(asts, 3, 2);
    }
    dead=true;
  }

  void spawnChildren(ArrayList<Asteroid> asts, int childType, int count) {
    //+ count child asteroids->childType near parent
    int i=0;
    while (i<count) {
      float px=loc.x+random(-4, 4);
      float py=loc.y+random(-4, 4);
      PVector p=new PVector(px, py);
      Asteroid child=new Asteroid(childType, p);
      asts.add(child);
      i++;
    }
  }
}

//FINISHED GAMEOVER 2 CONDITIONS
