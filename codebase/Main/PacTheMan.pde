class PacTheMan extends MovingEntity {
  private int coinCount;
  private boolean powerUpActive;
  private int mouthAngle,angleOffset = 0;
  private boolean mouthOpening;
  
  public PacTheMan(int row, int col, Board board) {
    super(row, col, board);
    coinCount = 0;
    powerUpActive = false;
    mouthAngle = 45;
  }
  
  public void increaseCoinCount() {
    coinCount++;
  }
  
  public void activatePowerUp() {
    powerUpActive = true;
  }
  
  public void setDirection(int direction) {
    super.setDirection(direction);
    if(direction==0) {
      angleOffset = 270;
    }
    if(direction==1) {
      angleOffset = 0;
    }
    if(direction==2) {
      angleOffset = 90;
    }
    if(direction==3) {
      angleOffset = 180;
    }
  }
  
  public void update() {
    // update mouth angle
    //if (isEating) {
    if (mouthOpening) {
      mouthAngle += 25;
      if (mouthAngle >= 45) {
        mouthAngle = 45;
        mouthOpening = false;
      }
    } else {
      mouthAngle -= 25;
      if (mouthAngle <= 0) {
        mouthAngle = 0;
        mouthOpening = true;
      }
    }
    /*} else {
      mouthAngle = 45;
      mouthOpening = true;
    }
    */
  }
  
  public void drawMan() {
    fill(255, 255, 0); // set fill color to yellow
    stroke(0); // set stroke color to black
    int x = getCol() * board.getCellSize() + board.getCellSize()/2 + board.xOffset; // x-coordinate of Pac-Man's center
    int y = getRow() * board.getCellSize() + board.getCellSize()/2 + board.yOffset; // y-coordinate of Pac-Man's center
    pushMatrix();
    translate(x, y);
    fill(255, 255, 0);
    //The Pac-Man size will need to be improved depending on the size of the maze
    arc(0, 0, board.getCellSize() * 0.7, board.getCellSize() * 0.7, radians(angleOffset+mouthAngle), radians(angleOffset+360-mouthAngle),PIE);
    popMatrix();
    //ellipse(x, y, board.getCellSize() * 0.7, board.getCellSize() * 0.7); // draw Pac-Man as a yellow circle
  }
}
