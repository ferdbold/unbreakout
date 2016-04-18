// Breakout // // 28/02/2007
// Steph Thirion - Game Mod workshop: < http://trsp.net/teaching/gamemod >
//
// english version :)
// made with Processing 0124 Beta

Rectangle gameFrame;
Brick[] bricks;
Paddle[] paddles;
Ball[] balls;

int frameNum = 0;

// SCREEN PROPERTIES --
int displayWidth = 400;
int displayHeight = 400;
int[] backgroundColor;
boolean backgroundRefreshes = true;

// GAME FRAME PROPERTIES
int gameFrameWidth = 300;
int gameFrameHeight = 300;
color gameFrameStroke = #FFFFFF;
boolean gameFrameHasStroke = false;
color gameFrameFill = #000000;
int opacityOfRefresh = 255;
boolean gameFrameRefreshes = true;

int recX = (displayWidth-gameFrameWidth)/2;
int recY = (displayHeight-gameFrameHeight)/2;

// SETUP FUNCTION --
void setup() {
  backgroundColor = new int[] { 0, 15, 30 };

  size(displayWidth,displayHeight,P3D);
  background(color(backgroundColor[0], backgroundColor[1], backgroundColor[2]));
  frameRate(60);

  // create objects
  gameFrame = new Rectangle(gameFrameWidth, gameFrameHeight, gameFrameHasStroke, gameFrameStroke, true, gameFrameFill);
  gameFrame.opacity = opacityOfRefresh;
  createBricks();
  createBalls();
  paddles = new Paddle[] {
    new ReversePaddle(),
    new HorizontalPaddle(),
    new VerticalPaddle(),
    new MovingPaddle(20, 20),
    new MovingPaddle(45, 102),
    new MovingPaddle(100, 50),
    new MovingPaddle(110, 60),
    new MovingPaddle(gameFrameWidth-30, 15),
    new MovingPaddle(gameFrameWidth-60, 65),
    new MovingPaddle(gameFrameWidth-85, 32)
  };

  refreshScreen();
}

// DRAW FUNCTION --
void draw() {
  refreshScreen();

  saveScreenshots();
}

void createBalls(){
  // BALL(S) PROPERTIES --
  int numberOfBalls = 1;
  int yBalls = 150;

  balls = new Ball[numberOfBalls];
  for (int i=0; i<numberOfBalls; i++){
    int x = i*20;
    balls[i] = new Ball(x, yBalls);
  }
}

void createBricks(){
  // BRICK GROUP PROPERTIES --
  int numberOfBricks = 0;
  int bricksPerRow = 10;
  int brickWidth = gameFrameWidth/bricksPerRow;
  int brickHeight = 10;
  boolean brickHasStroke = false;
  color brickStroke = #ffffff;
  boolean brickHasFill = true;
  color brickFill = #ff0000;
  int yBricks = 50;
  color[] rowsColors = {#ff00ff, #ff0000, #ff9900, #ffff00, #00ff00, #00ffff};

  // CREATE BRICKS --
  bricks = new Brick[numberOfBricks];
  for (int i=0; i<numberOfBricks; i++){
    int rowNum = i/bricksPerRow;
    // coords
    int x = brickWidth*i;
    x -= rowNum*bricksPerRow*brickWidth;
    int y = yBricks+i/bricksPerRow*brickHeight;
    // color
    int num = min(rowNum, rowsColors.length-1);
    color rowColor = rowsColors[num];
    // create brick
    bricks[i] = new Brick(x, y, brickWidth, brickHeight, brickHasStroke, brickStroke, brickHasFill, rowColor);
  }
}

void refreshScreen() {
  // BACKGROUND
  if (backgroundRefreshes) {
    for (int i = 0; i < backgroundColor.length; i++) {
      backgroundColor[i] = constrain(backgroundColor[i] + int(random(-1, 1)), 0, 255);
    }
    background(color(backgroundColor[0], backgroundColor[1], backgroundColor[2]));
  }

  // GAME FRAME
  if (gameFrameRefreshes) {
    gameFrame.drawYourself();
  }

  // PADDLE
  for (int i = 0; i < paddles.length; i++) {
    paddles[i].refresh();
  }

  // BRICKS
  for (int i=0; i<bricks.length; i++) {
    bricks[i].refresh();
  }
  // BALLS
  for (int i=0; i<balls.length; i++) {
    balls[i].refresh();
  }
}

// be careful with this function - only change if you know what you're doing
// the hard disk could fill up with images in a few minutes
//
//
// press the 'G' key to save frames in TGA pictures in 'saved' folder
//
void saveScreenshots(){
  frameNum++;
  if (keyPressed) {
    if (key == 'g' || key == 'G') {
      if (frameNum%2==0) {
        saveFrame("saved/frame-####.tga");
      }
    }
  }
}
