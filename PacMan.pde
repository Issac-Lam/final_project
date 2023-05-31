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

int level;
int direction;
boolean[][] walls;
boolean[][] dots;
boolean pressed = true;

boolean gameStarted;
boolean gameOver;

pacman pac = new pacman();
ghost g = new ghost();
general gen = new general();

void setup() {
  size(800,600);
  startGame();

   }


  void startGame() {
      pacmanX = 9 * gridsize + gridsize / 2;
      pacmanY = 7 * gridsize + gridsize / 2;
        
      ghostX = 9 * gridsize + gridsize / 2;
      ghostY = 4 * gridsize + gridsize / 2;
        
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
    
        for(int i = 1; i < 14; i++) {
          for(int j = 1; j < 19; j += 13) {
            walls[i][j] = true;
          }
        }
            
        walls[0][0] = true;
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
        walls[0][14] = true;

        walls[19][0] = true;
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
        walls[19][14] = true;

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

        walls[2][3] = true;
        walls[2][4] = true;
        walls[2][5] = true;
        walls[2][6] = true;
        //walls[2][7] = true;
        walls[2][8] = true;
        walls[2][9] = true;
        walls[2][10] = true;
        walls[2][11] = true;

        walls[17][3] = true;
        walls[17][4] = true;
        walls[17][5] = true;
        walls[17][6] = true;
        //walls[17][7] = true;
        walls[17][8] = true;
        walls[17][9] = true;
        walls[17][10] = true;
        //walls[17][11] = true;

        walls[8][1] = true;
        //walls[8][2] = true;
        walls[8][3] = true;
        walls[8][4] = true;
        walls[8][5] = true;
        walls[8][6] = true;
        walls[8][7] = true;
        //walls[8][8] = true;
        walls[8][9] = true;
        walls[8][10] = true;
        //walls[8][11] = true;
        walls[8][12] = true;

        walls[11][1] = true;
        walls[11][2] = true;
        walls[11][3] = true;
        walls[11][4] = true;
        walls[11][5] = true;
        walls[11][6] = true;
        //walls[11][7] = true;
        walls[11][8] = true;
        walls[11][9] = true;
        walls[11][10] = true;
        walls[11][11] = true;
        walls[11][12] = true;

        walls[2][6] = true;
        walls[3][6] = true;
        walls[4][6] = true;
        walls[5][6] = true;
        walls[6][6] = true;
        walls[7][6] = true;
        walls[8][6] = true;
        walls[9][6] = true;
        walls[10][6] = true;
        walls[11][6] = true;
        walls[12][6] = true;
        walls[13][6] = true;
        walls[14][6] = true;
        walls[15][6] = true;
        walls[16][6] = true;
        walls[17][6] = true;

        walls[2][9] = true;
        walls[3][9] = true;
        walls[4][9] = true;
        walls[5][9] = true;
        walls[6][9] = true;
        walls[7][9] = true;
        walls[8][9] = true;
        walls[9][9] = true;
        walls[10][9] = true;
        walls[11][9] = true;
        walls[12][9] = true;
        walls[13][9] = true;
        walls[14][9] = true;
        walls[15][9] = true;
        walls[16][9] = true;
        //walls[17][9] = true;
            

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


class general {

void displayStartMessage() {
        fill(255);
        textSize(40);
        textAlign(CENTER, CENTER);
        text("Press any key to start", width / 2, height / 2);
    }
    
void displayGameOver() {
        fill(255);
        textSize(40);
        textAlign(CENTER, CENTER);
        text("Game Over!", width / 2, height / 2 - 40);
        text("Press any key to restart", width / 2, height / 2 + 40);
    }

void gameOver(String txt) {
        gameOver = true;
        fill(255);
        textSize(40);
        textAlign(CENTER, CENTER);
        text(txt, width / 2, height / 2 - 40);
        text("Final Score: " + score, width / 2, height / 2 + 40);
    }

void ghostCollision() {
        float distance = dist(pacmanX, pacmanY, ghostX, ghostY);
        
        if (distance < pacmanRadius + ghostRadius) {
            if (score >= 10) {
                score -= 10;
            } else {
                gameOver("Game Over!");
            }
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

    @Override
    void keyPressed() {
        if (!gameStarted || gameOver) {
            gameStarted = true;
            gameOver = false;
            startGame();
        }
    }