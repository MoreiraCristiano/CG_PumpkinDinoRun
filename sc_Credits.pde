class ScCredits {
  ScCredits() {
  }

  String creditsHeader = "Computação Gráfica e" + "\n" + "processamento de imagens" ;
  String creators ="Anne Frank M. Reis" + "\n" + "Cristiano M. do Amaral" + "\n" + "Lucas Sarneli Biazetto"  + "\n" + "Vivaldo Roni Stein Hermes";

  void drawCredits() {
    background(backgroundMainMenu);
    drawBoard();
    textSize(30);
    fill(1, 1, 1);
    text(creditsHeader, width / 2, height / 3);
    textSize(20);
    fill(1, 1, 1);
    text(creators, width / 2, height / 1.8);
  }

  void drawBoard() {
    fill(255, 230);
    square(75, 100, 450);
  }
}
