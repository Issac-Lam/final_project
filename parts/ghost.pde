class ghost {

int ghostMoveDelay = 0; // Adjust this value to control the speed of the ghost (higher value means slower movement)
int ghostMoveTimer = ghostMoveDelay;
int ghostStepSize = 1; // Move one pixel at a time
int currentDirection = (int) random(4); // Initial random direction
int stepsTaken = 0; // Number of steps taken in the current direction


void drawGhost() {
  fill(255, 0, 0); 
  ellipse(ghostX, ghostY, ghostRadius * 2, ghostRadius * 2);
}
 
 boolean isValidMove(int x, int y) {
    int gridX = x / gridsize;
    int gridY = y / gridsize;

    return gridX >= 0 && gridX < 20 && gridY >= 0 && gridY < 15 && !walls[gridX][gridY];
}

private void moveGhost() {
    ghostMoveTimer--;

    if (ghostMoveTimer > 0) {
        return;
    }

    ghostMoveTimer = ghostMoveDelay;

    int dx = 0;
    int dy = 0;

    // Update the direction of movement based on the current direction
    switch (currentDirection) {
        case 0:
            dx = 1;
            break;
        case 1:
            dx = -1;
            break;
        case 2:
            dy = 1;
            break;
        case 3:
            dy = -1;
            break;
    }

    // Calculate the target position
    int targetX = ghostX + dx * ghostStepSize;
    int targetY = ghostY + dy * ghostStepSize;

    // Check if the ghost can see Pacman
    if (canSeePacman()) {
        // Calculate the direction towards Pacman
        if (pacmanX < ghostX) {
            dx = -1;
        } else if (pacmanX > ghostX) {
            dx = 1;
        }

        if (pacmanY < ghostY) {
            dy = -1;
        } else if (pacmanY > ghostY) {
            dy = 1;
        }

        // Calculate the target position towards Pacman
        targetX = ghostX + dx * ghostStepSize;
        targetY = ghostY + dy * ghostStepSize;
    }

    // Check if the target position is within the maze boundaries and is a valid move (not a wall)
    if (targetX >= 0 && targetX < width && targetY >= 0 && targetY < height
            && !walls[targetX / gridsize][targetY / gridsize]) {
        ghostX += dx * ghostStepSize;
        ghostY += dy * ghostStepSize;
        stepsTaken++;
    }

    // Check if the ghost has taken enough steps in the current direction or has hit a wall
    if (stepsTaken >= gridsize || (dx != 0 && walls[ghostX / gridsize + dx][ghostY / gridsize])
            || (dy != 0 && walls[ghostX / gridsize][ghostY / gridsize + dy])) {
        // Randomly choose a new direction that is different from the current direction
        int newDirection;
        do {
            newDirection = (int) random(4);
        } while (newDirection == currentDirection);

        currentDirection = newDirection;

        // Reset the steps taken
        stepsTaken = 0;
    }
}


private boolean canSeePacman() {
    int dx = Math.abs(pacmanX - ghostX);
    int dy = Math.abs(pacmanY - ghostY);

    // Check if Pacman is within the line of sight of the ghost
    return dx <= gridsize * 3 && dy <= gridsize * 3;
}
}
