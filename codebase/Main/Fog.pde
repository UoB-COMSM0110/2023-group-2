  private int radius;
  
  public Fog(int row, int col, int radius) {
    super(row, col);
    this.radius = radius;
  }
  
  public int getRadius() {
    return radius;
  }
  
  public void setRadius(int radius) {
    this.radius = radius;
  }
}
