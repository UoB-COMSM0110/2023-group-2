public class InGameMenu extends Menu {
  public InGameMenu() {
  }

  public void menuKeyPressed() {
    if (this.inMenu == true) {
      closeMenu();
    } else {
      openMenu();
    }
  }
}
