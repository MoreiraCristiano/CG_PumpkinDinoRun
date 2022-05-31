class ScGame {
  ScGame() {
  }

  void drawGame() {
    imageMode(CORNER);
    image(background, x, 0);
    image(background, x + background.width, 0);
    x -= xSpeed;
    vertical += 1;
    y += vertical;
    if (y >= yLimit) y = yLimit;
    if (y < 255) y = 383;
    if (x == -background.width) x = 0;

    for (int i = 0; i < 2; i++) {
      image(obstacle2, wallx[i], 400);

      // colisao obstaculo em dino
      if (wallx[i] < 90) {
        wallx[i] = width;
      }

      Ball[] balls =  {
        new Ball(230, y + 30, 30),
        new Ball(wallx[i] + 25, 415, 30)
      };

      for (Ball b : balls) {
        b.display();
        b.checkBoundaryCollision();
      }
      balls[0].checkCollision(balls[1]);

      // Score
      if (wallx[i] < obstacleColisionPixel) {
        score++;
        scoreCounter = score / 60;
      }

      // Velocidade de movimento do obstaculo
      wallx[i] -= wallxSpeedy;
    }

    // Score show
    fill(255);
    textSize(25);
    text("Score: " + scoreCounter, 55, 10);

    // Dificuldade média
    if (scoreCounter > 5) {
      wallxSpeedy = 9;
      wallxSpeedy = 10;
    }

    // Dificuldade dificil
    if (scoreCounter > 10) {
      wallxSpeedy = 14;
      wallxSpeedy = 15;
    }

    if ((millis() - time) > 115) {
      time = millis();
      if (sp == true) {
        sp = false;
      } else {
        sp = true;
      }
    }

    if (sp == true) {
      image(jackRun, width / 3, y);
      image(spriteDinoRun, 0, 270);
    } else {
      image(jackRun2, width / 3, y);
      image(spriteDinoRun2, 0, 270);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode  == UP) {
      vertical = -15;
      jumpSound();
    }
    sound_jump.rewind();
  }
}

//void mouseClicked() {
//  println(mouseX + "," + mouseY);
//}
