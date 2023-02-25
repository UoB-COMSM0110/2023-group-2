class EdibleEntity extends DiscreteBoardEntity {
  private boolean eaten;
  
  public EdibleEntity(int row, int col, Board board) {
    super(row, col, board);
    eaten = false;
  }
  
  public boolean getEaten() {
    return eaten;
  }
  
  public void setEaten(boolean eaten) {
    this.eaten = eaten;
  }
}
