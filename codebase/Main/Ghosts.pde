class Ghost extends MovingEntity {
  private color ghostColour;
  
  public Ghost(int row, int col, color ghostColour) {
    super(row, col);
    this.ghostColour = ghostColour;
  }
  
  public color getColour() {
    return ghostColour;
  }
  
  public void setColour(color c) {
    ghostColour = c;
  }
  
  public void kill() {
    // code to remove the ghost from the board
  }
}
