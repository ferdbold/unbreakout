// VERTICAL PADDLE
// This paddle is vertical instead of horizontal

public class VerticalPaddle extends Paddle {
  VerticalPaddle() {
    int swap = width;
    width = height;
    height = swap;

    rectangle = new Rectangle(width, height, hasStroke, strokeColor, hasFill, fillColor);
    rectangle.setPosition(x, y);
  }

  void updatePosition() {
    y = mouseX-recX-width/2;
    y = constrain(y, 0, gameFrameHeight-height);
  }
}
