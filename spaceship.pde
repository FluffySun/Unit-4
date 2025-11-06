class Spaceship extends GameObject {
  PVector dir;
  boolean leftkey,rightkey,upkey;
  float sizeShip=25;
  float boundR=sizeShip*1;
  float rotStep=0.05;
  float thrust=0.25;
  float drag=1;
  float maxSpeed=10;
  int cooldown=0;

  Spaceship(float startX,float startY){
    //creates player ship @ start pos.(faceup)
    loc=new PVector(startX,startY);
    vel=new PVector(0,0);
    dir=new PVector(0,-1);
    dead=false;
  }

  void reset(float x,float y){
    //recenter
    loc.x=x;loc.y=y;
    vel.x=0;vel.y=0;
    dir.x=0;dir.y=-1;
    cooldown=0;
  }

  void act(){
    //keys+dir+accelerates+speed+drag+moves+wraps+shoots+spawns particles
    if(leftkey)rotateDir(-rotStep);
    if(rightkey)rotateDir(rotStep);
    if(upkey){vel.x+=dir.x*thrust;vel.y+=dir.y*thrust;}
    if(vel.x>maxSpeed)vel.x=maxSpeed;
    if(vel.x<-maxSpeed)vel.x=-maxSpeed;
    if(vel.y>maxSpeed)vel.y=maxSpeed;
    if(vel.y<-maxSpeed)vel.y=-maxSpeed;
    vel.x=vel.x*drag;vel.y=vel.y*drag;
    loc.x+=vel.x;loc.y+=vel.y;
    wrapAround();
    shoot();
    thrustParticles();
  }

  //how it rotates
  void show(){
    //draws ship+particle
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(dir.heading()+HALF_PI);
    stroke(255);
    noFill();
    strokeWeight(2);
    beginShape();
    vertex(0,-sizeShip*0.8);
    vertex(-sizeShip*0.5,sizeShip*0.6);
    vertex(sizeShip*0.5,sizeShip*0.6);
    endShape(CLOSE);
    if(upkey){
      noStroke();
      fill(255,120,60);
      float f=random(sizeShip*0.2,sizeShip*0.45);
      triangle(0,sizeShip*0.6+f,-sizeShip*0.25,sizeShip*0.6,sizeShip*0.25,sizeShip*0.6);
    }
    popMatrix();
  }

  void rotateDir(float a){
    //draw dir
    float px=-dir.y,py=dir.x;
    dir.x=dir.x+px*a;
    dir.y=dir.y+py*a;
    if(dir.x>1)dir.x=1;
    if(dir.x<-1)dir.x=-1;
    if(dir.y>1)dir.y=1;
    if(dir.y<-1)dir.y=-1;
  }

  void shoot(){
    //fire bullet in dir
    if(cooldown>0)cooldown--;
    if(spacekey&&cooldown==0){
      bullets.add(new Bullet(loc.x,loc.y,dir,vel));
      cooldown=12;
    }
  }

  void thrustParticles(){
    //accelerating part. spawn
    if(upkey){
      int i=0,count=2;
      while(i<count){
        float back=sizeShip*1;
        float bx=loc.x-dir.x*back+random(-2,2);
        float by=loc.y-dir.y*back+random(-2,2);
        float pvx=-dir.x*random(2,3.5)+vel.x*0.2;
        float pvy=-dir.y*random(2,3.5)+vel.y*0.2;
        particles.add(new Particle(bx,by,pvx,pvy,false));
        i++;
      }
    }
  }

  void wrapAround(){
    float m=boundR;
    if(loc.x<-m)loc.x=width+m;
    else if(loc.x>width+m)loc.x=-m;
    if(loc.y<-m)loc.y=height+m;
    else if(loc.y>height+m)loc.y=-m;
  }
}
