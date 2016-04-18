// REVERSE PADDLE
// This paddle goes opposite of the mouse position

public class ReversePaddle extends Paddle {

  void updatePosition() {
    x = (displayWidth-mouseX)-recX-width/2;
    x = constrain(x, 0, gameFrameWidth-width);

    y = (displayHeight-mouseY)-recY-height/2;
    y = constrain(y, 0, gameFrameHeight-height);
  }
}
