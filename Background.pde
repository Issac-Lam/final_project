PVector dot;
PVector pos;
PVector dir = new PVector(0,0);
ArrayList<PVector> man = new ArrayList<PVector>();
int x = 0;
int y = 0;
int dotSize = 10;
int w,h;

void setup() {
  size(1080, 720);
  w = width/size;
  h = height/size;
  
  pos = new PVector(w/2, h/2); // Initial position
  newDot(); // create 2D vector
  
  noStroke();
  fill(0);
}

void draw() {
  background(255);
  drawSnake();
  drawDot();
  
  // update snake if frameCount is a multiple of spd which is 20 at the begining
  if(frameCount % spd == 0) {
    updateSnake();   
  }
}

void drawDot(){
  fill(255,255,255);
  square(dot.x*size, dot.y*size, size);
}

void newDot(){
  dot = new PVector(0,0);
}

void keyPressed() {
 if(keyCode == UP) {
    dir = new PVector(x,y-1);
   }
   else if(keyCode == DOWN) {
    dir = new PVector(x,y+1);
   }
   else if(keyCode ==LEFT) {
    dir = new PVector(x-1,y);
   }
   else if(keyCode == RIGHT) {
    dir = new PVector(x+1,y);
   }
}

