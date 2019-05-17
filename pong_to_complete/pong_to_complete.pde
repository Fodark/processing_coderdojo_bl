int punteggio_giocatore_uno;
int punteggio_giocatore_due;

int posizione_giocatore_uno_x;
int posizione_giocatore_uno_y;
int posizione_giocatore_due_x;
int posizione_giocatore_due_y;

int larghezza_giocatori;
int lunghezza_giocatori;

int velocita;

int[] direzioni;

int posizione_palla_x;
int posizione_palla_y;
int direzione_palla_x;
int direzione_palla_y;

int raggio_palla;
int velocita_palla;

void setup() {
  // crea una finestra grande 1280 e 720
  // metti uno sfondo nero
  // metti il colore del disegno bianco
  stroke(255, 255, 255);
  smooth();
  
  punteggio_giocatore_uno = 0;
  punteggio_giocatore_due = 0;
  
  larghezza_giocatori = 10;
  lunghezza_giocatori = 80;
  
  posizione_giocatore_uno_x = 0;
  posizione_giocatore_uno_y = height / 2 - lunghezza_giocatori / 2;
  posizione_giocatore_due_x = width - larghezza_giocatori;
  posizione_giocatore_due_y = height / 2 - lunghezza_giocatori / 2;
  
  // prova a cambiare questo numero, cosa succede?
  velocita = 5;
  direzioni = new int[2];
  direzioni[0] = 0;
  direzioni[1] = 0;
   
  posizione_palla_x = width / 2;
  posizione_palla_y = height / 2;
  direzione_palla_x = 2;
  direzione_palla_y = 1;
  
  raggio_palla = 50;
  velocita_palla = 3;
}

void draw() {
  clear();
  
  // disegna un bordo bianco intorno alla finestra (suggerimento: sono 4 linee diverse)
  // disegna una linea che tagli a metà il campo
  textSize(32);
  
  // disegna i punteggi dei due giocatori in alto
  
  posizione_giocatore_due_y += direzioni[1] * velocita;
  posizione_giocatore_uno_y += direzioni[0] * velocita;
  
  
  // disegna i due giocatori (suggerimento: sono due rettangoli)
  
  circle(posizione_palla_x, posizione_palla_y, raggio_palla);
  
  posizione_palla_x += direzione_palla_x * velocita_palla;
  posizione_palla_y += direzione_palla_y * velocita_palla;
  
  if(posizione_palla_x < raggio_palla / 2) {
    if(posizione_palla_y > posizione_giocatore_uno_y && posizione_palla_y < posizione_giocatore_uno_y + lunghezza_giocatori) {
      direzione_palla_x *= -1;
    } else {
      // aumenta il punteggio di giocatore 2 e porta la palla in mezzo al campo
    }
  }
  
  if(posizione_palla_x > width - raggio_palla / 2) {
    if(posizione_palla_y > posizione_giocatore_due_y && posizione_palla_y < posizione_giocatore_due_y + lunghezza_giocatori) {
      direzione_palla_x *= -1;
    } else {
      // aumenta il punteggio di giocatore 1 e porta la palla in mezzo al campo
    }
  }
  
  if(posizione_palla_y < raggio_palla / 2 || posizione_palla_y > height - raggio_palla / 2) {
    direzione_palla_y *= -1;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      direzioni[1] = -1;
    } else if (keyCode == DOWN) {
      direzioni[1] = 1;
    } 
  } else {
    if (key == 'w') {
      direzioni[0] = -1;
    } else if (key == 's') {
      direzioni[0] = 1;
    } 
  }
}

void keyReleased() {
  if (key == CODED && (keyCode == UP || keyCode == DOWN)) {
      direzioni[1] = 0; 
  } else if (key == 'w' || key == 's') {
      direzioni[0] = 0; 
  }
}
