enum PowerUpType { 
 EATGHOSTS,
 FAST,
 SLOW,
 FOGINCREASE,
 FOGDECREASE,
}

class PowerUp extends EdibleEntity {
  private PowerUpType powerType;
  
  public PowerUp(int row, int col, PowerUpType powerType, Board board) {
    super(row, col, board);
    this.powerType = powerType;
  }
  
  public PowerUpType getPowerType() {
    return powerType;
  }
  
  public void setPowerType(PowerUpType powerType) {
    this.powerType = powerType;
  }
}
