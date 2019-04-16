class comida{
  
  PImage comida;
  boolean dulce;
  float x,y;
  float velocidad;
  
  comida(PImage imagen, boolean dulce_){
    x= width+40;
    y = random(70,height-20);
    comida = imagen;
    dulce = dulce_;
    velocidad = random(2, 5);
  }
  
  void show(){
    imageMode(CENTER);
    image(comida, x, y);
  }
  
  void update(){
    this.x -=velocidad;
    if(this.x < 0){
      reset();
    }
  } 
  
  
  void reset(){
    this.y =random(100 ,height-40);
    this.velocidad = random(2, 5);
    this.x = random(width + 60,width+140);
  }
}
