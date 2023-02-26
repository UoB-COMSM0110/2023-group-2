class DiscreteBoardEntity {
  private int row;
  private int col;
  private int xCentre;
  private int yCentre;
  
  public DiscreteBoardEntity(int row, int col, Board board) {
    this.row = row;
    this.col = col;
    this.yCentre = (row * board.getCellSize()) + board.getYOffset() + (board.getCellSize() / 2);
    this.xCentre = (col * board.getCellSize()) + board.getXOffset() + (board.getCellSize() / 2);
  }
  
  public void setCoordinates(int row, int col) {
    this.row = row;
    this.col = col;
  }
  
  public int getRow() {
    return row;
  }
  
  public int getCol() {
    return col;
  }
  
  public int getX() {
    return xCentre;
  }
  
  public int getY() {
    return yCentre;
  }
  
  public void setPixels(int y, int x) {
    this.yCentre = y;
    this.xCentre = x;
  }
}
