jugador jugador; 
ArrayList<comida> comida = new ArrayList();
PImage [] comidaSprites = new PImage[6];
PImage corazon;
PImage over;
int dificultades [] = new int[5];
int dificultad;


void setup(){
  size(900, 600);
  corazon = loadImage("sprites/heart.png");
  jugador = new jugador(.3, height/2, width/2);
  
  comidaSprites [0] = loadImage("sprites/cookies.png");
  comidaSprites [1] = loadImage("sprites/piece-of-cake.png");
  comidaSprites [2] = loadImage("sprites/sweet.png");
  comidaSprites [3] = loadImage("sprites/tomato.png");
  comidaSprites [4] = loadImage("sprites/pimientoAmarillo.png");
  comidaSprites [5] = loadImage("sprites/pimiento.png");
  
  over = loadImage("sprites/gameOver.jpg");
  
  
  for(int i = 0; i < dificultades.length; i++){
    dificultades [i] = 10 + 10*i;
  }
  
  for(int i =0; i< 150; i++){
    int supp = (int) random(5);
    boolean dulce = false;
    if(supp < 3){
      dulce = true;
    }
    comida.add(new comida(comidaSprites[supp] , dulce));
  }
  dificultad = 1;
}

void draw(){
  if(jugador.vidas > 0){
    background(073,103,141);
    fill(87, 35, 100);
    noStroke();
    rect(0,0,width,50);
    for(int i = 0; i < jugador.vidas; i++){
      image(corazon, 60*i + 50 , 25);
    }
    jugador.show();
    jugador.animacion();
    for(int i = 0; i < dificultades[dificultad]; i++){
      for(int j = 0; j < dificultades[dificultad]; j++){
        if(i != j){
          float d = dist(comida.get(i).x, comida.get(i).y, comida.get(j).x, comida.get(j).x);
          if(d < 35 &&  (comida.get(i).x > width || comida.get(j).x > width)){
            comida.get(i).reset();
          }
        }
      }
      comida.get(i).show();
      comida.get(i).update();
    }
    jugador.comer();
  }else{
    image(over, width/2, height/2);
  }
}

void keyPressed() {
    if (keyCode  == 38 && jugador.y > jugador.spriteAlto) { // arriba
      jugador.y -= 10;
    }else if (keyCode  == 39 && jugador.x < width- jugador.spriteAncho) { // derecha
      jugador.x += 10;
    }else if (keyCode  == 37 && jugador.x > jugador.spriteAncho) { // izquierda
      jugador.x -= 10;
    }else if (keyCode  == 40 && jugador.y < height-jugador.spriteAlto) { // abajo
      jugador.y += 10;
    }
}
