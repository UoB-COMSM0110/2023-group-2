class Fog extends MovingEntity {
  private int radius;
  
  public Fog(int row, int col, int radius, Board board) {
    super(row, col, board);
    this.radius = radius;
  }
  
  public int getRadius() {
    return radius;
  }
  
  public void setRadius(int radius) {
    this.radius = radius;
  }
}
