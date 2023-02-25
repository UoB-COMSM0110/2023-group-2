class MovingEntity extends DiscreteBoardEntity {
  private int direction;
  private int speed;
  private int slip;
  
  public MovingEntity(int row, int col) {
    super(row, col);
    direction = 0;
    speed = 1;
    slip = 0;
  }
  
  public void setDirection(int direction) {
    this.direction = direction;
  }
  
  public int getDirection() {
    return direction;
  }
  
  public void setSpeed(int speed) {
    this.speed = speed;
  }
  
  public int getSpeed() {
    return speed;
  }
  
  public void setSlip(int slip) {
    this.slip = slip;
  }
  
  public int getSlip() {
    return slip;
  }
}
