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
  background(0);
        
  movePacman();
  moveGhost();
  checkCollision();
        
  // Draw Pac-Man
  fill(255, 255, 0); 
  arc(pacmanX, pacmanY, PACMAN_RADIUS * 2, PACMAN_RADIUS * 2, 0.2f, 2 * PI - 0.2f, PIE);
        
  // Draw Ghost
  fill(255, 0, 0); 
  ellipse(ghostX, ghostY, GHOST_RADIUS * 2, GHOST_RADIUS * 2);
        
  // Display score
  fill(255);
  text("Score: " + score, 10, 20);
        
  if (dotsRemaining == 0) {
      gameOver("You Win!");
        }
}

void drawDot(){
  fill(255,255,255);
  circle(dot.x*size, dot.y*size, size);
}

void newDot(){
  dot = new PVector(0,0);
}



void movePacMan() {
if(keyPressed){
   if (keyCode == UP && pacmanY > 0) {
      pacmanY -= pacmanSpeed;
   } 
   else if (keyCode == DOWN && pacmanY < height) {
      pacmanY += pacmanSpeed;
   } 
   else if (keyCode == LEFT && pacmanX > 0) {
      pacmanX -= pacmanSpeed;
   }
   else if (keyCode == RIGHT && pacmanX < width) {
      pacmanX += pacmanSpeed;
   }
}
}

