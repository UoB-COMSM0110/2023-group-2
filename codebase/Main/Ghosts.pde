class Ghost extends MovingEntity {
  private int ghostColour;
  
  public Ghost(int row, int col, int ghostColour, Board board) {
    super(row, col, board);
    this.ghostColour = ghostColour;
  }
  
  public int getColour() {
    return ghostColour;
  }
  
  public void setColour(int c) {
    ghostColour = c;
  }
  
  public void kill() {
    // code to remove the ghost from the board
  }
}
