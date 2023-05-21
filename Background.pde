int gridsize = 40;
int pacmanRadius = 15;
int pacmanSpeed = 3;
int ghostRadius = 15;
int ghostSpeed = 2;
int dotRadius = 5;
int pacManX; 
int pacManY; 
int ghostX; 
int ghostY;
int score;
int dotsRemaining;


void setup() {
  size(800,600);
  pacmanX = width / 2;
  pacmanY = height / 2;
        
  ghostX = width / 4;
  ghostY = height / 4;
        
  score = 0;
  dotsRemaining = 50;
  
  for (int i = 0; i < dotsRemaining; i++) {
            int x = (int) random(1, width / gridsize) * gridsize;
            int y = (int) random(1, height / gridsize) * gridsize;
            
            fill(255); // White color
            ellipse(x, y, DOT_RADIUS * 2, DOT_RADIUS * 2);
   }
}

void draw() {
  

void drawDot(){
  fill(255,255,255);
  circle(dot.x*size, dot.y*size, size);
}

void newDot(){
  dot = new PVector(0,0);
}



void keyPressed() {
 if(keyCode == UP) {
    dir = new PVector(x,y-1);
   }
   else if(keyCode == DOWN) {
    dir = new PVector(x,y+1);
   }
   else if(keyCode ==LEFT) {
    dir = new PVector(x-1,y);
   }
   else if(keyCode == RIGHT) {
    dir = new PVector(x+1,y);
   }
}

