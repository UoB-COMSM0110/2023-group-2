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
  
  public void move(Board board) {
    int newRow = getRow();
    int newCol = getCol();
    if (getDirection() == 0) { // moving up
      newRow -= getSpeed();
    } else if (getDirection() == 1) { // moving right
      newCol += getSpeed();
    } else if (getDirection() == 2) { // moving down
      newRow += getSpeed();
    } else if (getDirection() == 3) { // moving left
      newCol -= getSpeed();
    }
    if(board.getCellType(newRow, newCol) == 1 || board.getCellType(newRow, newCol) == 3){
      return;
    }
    setCoordinates(newRow, newCol);
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
