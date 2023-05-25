void draw() {
  if(keyPressed && pressed) {
    if(key == ENTER) {
      pressed = false;
      background(0);
        
      pac.movePacman();
      g.moveGhost();
        
      pac.drawPacman();
      g.drawGhost();
        
  // Display score
  fill(255);
  text("Score: " + score, 10, 20);
        
  if (dotsRemaining == 0) {
//      gameOver("You Win!");
        }
    }
  }
}

class menu {

  void setMenu() {
   background(0);
   rect(0, 0, width, 10); // Top
   rect(width-10, 0, 10, height); // Right
   rect(0, height-10, width, 10); // Bottom
   rect(0, 0, 10, height); // Left
  
    //Title

  }
  
}

class general {

void gameOver(String txt) {
    clear();
    m.setMenu();
}

void ghostCollision() {
  if(ghostX == pacmanX && ghostY == pacmanY) {
    gameOver("You lost...");
  }
}

void mazeCollision() {

}

}

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
   if (keyCode == UP && pacmanY > 0) {
      pacmanY -= pacmanSpeed;
      direction = UP;
   } 
   else if (keyCode == DOWN && pacmanY < height) {
      pacmanY += pacmanSpeed;
      direction = DOWN;
   } 
   else if (keyCode == LEFT && pacmanX > 0) {
      pacmanX -= pacmanSpeed;
      direction = LEFT;
   }
   else if (keyCode == RIGHT && pacmanX < width) {
      pacmanX += pacmanSpeed;
      direction = RIGHT;
   }
 }
}

}

class ghost {

void drawGhost() {
  fill(255, 0, 0); 
  ellipse(ghostX, ghostY, ghostRadius * 2, ghostRadius * 2);
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
 
}


