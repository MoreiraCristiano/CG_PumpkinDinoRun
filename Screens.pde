ScMainMenu menu = new ScMainMenu();
ScRules rules = new ScRules();
ScCredits credits = new ScCredits();
ScGame game = new ScGame();
BtHome btHome = new BtHome(80, 10, 150, 50, "Home");

class Screens {
  Screens() {
  }

  void mainMenu() {
    menu.drawMenu();    
  }

  void rules() {
    rules.drawRules();    
    btHome.drawButton("Home");
  }
  
  void credits() {
    credits.drawCredits();
    btHome.drawButton("Home");
  }
  
  void startGame() {
    game.drawGame();
  }
    
}
