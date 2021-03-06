final int maxSegments = 100;
int[] xSegments = new int[maxSegments];
int[] ySegments = new int[maxSegments];

final int gridSize = 20;

void setup() {
  size(500, 500);
  for (int i = 0; i < maxSegments; i += 1) {
    xSegments[i] = ySegments[i] = -1;
  }
  xSegments[0] = width/2 / gridSize;
  ySegments[0] = width/2 / gridSize;
  snakeLength = 1;
  foodX = 10;
  foodY = 20;
  foodX2= 20;//added for green dot
  foodY2 = 10;//added for green dot
  ellipseMode(CORNER);
}

int lastMove = 0;
int timeBetweenMoves = 500; //initial speed of snake

int xSpeed = 1;
int ySpeed = 0;
int snakeLength;

int foodX;
int foodY;
int foodX2;//green dot food
int foodY2;//green dot food

void draw() {
  background(255);
  noStroke();

  //if (; i < 500; i += 1) {
  fill(0);
  for (int i = 0; i < maxSegments; i += 1) {
    rect(xSegments[i]*gridSize, ySegments[i]*gridSize, gridSize, gridSize);
  }

  fill(255, 0, 0);
  ellipse(foodX * gridSize, foodY * gridSize, gridSize, gridSize);
  
  fill(0, 255, 0);//green dot draw callout
  ellipse(foodX2 * gridSize, foodY2 * gridSize, gridSize, gridSize);

  if (millis() - lastMove > timeBetweenMoves) {
    lastMove = millis();
    int nextX = xSegments[0] + xSpeed;
    int nextY = ySegments[0] + ySpeed;

    for (int i = snakeLength-1; i > 0; i -= 1) {
      xSegments[i] = xSegments[i-1];
      ySegments[i] = ySegments[i-1];
    }
    if (isThereASegmentAtPosition(nextX, nextY)) {
      // snake hit itself! reset the game!
      setup();
    } else {
      xSegments[0] = nextX;
      ySegments[0] = nextY;
      if (nextX == foodX && nextY == foodY) {
        getFood();
      }
      if(nextX == foodX2 && nextY == foodY2) {
        getFood(); //green dot getFood() function
      }
    }
  }
  }
  //} else {
  //  i = 0;

void getFood() {
  snakeLength += 1;
  timeBetweenMoves -= 25; //faster movement

  while (isThereASegmentAtPosition(foodX, foodY)) {
    foodX = floor(random(width/gridSize));
    foodY = floor(random(width/gridSize));
  } 
  while (isThereASegmentAtPosition(foodX2,foodY2)) { //get dot getFood() restrictions
     foodX2 = floor(random(width/gridSize));
    foodY2 = floor(random(width/gridSize));
  } 
}

boolean isThereASegmentAtPosition(int x, int y) {
  for (int i = 0; i < snakeLength; i += 1) {
    if (xSegments[i] == x && ySegments[i] == y) {
      return true;
    }
  }
  return false;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      ySpeed = -1;
      xSpeed = 0;
    }
    if (keyCode == DOWN) {
      ySpeed = 1;
      xSpeed = 0;
    }
    if (keyCode == RIGHT) {
      ySpeed = 0;
      xSpeed = 1;
    }
    if (keyCode == LEFT) {
      ySpeed = 0;
      xSpeed = -1;
    }
  }
}
