Pesce pesce;  //hehe,pesce pesce //<>// //<>//
Cibo cibo;
PImage pescio;        //pimage è la classe per gestire la immagini
PImage vermo;
PImage boom;
int punti=0;
class Cibo {
  PVector pos;        //pvector è la classe per gestire coordinate/velocità. Prende 2-3 valori a seconda se lavori in 2d o 3d
  boolean mangiato;
  Cibo() {
    pos=new PVector(random(10, 460), (random(10, 690)));        //spara fuori il vermetto in posizione random  
    mangiato = false;
  }
  void mostra() {
    image(vermo, pos.x, pos.y, 50, 50);      //giusto per visualizzare
  }
  void nuovocibo() {   
    pos=new PVector(random(10, 460), (random(10, 690)));      //funzione per sparare fuori vermetto random
    mangiato = false;
  }
  void controllo() 
  {
    if ((pesce.pos.x+pesce.misura)>=cibo.pos.x &&
      pesce.pos.x<=(cibo.pos.x+pesce.misura)   &&                 //<--- controlla che secondo me ho scazzato qui,sono i controlli per le hitbox.
      (pesce.pos.y+pesce.misura)>=cibo.pos.y   &&                  //Mano a mano che mangia cresce in un modo inaspettato("mangia" prima di quanto dovrebbe,l'immagine non si ingrandisce quanto il quadrato di controllo)
      pesce.pos.y<=(cibo.pos.y+pesce.misura))
      { 
      mangiato=true;
      nuovocibo();
      punti++;
      pesce.misura+=5; //qui dovrebbe inciccire il pesce
      }
  }
}
class Pesce {
  PVector pos;
  PVector vel;
  PVector acc;
  float velmax;
  float misura;
  Pesce() {
    pos= new PVector (width/2, height/2);
    vel= new PVector(0, 0);
    velmax=4;
    misura=50;
  }
  void update() {          //operazioni tra vettori per non stare ad accedere e sommare le singole robe
    PVector mouse= new PVector(mouseX, mouseY);
    PVector acc = PVector.sub(mouse, pos);
    acc.setMag(0.5);
    vel.add(acc);
    vel.limit(velmax);
    pos.add(vel);
  }
  void mostra() {
    rectMode(CENTER);         //la roba center vuole coordinata x,y del centro,poi larghezza e altezza
    image(pescio, pos.x, pos.y, misura, misura);//quadrato,ovviamente
  }
}
void setup() { //sta roba parte solo al lancio
  imageMode(CENTER);
  size (500, 700);
  pesce= new Pesce();
  cibo= new Cibo();
  pescio = loadImage("pesce.jpg");
  vermo=loadImage("verme.jpg");
  boom=loadImage("boom.jpg");
  textSize(32);
}
void draw() {
  background(#6198D3); //colorino bellissimo molto acquettoso 
  text(punti, 100, 100);
  pesce.update();
  pesce.mostra();
  cibo.mostra();
  cibo.controllo();
  if (punti>100) {
  image(boom, 250, 350, 500, 700);  //lel
  }
}
