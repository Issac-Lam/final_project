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
