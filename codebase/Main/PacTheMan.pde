class PacTheMan extends MovingEntity {
  private int coinCount;
  private boolean powerUpActive;
  
  public PacTheMan(int row, int col) {
    super(row, col);
    coinCount = 0;
    powerUpActive = false;
  }
  
  public void increaseCoinCount() {
    coinCount++;
  }
  
  public void activatePowerUp() {
    powerUpActive = true;
  }
  
  public void setDirection(int direction) {
    super.setDirection(direction);
  }
  
public void draw() {
  fill(255, 255, 0); // set fill color to yellow
  stroke(0); // set stroke color to black
  int x = getCol() * board.getCellSize() + board.getCellSize()/2 + board.xOffset; // x-coordinate of Pac-Man's center
  int y = getRow() * board.getCellSize() + board.getCellSize()/2 + board.yOffset; // y-coordinate of Pac-Man's center
  ellipse(x, y, board.getCellSize() * 0.7, board.getCellSize() * 0.7); // draw Pac-Man as a yellow circle
}
}
