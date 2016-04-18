// HORIZONTAL PADDLE
// This paddle is fixed horizontally

public class HorizontalPaddle extends Paddle {

  HorizontalPaddle() {
    super();
    y = gameFrameHeight/2;
  }

  void updatePosition() {
    x = mouseY-recY-height/2;
    x = constrain(x, 0, gameFrameWidth-width);
  }
}
