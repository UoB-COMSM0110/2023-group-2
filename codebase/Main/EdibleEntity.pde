class EdibleEntity extends DiscreteBoardEntity {
  private boolean eaten;
  
  public EdibleEntity(int row, int col) {
    super(row, col);
    eaten = false;
  }
  
  public boolean getEaten() {
    return eaten;
  }
  
  public void setEaten(boolean eaten) {
    this.eaten = eaten;
  }
}
