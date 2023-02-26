class Ghost extends MovingEntity {
  private int gType;
  private boolean deadFlag;
  
  public Ghost(int row, int col, Board board) {
    super(row, col, board);
    this.gType = ghostType;
    this.setSpeed(1);
  }
  
  public int getGhostType(){
    return gType;
  }
  
  public int getColour() {
    return ghostColors[gType];
  }
  
  //pacman powerUpActive -- escape; otherwise -- hunt
  public void calculateDirection(Board board, int trgtRow, int trgtCol, boolean powerUpActive) {
    if(powerUpActive){
      //escape
      if (trgtRow < this.getRow() && getLastClicked() != 2 && board.noWallNeighbour(this.getRow() + 1, this.getCol())) {
          this.setDirection(2);
      } else if (trgtCol < this.getCol() && getLastClicked() != 1 && board.noWallNeighbour(this.getRow(), this.getCol() + 1)) {
        this.setDirection(1);
      } else if (trgtRow > this.getRow() && getLastClicked() != 0 && board.noWallNeighbour(this.getRow() - 1, this.getCol())) {
        this.setDirection(0);
      } else if (trgtCol > this.getCol() && getLastClicked() != 3 && board.noWallNeighbour(this.getRow(), this.getCol() - 1)) {
        this.setDirection(3);
      } else{
        this.setDirection(wanderDirection(board));
      }
    }else {
      //hunt
      if (trgtRow < this.getRow() && getLastClicked() != 2 && board.noWallNeighbour(this.getRow() - 1, this.getCol())) {
          this.setDirection(0);
      } else if (trgtCol < this.getCol() && getLastClicked() != 1 && board.noWallNeighbour(this.getRow(), this.getCol() - 1)) {
        this.setDirection(3);
      } else if (trgtRow > this.getRow() && getLastClicked() != 0 && board.noWallNeighbour(this.getRow() + 1, this.getCol())) {
        this.setDirection(2);
      } else if (trgtCol > this.getCol() && getLastClicked() != 3 && board.noWallNeighbour(this.getRow(), this.getCol() + 1)) {
        this.setDirection(1);
      } else {
        this.setDirection(wanderDirection(board));
      }
    }
  }
  
  private int wanderDirection(Board board){
    int randomDirection = (int)random(0,3);
    if (checkIfBlindAlley(board, randomDirection)){
      //recursive
      randomDirection = wanderDirection(board); 
    }
    return randomDirection;
  }
  
  private boolean checkIfBlindAlley(Board board, int direction){
    if (direction == 0 && board.noWallNeighbour(this.getRow() - 1, this.getCol())) {
      return true;
    }else if (direction == 2 && board.noWallNeighbour(this.getRow() + 1, this.getCol())) {
      return true;
    }else if (direction == 1 && board.noWallNeighbour(this.getRow(), this.getCol() + 1)) {
      return true;
    }else if (direction == 3 && board.noWallNeighbour(this.getRow(), this.getCol() - 1)) {
      return true;
    }
    return false;
  }
  
  public void move(Board board, int trgtRow, int trgtCol, boolean powerUpActive) {
    int newRow = getRow();
    int newCol = getCol();
    calculateDirection(board, trgtRow, trgtCol, powerUpActive);
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
  
  void render() {
    stroke(0);
    fill(ghostColors[gType]);
    pushMatrix();
    translate(getCol() * board.getCellSize() + board.getCellSize()/2 + board.xOffset, getRow() * board.getCellSize() + board.getCellSize()/2 + board.yOffset);
    if (!deadFlag) {
      rect(-11, -1, 22, 11);
      arc(0, 0, 22, 22, PI, TWO_PI);
      for (int i=0; i<4; i++) {
        arc(-7+5*i, 10, 5, 5, 0, PI);
      }
    }
    fill(255);
    noStroke();
    ellipse(-4, 0, 4, 8);
    ellipse(4, 0, 4, 8);
    if (deadFlag) {
      fill(0, 0, 255);
      ellipse(-3, 0, 3, 3);
      ellipse(5, 0, 3, 3);
    }
    popMatrix();
  }
  
  public void draw(Board board, int trgtRow, int trgtCol, boolean powerUpActive) {
    move(board, trgtRow, trgtCol, powerUpActive);
    render();
  }
  
  //remove the ghost from the board
  public void kill() {
    deadFlag = true;
  }
  
}
