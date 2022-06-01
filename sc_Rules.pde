class ScRules {
  ScRules() {
  }

  String headerRules = "Regras do game \n";
  String rules = "Você acidentalmente quebrou um dos ovos" + 
                 "\n" + 
                 " da ninhada da mamãe dinossauro e agora você \n deve tentar sobreviver!" +
                 "\n" +             
                 "Fuja da mamãe dinossauro e desvie dos obstáculos!" + 
                 "\n\n\n" + 
                 "Utilize a seta para cima do teclado \n para pular os obstáculos.";

  void drawRules() {
    background(backgroundMainMenu);
    drawBoard();
    textSize(30);
    fill(1, 1, 1);
    text(headerRules, width / 2, height / 3);
    textSize(20);
    fill(1, 1, 1);
    text(rules, width / 2, height / 1.8);
    
  }
  
  void drawBoard() {
    fill(255, 230);
    square(75, 100, 450);
  }
}
