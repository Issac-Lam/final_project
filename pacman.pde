class pacman {

void drawPacman() {
  fill(255, 255, 0); 
  if(direction == RIGHT){
  arc(pacmanX, pacmanY, pacmanRadius * 2, pacmanRadius * 2, 0.5, 2 * PI - 0.5, PIE);
  }
  if(direction == LEFT){
  arc(pacmanX, pacmanY, pacmanRadius * 2, pacmanRadius * 2, -2.5, PI -0.75 , PIE);
  }
  if(direction == UP){
  arc(pacmanX, pacmanY, pacmanRadius * 2, pacmanRadius * 2, -0.75, PI + 0.75 , PIE);
  }
  if(direction == DOWN){
  arc(pacmanX, pacmanY, pacmanRadius * 2, pacmanRadius * 2, 2.25, 2 * PI + 0.75 , PIE);
  }
}
  
void movePacman() {
if(keyPressed){
   int nextX = pacmanX;
   int nextY = pacmanY;
   if (keyCode == UP && pacmanY > 0) {
      nextY -= pacmanSpeed;
      direction = UP;
   } 
   else if (keyCode == DOWN && pacmanY < height) {
      nextY += pacmanSpeed;
      direction = DOWN;
   } 
   else if (keyCode == LEFT && pacmanX > 0) {
      nextX -= pacmanSpeed;
      direction = LEFT;
   }
   else if (keyCode == RIGHT && pacmanX < width) {
      nextX += pacmanSpeed;
      direction = RIGHT;
   }
   
   if(!walls[nextX/gridsize][nextY/gridsize]) {
     pacmanX = nextX;
     pacmanY = nextY;
 }
}

}
}
