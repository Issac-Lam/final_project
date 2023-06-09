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
int ghostDx;
int ghostDy;
int ghostMoveCounter = 0;

int score;
int dotsRemaining;

int level;
int direction;
boolean[][] walls;
boolean[][] dots;
boolean pressed = true;

boolean gameStarted;
boolean gameOver;

ArrayList<int[]> possibleDirections;

pacman pac = new pacman();
ghost g = new ghost();
general gen = new general();

void setup() {
  size(800,600);
  startGame();

   }


   void startGame() {
      pacmanX = 9 * gridsize + gridsize / 2;
      pacmanY = 8 * gridsize + gridsize / 2;
        
      ghostX = 9 * gridsize + gridsize / 2;
      ghostY = 4 * gridsize + gridsize / 2;
      
      possibleDirections = new ArrayList<>();
      possibleDirections.add(new int[]{0, -1}); // Up
      possibleDirections.add(new int[]{0, 1});  // Down
      possibleDirections.add(new int[]{-1, 0}); // Left
      possibleDirections.add(new int[]{1, 0});  // Right
      
      direction = RIGHT;
      score = 0;
      dotsRemaining = 50;
    
      walls = new boolean[width / gridsize][height / gridsize];
      dots = new boolean[width / gridsize][height / gridsize];
        
        for (int i = 0; i < width / gridsize; i++) {
            for (int j = 0; j < height / gridsize; j++) {
                walls[i][j] = false;
                dots[i][j] = false;
            }
        }
            
        //walls[0][0] = true;
        walls[0][1] = true;
        walls[0][2] = true;
        walls[0][3] = true;
        walls[0][4] = true;
        walls[0][5] = true;
        walls[0][6] = true;
        walls[0][7] = true;
        walls[0][8] = true;
        walls[0][9] = true;
        walls[0][10] = true;
        walls[0][11] = true;
        walls[0][12] = true;
        walls[0][13] = true;
        //walls[0][14] = true;

        //walls[19][0] = true;
        walls[19][1] = true;
        walls[19][2] = true;
        walls[19][3] = true;
        walls[19][4] = true;
        walls[19][5] = true;
        walls[19][6] = true;
        walls[19][7] = true;
        walls[19][8] = true;
        walls[19][9] = true;
        walls[19][10] = true;
        walls[19][11] = true;
        walls[19][12] = true;
        walls[19][13] = true;
        //walls[19][14] = true;

        walls[1][1] = true;
        walls[2][1] = true;
        walls[3][1] = true;
        walls[4][1] = true;
        walls[5][1] = true;
        walls[6][1] = true;
        walls[7][1] = true;
        walls[8][1] = true;
        walls[9][1] = true;
        walls[10][1] = true;
        walls[11][1] = true;
        walls[12][1] = true;
        walls[13][1] = true;
        walls[14][1] = true;
        walls[15][1] = true;
        walls[16][1] = true;
        walls[17][1] = true;

        walls[1][13] = true;
        walls[2][13] = true;
        walls[3][13] = true;
        walls[4][13] = true;
        walls[5][13] = true;
        walls[6][13] = true;
        walls[7][13] = true;
        walls[8][13] = true;
        walls[9][13] = true;
        walls[10][13] = true;
        walls[11][13] = true;
        walls[12][13] = true;
        walls[13][13] = true;
        walls[14][13] = true;
        walls[15][13] = true;
        walls[16][13] = true;
        walls[17][13] = true;

        //walls[2][3] = true;
        //walls[2][4] = true;
        walls[2][5] = true;
        walls[2][6] = true;
        //walls[2][7] = true;
        //walls[2][8] = true;
        walls[2][9] = true;
        walls[2][10] = true;
        walls[2][11] = true;

        //walls[17][3] = true;
        //walls[17][4] = true;
        walls[17][5] = true;
        walls[17][6] = true;
        //walls[17][7] = true;
        //walls[17][8] = true;
        walls[17][9] = true;
        walls[17][10] = true;
        walls[17][11] = true;
        //walls[17][12] = true;

        walls[8][1] = true;
        //walls[8][2] = true;
        //walls[8][3] = true;
        //walls[8][4] = true;
        walls[8][5] = true;
        walls[8][6] = true;
        walls[8][7] = true;
        //walls[8][8] = true;
        walls[8][9] = true;
        //walls[8][10] = true;
        //walls[8][11] = true;
        //walls[8][12] = true;

        walls[11][1] = true;
        //walls[11][2] = true;
        //walls[11][3] = true;
        //walls[11][4] = true;
        walls[11][5] = true;
        walls[11][6] = true;
        //walls[11][7] = true;
        //walls[11][8] = true;
        walls[11][9] = true;
        //walls[11][10] = true;
        //walls[11][11] = true;
        //walls[11][12] = true;

        walls[2][7] = true;
        walls[3][7] = true;
        //walls[4][7] = true;
        walls[5][7] = true;
        walls[6][7] = true;
        //walls[7][7] = true;
        walls[8][7] = true;
        walls[9][7] = true;
        walls[10][7] = true;
        walls[11][7] = true;
        //walls[12][7] = true;
        walls[13][7] = true;
        walls[14][7] = true;
        //walls[15][7] = true;
        walls[16][7] = true;
        walls[17][7] = true;

        walls[2][9] = true;
        walls[3][9] = true;
        //walls[4][9] = true;
        walls[5][9] = true;
        walls[6][9] = true;
        //walls[7][9] = true;
        walls[8][9] = true;
        walls[9][9] = true;
        walls[10][9] = true;
        walls[11][9] = true;
        //walls[12][9] = true;
        walls[13][9] = true;
        walls[14][9] = true;
        //walls[15][9] = true;
        walls[16][9] = true;
        //walls[17][9] = true;
        
        walls[18][1] = true;
        walls[18][13] = true;
        walls[2][13] = true;
        walls[4][3] = true;
        walls[5][3] = true;
        walls[6][3] = true;
        walls[4][11] = true;
        walls[5][11] = true;
        walls[6][11] = true;
        walls[13][3] = true;
        walls[14][3] = true;
        walls[15][3] = true;
        walls[13][11] = true;
        walls[14][11] = true;
        walls[15][11] = true;

            for(int i = 1; i < width / gridsize - 1; i++) {
                for (int j = 1; j < height / gridsize - 1; j++) {
                  if(!walls[i][j]) {
                    dots[i][j] = true;
                    dotsRemaining++;
                }
                }
            }
  }



void draw() {

      background(0);
       
      if(gameOver) {
        gen.displayGameOver();
        return;
      }
      if(!gameStarted) {
        gen.displayStartMessage();
        return;
      }
        
      pac.movePacman();
      g.moveGhost();
        
      pac.drawPacman();
      g.drawGhost();
      g.drawGhost();
      g.drawGhost();
        
      gen.ghostCollision();
      gen.dotCollision();   
        
        // Draw walls
        for (int i = 0; i < width / gridsize; i++) {
            for (int j = 0; j < height / gridsize; j++) {
                if (walls[i][j] == true) {
                    fill(0, 0, 255); // Blue color
                    rect(i * gridsize, j * gridsize, gridsize, gridsize);
                }
            }
        }
        
        // Draw dots
        for (int i = 0; i < width / gridsize; i++) {
            for (int j = 0; j < height / gridsize; j++) {
                if (dots[i][j]) {
                    fill(255); // White color
                    ellipse(i * gridsize + gridsize / 2, j * gridsize + gridsize / 2, dotRadius * 2, dotRadius * 2);
                }
            }
        }
        
        if (dotsRemaining == 0) {
            level++;
            if (level <= 2) {
                setup();
            } else {
                gen.gameOver("You Win!");
            }
        }
}

    @Override
    void keyPressed() {
        if (!gameStarted) {
            gameStarted = true;
            gameOver = false;
            startGame();
        }
    }

//-------------------------------------------------------------------------------------------------

class general {

void displayStartMessage() {
        fill(255);
        textSize(40);
        textAlign(CENTER, CENTER);
        text("Press any key to start", width / 2, height / 2);
    }
    
void displayGameOver() {
        fill(255);
        textSize(100);
        textAlign(CENTER, CENTER);
        text("Game Over!", width / 2, height / 2 - 80);
        textSize(40);
        text("Press any key to restart", width / 2, height / 2);
        text("Final Score: " + score, width / 2, height / 2 + 60);
    }

void gameOver(String txt) {
        gameOver = true;
        fill(255);
        textSize(40);
        textAlign(CENTER, CENTER);
        text(txt, width / 2, height / 2 - 40);
    }

void ghostCollision() {
        float distance = dist(pacmanX, pacmanY, ghostX, ghostY);
        
        if (distance < pacmanRadius + ghostRadius) {
                gameOver("Game Over!");
        }
}

void dotCollision() {
        int pacmanGridX = pacmanX / gridsize;
        int pacmanGridY = pacmanY / gridsize;      
  
        if (dots[pacmanGridX][pacmanGridY]) {
            score++;
            dots[pacmanGridX][pacmanGridY] = false;
            dotsRemaining--;
        }
    }
 }
 
//-------------------------------------------------------------------------------------------------
 
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

//-------------------------------------------------------------------------------------------------

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
