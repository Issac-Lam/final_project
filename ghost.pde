class ghost {

void drawGhost() {
  fill(255, 0, 0); 
  ellipse(ghostX, ghostY, ghostRadius * 2, ghostRadius * 2);
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

    if (absDx == 0 || absDy == 0) {
            return true;
    }

    int stepX = signDx;
    int stepY = signDy;
    
    float distanceX = (stepX == 1) ? (x + 1) * gridsize - ghostX : ghostX - x * gridsize;
    float distanceY = (stepY == 1) ? (y + 1) * gridsize - ghostY : ghostY - y * gridsize;

    float maxDistance = sqrt(pow(width, 2) + pow(height, 2));
    
    while (distanceX <= maxDistance || distanceY <= maxDistance) {
            if (distanceX <= distanceY) {
                distanceX += absDy * gridsize / absDx;
                x += stepX;
            } else {
                distanceY += absDx * gridsize / absDy;
                y += stepY;
            }

            // Check if the current cell is a wall
            if (walls[x][y]) {
                return false;
            }

            // Check if reached the target cell
            if (x == targetX && y == targetY) {
                return true;
            }
        }

        return false;
}
 
void moveGhost() {
    if (canSeePacman()) {
        chasePacman();
    } else {
        if (ghostMoveCounter == 0) {
           moveRandomly();
        } else {
           continueMoving();
        }
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
    
void continueMoving() {
        // Calculate the new position
        int newGhostX = ghostX + ghostDx * ghostSpeed;
        int newGhostY = ghostY + ghostDy * ghostSpeed;

        if (isValidMove(newGhostX, newGhostY)) {
            ghostX = newGhostX;
            ghostY = newGhostY;
            ghostMoveCounter++;

            // Check if the ghost has moved 'gridsize' pixels in the current direction
            if (ghostMoveCounter == gridsize) {
                ghostMoveCounter = 0;
                determineNewDirection();
            }
        } else {
            determineNewDirection();
        }
}    
    
void determineNewDirection() {
        // Choose a random direction
        int[] randomDirection = possibleDirections.get((int) random(possibleDirections.size()));
        ghostDx = randomDirection[0];
        ghostDy = randomDirection[1];
}    
    
void moveRandomly() {
        determineNewDirection();
        // Calculate the new position
        int newGhostX = ghostX + ghostDx * ghostSpeed;
        int newGhostY = ghostY + ghostDy * ghostSpeed;

        // Check if the new position is valid (not hitting a wall)
        if (isValidMove(newGhostX, newGhostY)) {
            ghostX = newGhostX;
            ghostY = newGhostY;
        }
    }
 
}

