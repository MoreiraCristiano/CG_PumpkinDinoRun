class ScGame {
  ScGame() {
  }

  void drawGame() {
    imageMode(CORNER);
    image(backgroundGame, x, 0);
    image(backgroundGame, x + backgroundGame.width, 0);
    x -= xSpeed;
    grav += 1;
    y += grav;
    if (y >= yLimit) y = yLimit;
    if (y < 255) y = 383;
    if (x == -backgroundGame.width) x = 0;
    image(obstacle, rollx, 400);

    // Obstacle collides with dino
    if (rollx < 90) {
      rollx = width;
    }

    // Bounding box of collision
    Ball[] balls =  {
      new Ball(230, y + 30, 30),
      new Ball(rollx + 25, 430, 30)
    };

    for (Ball b : balls) {
      b.display();
      b.checkBoundaryCollision();
    }
    balls[0].checkCollision(balls[1]);

    // Score
    if (rollx < obstacleColisionPixel) {
      score++;
      scoreCounter = score / 30;
    }

    // Obstacle speedy
    rollx -= wallxSpeedy;

    // Score show
    fill(255);
    textSize(25);
    text("Score: " + scoreCounter, 55, 10);

    // Mid level
    if (scoreCounter > 5) {
      wallxSpeedy = 9;
      wallxSpeedy = 10;
    }

    // Hard level
    if (scoreCounter > 10) {
      wallxSpeedy = 14;
      wallxSpeedy = 15;
    }

    // Change sprites
    if ((millis() - time) > 115) {
      time = millis();
      if (showSprite == true) {
        showSprite = false;
      } else {
        showSprite = true;
      }
    }

    if (showSprite == true) {
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
      grav = -15;
      jumpSound();
    }
    sound_jump.rewind();
  }
}
