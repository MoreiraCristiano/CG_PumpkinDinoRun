class Button {
  float posX, posY;
  int widthScale, heightScale;
  String text;

  Button(float x, float y, int _width, int _height, String _text) {
    posX = x - _width / 2;
    posY = y;
    widthScale = _width;
    heightScale = _height;
    text = _text;
  }

  boolean isMouseInside() {
    boolean isMouseInside = false;

    if (mouseX >= posX && mouseX <= posX +  widthScale && mouseY >= posY && mouseY <= posY + heightScale) {
      isMouseInside = true;
    } else {
      isMouseInside = false;
    }

    return isMouseInside;
  }

  void drawButton(String _text) {
    if (isMouseInside()) {
      strokeWeight(3);
      fill(100);
      rect(posX, posY, widthScale, heightScale);
      fill(255);
      textSize(20);
      textAlign(CENTER, CENTER);
      text(_text, posX + widthScale / 2, posY + heightScale / 2);
    } else {
      strokeWeight(2);
      fill(200);
      rect(posX, posY, widthScale, heightScale);
      fill(0);
      textSize(20);
      textAlign(CENTER, CENTER);
      text(_text, posX + widthScale / 2, posY + heightScale / 2);
    }
  }
}
