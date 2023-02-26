class MovingEntity extends DiscreteBoardEntity {
  private int direction;
  private int speed;
  private int slip;
  private int lastClicked;
  private boolean stop;
  
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
  
  private void calculateStop() {
    if (positionExact()) {
      stop = true;
      if (getDirection() == 1 && board.noWallNeighbour(getRow(), getCol() + 1)) {
        stop = false;
      }
      if (getDirection() == 3 && board.noWallNeighbour(getRow(), getCol() - 1)) {
        stop = false;
      }
      if (getDirection() == 0 && board.noWallNeighbour(getRow() - 1, getCol())) {
        stop = false;
      }
      if (getDirection() == 2 && board.noWallNeighbour(getRow() + 1, getCol())) {
        stop = false;
      }
    }    
  }
  
  
  public void setLastClicked(int direction) {
    lastClicked = direction;
  }
  
  public int getLastClicked() {
    return lastClicked;
  }
  
  protected boolean positionExact() {
    if ((getX() - board.getXOffset() - (board.getCellSize() / 2)) % board.getCellSize() == 0 &&
      (getY() - board.getYOffset() - (board.getCellSize() / 2)) % board.getCellSize() == 0) {
        return true;
      }
    return false;
  }
  
  public void move(Board board) {
    
    int newX = getX();
    int newY = getY();
    
    if (positionExact()) {
      calculateDirection(board);
    }

    if (getDirection() == 0) { // moving up
      newY -= getSpeed();
    } 
    else if (getDirection() == 1) { // moving right
      newX += getSpeed();
    } 
    else if (getDirection() == 2) { // moving down
      newY += getSpeed();
    } 
    else if (getDirection() == 3) { // moving left
      newX -= getSpeed();
    }
    calculateStop();
    if (!stop) {
      setPixels(newY, newX);
    }
    
    if (positionExact()) {
      int newRow = (getY() - board.getYOffset() - (board.getCellSize() / 2)) / board.getCellSize();
      int newCol = (getX() - board.getXOffset() - (board.getCellSize() / 2)) / board.getCellSize();
      if (board.noWallNeighbour(newRow, newCol)) {
        setCoordinates(newRow, newCol);
      }
      
    }
  }
  
  public void setSpeed(int speed) {
    while (speed % board.getCellSize() != 0) {
      speed -= 1;
    }
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
