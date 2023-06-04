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
