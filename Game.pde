/*
  * Projeto          : Pumpkin Dino Run.
  * Disciplina       : Computação Gráfica 7 semestre - Engenharia de computação - USF
  * Desenvolvedores  : Anne Frank Marques Reis
                       Cristiano Moreira do Amaral
                       Lucas Sarnelli Biazetto
                       Vivaldo Roni Stein Hermes
*/

import ddf.minim.*;

// All global variables are declared here
Minim sound_manager;
AudioPlayer sound_dead;
AudioPlayer sound_game;
AudioPlayer sound_mainMenu;
AudioPlayer sound_jump;
Screens gameScreens = new Screens();
boolean showMenu = true;
boolean startGame = false;
boolean showRules = false;
boolean showCredits = false;
boolean showSprite = false;
PImage spriteDinoRun, spriteDinoStop, spriteDinoDead, spriteDinoRun2, jackRun, jackRun2, obstacle;
PImage backgroundMainMenu, backgroundRules, backgroundCredits, backgroundGame;
int rollx;
int wallxSpeedy = 6;
int grav = 1;
int x = -200;
int y = 370;
int xSpeed = 5;
int yLimit = y;
int score = 0;
int scoreCounter = 0;
int obstacleColisionPixel = 265;
int time;

void setup() {
  // Screen size
  size(600, 600);

  // Background of main menu and background game
  backgroundGame = loadImage("./Assets/backgrounds/bg-game.jpg");
  backgroundMainMenu = loadImage("./Assets/backgrounds/BG_Inicio.jpg");

  // Obstacles Sprites and resize
  obstacle = loadImage("./Assets/obstacles/obstacle1.png");
  obstacle.resize(50, 50);

  // Jack sprites and resize
  jackRun = loadImage("./Assets/sprite_jack/jack1.png");
  jackRun2 = loadImage("./Assets/sprite_jack/jack3.png");
  jackRun.resize(75, 85);
  jackRun2.resize(75, 85);

  // Dino Sprite and resize
  spriteDinoRun = loadImage("./Assets/sprite_dino/dino_run.png");
  spriteDinoRun2 = loadImage("./Assets/sprite_dino/dino_run2.png");
  spriteDinoRun.resize(200, 200);
  spriteDinoRun2.resize(200, 200);

  // Sounds and sound manager
  sound_manager = new Minim(this);
  sound_game = sound_manager.loadFile("./Assets/sounds/background_game_sound2.mp3");
  sound_dead = sound_manager.loadFile("./Assets/sounds/dead2.mp3");
  sound_mainMenu = sound_manager.loadFile("./Assets/sounds/sound_menu.mp3");
  sound_jump = sound_manager.loadFile("./Assets/sounds/jump_sound.mp3");
}

void draw() {
  if (showMenu) {
    gameScreens.mainMenu();
    mainMenuSound();
  }

  if (showRules) {
    gameScreens.rules();
  }

  if (showCredits) {
    gameScreens.credits();
  }

  if (startGame) {
    sound_mainMenu.mute();
    gameScreens.startGame();
    playingSound();
  }
}

void endGame() {
  deadSound();
  sound_game.mute();
  sound_game.rewind();
  showMenu = true;
  startGame = false;
  delay(1500);

  if (showMenu) {
    stroke(0);
    mainMenuSound();
    showMenu = true;
  }
}

void playingSound() {
  sound_game.play();
  sound_game.setGain(-30);
}

void mainMenuSound() {
  sound_mainMenu.play();
  sound_mainMenu.setGain(-20);
}

void deadSound() {
  sound_dead.play();
  sound_dead.setGain(-30);
}

void jumpSound() {
  sound_jump.play();
}

// Main menu buttons
void mouseReleased() {
  // Bt start
  if (mouseX >= 220 && mouseX <= 376 && mouseY >= 300 && mouseY <= 355) {
    println("Start");
    showMenu = false;
    startGame = true;
  }

  // Bt rules
  if (mouseX >= 220 && mouseX <= 376 && mouseY > 355 && mouseY <= 415) {
    println("Rules");
    showMenu = false;
    showRules = true;
    showCredits = false;
  }

  // bt credits
  if (mouseX >= 220 && mouseX <= 376 && mouseY > 415 && mouseY <= 460) {
    println("Credits");
    showMenu = false;
    showRules = false;
    showCredits = true;
  }

  // bt home
  if (mouseX > 5 && mouseX <= 150 && mouseY >= 10 && mouseY <= 60 ) {
    println("Home");
    showMenu = true;
    showRules = false;
    showCredits = false;
  }
}
