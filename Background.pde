int gridsize = 40;
int pacmanRadius = 15;
int pacmanSpeed = 3;
int ghostRadius = 15;
int ghostSpeed = 2;
int dotRadius = 5;
int pacmanX; 
int pacmanY; 
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
            
            fill(255); 
            ellipse(x, y, dotRadius * 2, dotRadius * 2);
   }
}

void draw() {
  background(0);
        
  movePacman();
  moveGhost();
        
  // Draw Pac-Man
  fill(255, 255, 0); 
  arc(pacmanX, pacmanY, pacmanRadius * 2, pacmanRadius * 2, 0.5, 2 * PI - 0.5, PIE);
        
  // Draw Ghost
  fill(255, 0, 0); 
  ellipse(ghostX, ghostY, ghostRadius * 2, ghostRadius * 2);
        
  // Display score
  fill(255);
  text("Score: " + score, 10, 20);
        
  if (dotsRemaining == 0) {
//      gameOver("You Win!");
        }
}

void movePacman() {
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

void moveGhost() {
   if (ghostX < pacmanX) {
      ghostX += ghostSpeed;
   } 
   else if (ghostX > pacmanX) {
      ghostX -= ghostSpeed;
   }
        
   if (ghostY < pacmanY) {
      ghostY += ghostSpeed;
   } 
   else if (ghostY > pacmanY) {
      ghostY -= ghostSpeed;
   }
}

