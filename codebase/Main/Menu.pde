public class Menu {
  
  boolean inMenu = false;

  public Menu() {
  }
  
  public void openMenu() {
    pauseGame();
    inMenu = true;
    showMenu();
  }
  
  private void showMenu() {
    //Override
  }
  
  private void hideMenu() {
    //Override
  }

  public void draw() {
    background(0);
  }

  private void pauseGame() {
    noLoop();
  }

  private void resumeGame() {
    loop();
  }

  public void closeMenu() {
    resumeGame();
    hideMenu();
    inMenu = false;
  }
}
