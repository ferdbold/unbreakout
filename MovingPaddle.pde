// MOVING PADDLE
// This paddle moves on its own

public class MovingPaddle extends VerticalPaddle {
  float speed;
  int timeOffset = 0;

  MovingPaddle(int xOffset, int myTimeOffset) {
    super();
    speed = random(0.2);
    x = xOffset;
    timeOffset = myTimeOffset;
  }

  void updatePosition() {
    y = int((millis()+timeOffset)%(gameFrameHeight/speed)*speed);
    y = constrain(y, 0, gameFrameHeight-height);
  }
}
