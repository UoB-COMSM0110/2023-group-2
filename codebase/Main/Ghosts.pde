class Ghost extends MovingEntity {
  private int gType;
  private boolean deadFlag;
  
  public Ghost(int row, int col, int ghostType, Board board) {
    super(row, col, board);
    this.gType = ghostType;
  }
  
  public int getGhostType(){
    return gType;
  }
  
  public int getColour() {
    return ghostColors[gType];
  }
  
  //pacman powerUpActive -- escape; otherwise -- hunt
  public void calculateDirection(Board board, int trgtRow, int trgtCol, int trgtDrctn, boolean powerUpActive) {
    if(powerUpActive){
      //escape
      if (trgtRow < this.getRow() && trgtDrctn != 2 && board.noWallNeighbour(this.getRow() + 1, this.getCol())) {
          this.setDirection(2);
      } else if (trgtCol < this.getCol() && trgtDrctn != 1 && board.noWallNeighbour(this.getRow(), this.getCol() + 1)) {
        this.setDirection(1);
      } else if (trgtRow > this.getRow() && trgtDrctn != 0 && board.noWallNeighbour(this.getRow() - 1, this.getCol())) {
        this.setDirection(0);
      } else if (trgtCol > this.getCol() && trgtDrctn != 3 && board.noWallNeighbour(this.getRow(), this.getCol() - 1)) {
        this.setDirection(3);
      } else{
        this.setDirection(wanderDirection(board));
      }
    }else {
      //hunt
      /*if (trgtRow < this.getRow() && trgtDrctn != 2 && board.noWallNeighbour(this.getRow() - 1, this.getCol())) {
          this.setDirection(0);
      } else if (trgtCol < this.getCol() && trgtDrctn != 1 && board.noWallNeighbour(this.getRow(), this.getCol() - 1)) {
        this.setDirection(3);
      } else if (trgtRow > this.getRow() && trgtDrctn != 0 && board.noWallNeighbour(this.getRow() + 1, this.getCol())) {
        this.setDirection(2);
      } else if (trgtCol > this.getCol() && trgtDrctn != 3 && board.noWallNeighbour(this.getRow(), this.getCol() + 1)) {
        this.setDirection(1);
      } else {*/
        this.setDirection(wanderDirection(board));
      //}
    }
  }
  
  private int wanderDirection(Board board){
    int randomDirection = (int)random(0,4);
    if (checkIfBlindAlley(board, randomDirection)){
      //recursive
      randomDirection = wanderDirection(board); 
    }
    return randomDirection;
  }
  
  private boolean checkIfBlindAlley(Board board, int direction){
    if (direction == 0 && board.noWallNeighbour(this.getRow() - 1, this.getCol())) {
      return false;
    }else if (direction == 2 && board.noWallNeighbour(this.getRow() + 1, this.getCol())) {
      return false;
    }else if (direction == 1 && board.noWallNeighbour(this.getRow(), this.getCol() + 1)) {
      return false;
    }else if (direction == 3 && board.noWallNeighbour(this.getRow(), this.getCol() - 1)) {
      return false;
    }
    return true;
  }
  
  public void move(Board board, int trgtRow, int trgtCol, int trgtDrctn, boolean powerUpActive) {
    int newX = getX();
    int newY = getY();
    if (positionExact()) {
      calculateDirection(board, trgtRow, trgtCol, trgtDrctn, powerUpActive);
    }
    if (getDirection() == 0) { // moving up
      newY -= getSpeed();
    } else if (getDirection() == 1) { // moving right
      newX += getSpeed();
    } else if (getDirection() == 2) { // moving down
      newY += getSpeed();
    } else if (getDirection() == 3) { // moving left
      newX -= getSpeed();
    }
    setPixels(newY, newX);
    if (positionExact()) {
      int newRow = (getY() - board.getYOffset() - (board.getCellSize() / 2)) / board.getCellSize();
      int newCol = (getX() - board.getXOffset() - (board.getCellSize() / 2)) / board.getCellSize();
      if (board.noWallNeighbour(newRow, newCol)) {
        setCoordinates(newRow, newCol);
      }
    }
  }
  
  void render() {
    stroke(0);
    fill(ghostColors[gType]);
    pushMatrix();
    //translate(getCol() * board.getCellSize() + board.getCellSize()/2 + board.xOffset, getRow() * board.getCellSize() + board.getCellSize()/2 + board.yOffset);
    translate(getX(), getY());
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
  
  public void draw(Board board, int trgtRow, int trgtCol, int trgtDrctn,  boolean powerUpActive) {
    move(board, trgtRow, trgtCol, trgtDrctn, powerUpActive);
    render();
  }
  
  //remove the ghost from the board
  public void kill() {
    deadFlag = true;
  }
  
}
