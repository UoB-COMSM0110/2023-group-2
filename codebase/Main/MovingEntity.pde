class MovingEntity extends DiscreteBoardEntity {
  private int direction;
  private int speed;
  private int slip;
  private int lastClicked;
  
  public MovingEntity(int row, int col, Board board) {
    super(row, col, board);
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
  
  private void calculateDirection(Board board) {
    if (getLastClicked() == 0 && board.noWallNeighbour(this.getRow() - 1, this.getCol())) {
      this.setDirection(0);
    } else if (getLastClicked() == 1 && board.noWallNeighbour(this.getRow(), this.getCol() + 1)) {
      this.setDirection(1);
    } else if (getLastClicked() == 2 && board.noWallNeighbour(this.getRow() + 1, this.getCol())) {
      this.setDirection(2);
    } else if (getLastClicked() == 3 && board.noWallNeighbour(this.getRow(), this.getCol() - 1)) {
      this.setDirection(3);
    }
  }
  
  public void setLastClicked(int direction) {
    lastClicked = direction;
  }
  
  public int getLastClicked() {
    return lastClicked;
  }
  
  public void move(Board board) {
    int newRow = getRow();
    int newCol = getCol();
    calculateDirection(board);
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
