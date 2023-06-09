
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

boolean isPoweredUp = false; 
int powerUpDuration = 10; 
int powerUpTimer = 0; 

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
        
      ghost1X = 9 * gridsize + gridsize / 2;
      ghost1Y = 4 * gridsize + gridsize / 2;
      
      ghost2X = 5 * gridsize + gridsize / 2;
      ghost2Y = 4 * gridsize + gridsize / 2;
      
      ghost3X = 13 * gridsize + gridsize / 2;
      ghost3Y = 4 * gridsize + gridsize / 2;
        
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

        walls[2][7] = true;
        walls[3][7] = true;
        walls[4][7] = true;
        walls[5][7] = true;
        walls[6][7] = true;
        walls[7][7] = true;
        walls[8][7] = true;
        walls[9][7] = true;
        walls[10][7] = true;
        walls[11][7] = true;
        walls[12][7] = true;
        walls[13][7] = true;
        walls[14][7] = true;
        walls[15][7] = true;
        walls[16][7] = true;
        walls[17][7] = true;

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
        
        walls[18][1] = true;
        walls[18][13] = true;
        walls[2][13] = true;

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

    @Override
    void keyPressed() {
        if (!gameStarted || gameOver) {
            gameStarted = true;
            gameOver = false;
            startGame();
        }
    }

