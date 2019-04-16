class jugador{
  
  int vidas, puntuacion;
  float velocidad;
  float x,y;
  int spriteAncho;
  int spriteAlto;
  
  float index;
  PImage [] nyanCatSprite = new PImage[7];
  
  jugador(float velocidad_, float x_, float y_){
    this.vidas = 3;
    this.puntuacion =0;
    this.x = x_;
    this.y= y_;
    index = 0; 
    spriteAncho = 80;
    spriteAlto = 50;
    this.velocidad = velocidad_;
    for(int i=0; i < 6; i++){
      nyanCatSprite [i] = loadImage("sprites/Nyan Cat " +(i+1)+".png");
    }
  }  
  
  
  void show(){
    int apoyo = (int) this.index % (nyanCatSprite.length-1);
    imageMode(CENTER);
    image(nyanCatSprite[apoyo], this.x, this.y);
  }

  void animacion(){
    index += velocidad;
  } 
  
  void comer (){
    for(int i= 0; i < comida.size();i++){
      float d = dist(this.x, this.y, comida.get(i).x, comida.get(i).y);
      if( d < spriteAlto && comida.get(i).dulce){
        comida.get(i).reset();
        this.puntuacion++;
        for(int j = 0; j < dificultades.length; j++){
          if(jugador.puntuacion == dificultades[j]){
            dificultad++;
          }
        }
      }else if(d < spriteAlto && !comida.get(i).dulce){
        comida.get(i).reset();
        this.vidas--;
      }
    }
  }
 }
