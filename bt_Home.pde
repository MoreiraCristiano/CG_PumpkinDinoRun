class BtHome extends Button {
  BtHome(float x, float y, int _width, int _height, String _text) {
    super(x, y, _width, _height, _text);
  }
 
 // Escrever outro estilo?
 @Override
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
