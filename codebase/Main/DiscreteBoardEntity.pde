class DiscreteBoardEntity {
  private int row;
  private int col;
  
  public DiscreteBoardEntity() {
    row = 0;
    col = 0;
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
}
