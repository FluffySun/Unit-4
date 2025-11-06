class GameObject {
  //base constructor (0,0)+0 vel.+X dead
  PVector loc;
  PVector vel;
  boolean dead;

  GameObject(){
    //base constructor @ (x,y)
    loc=new PVector(0,0);
    vel=new PVector(0,0);
    dead=false;
  }

  GameObject(float x,float y){
    loc=new PVector(x,y);
    vel=new PVector(0,0);
    dead=false;
  }

  void act(){
    //default
  }

  void show(){
  }
}
