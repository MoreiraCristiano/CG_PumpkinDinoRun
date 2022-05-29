import ddf.minim.*;
//import processing.video.*;

Minim sound_manager;
AudioPlayer sound_dead;
AudioPlayer sound_game;
AudioPlayer sound_mainMenu;
Screens gameScreens = new Screens();
boolean showMenu = true;
boolean startGame = false;
boolean showRules = false;
boolean showCredits = false;
PImage[] obstacles = new PImage[2];
PImage spriteDinoRun, spriteDinoStop, spriteDinoDead, spriteDinoRun2, jackRun, jackRun2, jackDead, obstacle2;
PImage background;
PImage background_mainMenu, background_rules, background_credits;
int wallx[] = new int[2];
int wally[] =new int[2];
int wallxSpeedy = 6;
int vertical = 1;
int x = -200;
int xSpeed = 5;
int y = 370;
int yLimit = y;
int score = 0;
int scoreCounter = 0;
int obstacleColisionPixel = 265;
boolean sp = false;
int time;
//Movie video;

void setup() {
  size(600, 600);

  // Background
  background = loadImage("./Assets/bg-game.png");
  background_mainMenu = loadImage("./Assets/BG_Inicio.jpg");

  // Obstacles Sprites
  obstacle2 = loadImage("./Assets/obstacles/obstacle2.png");

  obstacle2.resize(50, 50);
  //obstacles[1] = obstacle2;

  // Jack sprites
  jackRun = loadImage("./Assets/sprite_jack/jack1.png");
  jackRun2 = loadImage("./Assets/sprite_jack/jack3.png");
  //jackDead = loadImage("./Assets/sprite_jack/jack3dead.png");

  jackRun.resize(75, 85);
  jackRun2.resize(75, 85);
  //jackDead.resize(75, 85);

  // Dino Sprite
  spriteDinoRun = loadImage("./Assets/sprite_dino/dino_run.png");
  spriteDinoRun2 = loadImage("./Assets/sprite_dino/dino_run2.png");

  spriteDinoRun.resize(200, 200);
  spriteDinoRun2.resize(200, 200);

  // Sounds
  sound_manager = new Minim(this);
  sound_game = sound_manager.loadFile("./Assets/sounds/background_game_sound2.mp3");
  sound_dead = sound_manager.loadFile("./Assets/sounds/dead2.mp3");
  sound_mainMenu = sound_manager.loadFile("./Assets/sounds/sound_menu.mp3");

  // Movies
  //video = new Movie(this, "movie.mp4");
  //video.loop();
}

//void movieEvent(Movie video) {
//  video.read();
//}

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
    sound_game.play();
    sound_game.setGain(-30);
  }
}

void endGame() {
  deadSound();
  sound_game.mute();
  sound_game.rewind();
  showMenu = true;
  delay(1500);

  if (showMenu) {
    stroke(0);
    mainMenuSound();
    startGame = false;
    showMenu = true;
  }
}

void mainMenuSound() {
  sound_mainMenu.play();
  sound_mainMenu.setGain(-20);
}

void deadSound() {
  sound_dead.play();
  sound_dead.setGain(-30);
}


// CONTROLS
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
