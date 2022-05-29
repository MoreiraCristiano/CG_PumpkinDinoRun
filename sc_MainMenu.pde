class ScMainMenu {
  BtStart startButton = new BtStart(300, 300, 150, 50, "Start");
  BtRules rulesButton = new BtRules(300, 355, 150, 50, "Rules");
  BtCredits creditsButton = new BtCredits(300, 410, 150, 50, "Credits");
  
  void drawMenu() {
    background(background_mainMenu);
    startButton.drawButton("Start");
    rulesButton.drawButton("Rules");
    creditsButton.drawButton("Credits");
  }
}
