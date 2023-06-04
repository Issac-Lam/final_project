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
 
 boolean isValidMove(int x, int y) {
    int gridX = x / gridsize;
    int gridY = y / gridsize;

    return gridX >= 0 && gridX < 20 && gridY >= 0 && gridY < 15 && !walls[gridX][gridY];
}
 
boolean canSeePacman() {
    int startX = ghostX / gridsize;
    int startY = ghostY / gridsize;
    int targetX = pacmanX / gridsize;
    int targetY = pacmanY / gridsize;

    int dx = targetX - startX;
    int dy = targetY - startY;
    int absDx = abs(dx);
    int absDy = abs(dy);
    int signDx;
      if(dx > 0) signDx = 1; else signDx = -1;
    int signDy;
      if(dy > 0) signDy = 1; else signDy = -1;

    int x = startX;
    int y = startY;
    int notVisible = absDx - absDy;

    while (x != targetX || y != targetY) {
        if (walls[x][y]) return false;

        int notVisible2 = notVisible * 2;
        if (notVisible2 > -absDy) { notVisible -= absDy; x += signDx; }
        if (notVisible2 < absDx) { notVisible += absDx; y += signDy; }
    }

    return true;
}
 
void moveGhost() {
    if (canSeePacman()) {
        chasePacman();
    } else {
        moveRandomly();
    }
}
 
void chasePacman() {
        int targetX = pacmanX;
        int targetY = pacmanY;

        // Calculate the direction to move towards Pac-Man
        int dx = 0;
        int dy = 0;

        if (ghostX < targetX) {
            dx = 1; // Move right
        } else if (ghostX > targetX) {
            dx = -1; // Move left
        }

        if (ghostY < targetY) {
            dy = 1; // Move down
        } else if (ghostY > targetY) {
            dy = -1; // Move up
        }

        // Calculate the new position
        int newGhostX = ghostX + dx * ghostSpeed;
        int newGhostY = ghostY + dy * ghostSpeed;

        if (isValidMove(newGhostX, newGhostY)) {
            ghostX = newGhostX;
            ghostY = newGhostY;
        }
    }
void moveRandomly() {
        // Choose a random direction
        int[] randomDirection = possibleDirections.get((int) random(possibleDirections.size()));
        int dx = randomDirection[0];
        int dy = randomDirection[1];

        // Calculate the new position
        int newGhostX = ghostX + dx * ghostSpeed;
        int newGhostY = ghostY + dy * ghostSpeed;

        // Check if the new position is valid (not hitting a wall)
        if (isValidMove(newGhostX, newGhostY)) {
            ghostX = newGhostX;
            ghostY = newGhostY;
        }
    }
 
}
