class ghost {

void drawGhost() {
  fill(255, 0, 0); 
  ellipse(ghostX, ghostY, ghostRadius * 2, ghostRadius * 2);
}
  
void moveGhost() {
   int nextX = ghostX;
   int nextY = ghostY;
   if (ghostX < pacmanX) {
      nextX += ghostSpeed;
   } 
   else if (ghostX > pacmanX) {
      nextX -= ghostSpeed;
   }
        
   if (ghostY < pacmanY) {
      nextY += ghostSpeed;
   } 
   else if (ghostY > pacmanY) {
      nextY -= ghostSpeed;
   }
    if(!walls[nextX/gridsize][nextY/gridsize]) {
     ghostX = nextX;
     ghostY = nextY;
    }
 //if the pixel in front is blue then change directions (random?)
 //
 
 }
 
}
