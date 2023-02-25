enum PowerUpType { 
 EATGHOSTS
 FAST
 SLOW
 FOGINCREASE
 FOGDECREASE
}

class PowerUp extends EdibleEntity {
  private PowerUpType powerType;
  
  public PowerUp(int row, int col, PowerUpType powerType) {
    super(row, col);
    this.powerType = powerType;
  }
  
  public PowerUpType getPowerType() {
    return powerType;
  }
  
  public void setPowerType(PowerUpType powerType) {
    this.powerType = powerType;
  }
}
