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
}
