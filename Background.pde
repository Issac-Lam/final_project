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

pacman pac = new pacman();
ghost g = new ghost();

void setup() {
  size(800,600);
  pacmanX = width / 2;
  pacmanY = height / 2;
        
  ghostX = width / 2;
  ghostY = height / 3;
        
  direction = RIGHT;
  score = 0;
  dotsRemaining = 50;
  createMap();

   }
   //m.setMenu();


  void createMap() {

      walls = new boolean[width / gridsize][height / gridsize];
      dots = new boolean[width / gridsize][height / gridsize];
        
        // Generate walls, dots, and power pellets on the grid
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
            
            
            
            walls[1][2] = true;
            walls[3][2] = true;
            walls[4][2] = true;
            walls[5][2] = true;
            walls[6][2] = true;
            walls[7][2] = true;
            walls[8][2] = true;
            walls[9][2] = true;
            walls[10][2] = true;
            walls[11][2] = true;
            
            walls[1][3] = true;
            walls[11][3] = true;
            
            walls[1][4] = true;
            walls[4][4] = true;
            walls[5][4] = true;
            walls[6][4] = true;
            walls[8][4] = true;
            walls[9][4] = true;
            walls[11][4] = true;
            
            walls[1][5] = true;
            walls[4][5] = true;
            walls[5][5] = true;
            walls[6][5] = true;
            walls[8][5] = true;
            walls[9][5] = true;
            walls[11][5] = true;
            
            walls[1][6] = true;
            walls[4][6] = true;
            walls[5][6] = true;
            walls[6][6] = true;
            walls[7][6] = true;
            walls[8][6] = true;
            walls[9][6] = true;
            walls[11][6] = true;
            
            walls[1][7] = true;
            walls[4][7] = true;
            walls[6][7] = true;
            walls[7][7] = true;
            walls[8][7] = true;
            walls[9][7] = true;
            walls[11][7] = true;
            
            walls[1][8] = true;
            walls[3][8] = true;
            walls[4][8] = true;
            walls[5][8] = true;
            walls[6][8] = true;
            walls[7][8] = true;
            walls[8][8] = true;
            walls[9][8] = true;
            walls[10][8] = true;
            walls[11][8] = true;
            walls[12][8] = true;
            

            for(int i = 1; i < width / gridsize - 1; i++) {
                for (int j = 1; j < height / gridsize - 1; j++) {
                    dots[i][j] = true;
                    dotsRemaining++;
                }
            }
  }



void draw() {

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
}

//class menu {

//  void setMenu() {
//   background(0);
//   rect(0, 0, width, 10); // Top
//   rect(width-10, 0, 10, height); // Right
//   rect(0, height-10, width, 10); // Bottom
//   rect(0, 0, 10, height); // Left
  
//    //Title

//  }
  
//}

class general {

void gameOver(String txt) {
    clear();
    //m.setMenu();
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
