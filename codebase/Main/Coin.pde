class Coin extends EdibleEntity {
  private int value;
  
  public Coin(int row, int col, int value, Board board) {
    super(row, col, board);
    this.value = value;
  }
  
  public int getValue() {
    return value;
  }
  
  public void setValue(int value) {
    this.value = value;
  }
}
