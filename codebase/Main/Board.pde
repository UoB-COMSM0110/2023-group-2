
class Board
{
  int[][] map;
  int WALL;
  int SPACE;
  int SEEN;
  int LETTER;
  int size;
  int rows;
  int cols;
  int yOffset;
  int xOffset;
  int windowHeight;
  int windowWidth;
  int level;
  
  Board(int height, int width) {
    this.level = 2;
    this.size = 27;
    this.SPACE = 0;
    this.WALL = 1;
    this.SEEN = 2;
    this.LETTER = 3;
    this.windowHeight = height;
    this.windowWidth = width;
    
    this.loadBoard();
  }
  
  public void loadBoard() {
    String path = "../levels/level" + this.level + ".txt";
    String[] lines = loadStrings(path);
    this.rows = lines.length;
    this.cols = lines[0].split(",").length;
    this.yOffset = (height - (rows * size)) / 2;
    this.xOffset = (width - (cols * size)) / 2;
    this.map = new int[rows][cols];
    
    for (int row = 0; row < this.rows; row++){
      var val = lines[row].split(",");
      for (int col = 0; col < this.cols; col++){
        this.map[row][col] = Integer.parseInt(val[col]);
      }
    }
  }
  
  public void setLevel(int newLevel) {
    this.level = newLevel;
  }
  
  public int getLevel() {
    return this.level;
  }
  
  public int getXOffset() {
    return xOffset;
  }
  
  public int getYOffset() {
    return yOffset;
  }
  
  private boolean isInBounds(int row, int col) {
    if (row >= 0 && row < rows && col >= 0 && col < cols) {
      return true;
    }
    return false;
  }
  
  public boolean noWallNeighbour(int row, int col) {
    if (isInBounds(row, col) && map[row][col] != WALL && map[row][col] != LETTER) {
      return true;
    }
    return false;
  }
  
  
  public int getCellSize(){
    return size;
  }
  
  public int getNumberOfRows(){
    return rows;
  }
  
  public int getNumberOfColumns(){
    return cols;
  }
  
  public int getCellType(int row, int col) {
    return map[row][col];
  }
  
  private boolean isOuter(int row, int col){
    if (row == 0 || row == rows-1 || col == 0 || col == cols-1) {
      return true;
    }
    return false;
  }
  
  private boolean isPartOfOuter(int row, int col){
    if (isOuter(row, col)){
      return true;
    }
    for (int a = -1; a <= 1; a++) {
      for (int b = -1; b <=1; b++) {
        if (abs(a) != abs(b)) {
          if (isInBounds(row+a, col+b) && getCellType(row+a, col+b) == WALL) {
            map[row][col] = SEEN;
            if(isPartOfOuter(row+a, col+b)){
              return true;
            }
          }
        }
      }
    }
    return false;
  }
  
  private void resetWall() {
    for (int row = 0; row < rows; row++){
      for (int col = 0; col < cols; col++){
        if (map[row][col] == SEEN){
          map[row][col] = WALL;
        }
      }
    }
  }
  
  
  private void drawLine(int row, int col, int r1, int c1, int r2, int c2) {
    stroke(255, 255, 0);
    noFill();
    if (map[row][col] == WALL && isPartOfOuter(row, col)){
      stroke(255, 0, 0);
    }
    resetWall();
    beginShape();
    vertex((size * col) + xOffset + (r1*size), (size * row) + yOffset + (c1*size));
    vertex((size * col) + xOffset + (r2*size), (size * row) + yOffset + (c2*size));
    endShape();    
  }
  
  private void drawOutline(int row, int col) {
    if (!isInBounds(row-1, col) || noWallNeighbour(row-1, col)) {
      drawLine(row, col, 0, 0, 1, 0);
    }
    if (!isInBounds(row, col+1) || noWallNeighbour(row, col+1)) {
      drawLine(row, col, 1, 0, 1, 1);
    }
    if (!isInBounds(row+1, col) || noWallNeighbour(row+1, col)) {
      drawLine(row, col, 1, 1, 0, 1);
    }
    if (!isInBounds(row, col-1) || noWallNeighbour(row, col-1)) {
      drawLine(row, col, 0, 1, 0, 0);
    }
  }
  
  private void determineColour(int row, int col, PacTheMan pacTheMan) {
    row = ((row * getCellSize()) + getYOffset() + (getCellSize() / 2));    
    col = ((col * getCellSize()) + getXOffset() + (getCellSize() / 2));    
    int r = round(2*abs(pacTheMan.getY() - row) * ((float)255 / (float)windowHeight));
    int g = round(1.5*abs(pacTheMan.getX() - col) * ((float)255 / (float)windowWidth));
    if (r > 255) {
      r = 255;
    }
    if (g > 255) {
      g = 255;
    }
    fill(20 + r, 20 + g, 100);
    stroke(20 + r, 20 + g, 100);
  }
  
  private void drawSpace() {
    for (int row = 0; row < rows; row++){
      for (int col = 0; col < cols; col++){
        fill(80);
        noStroke();
        square((size * col) + xOffset, (size * row) + yOffset, size);
      }
    }
  }
  
  public void drawBoard(PacTheMan pacTheMan) {
    drawSpace();
    for (int row = 0; row < rows; row++){
      for (int col = 0; col < cols; col++){
        if (map[row][col] == WALL){
          fill(120);
          noStroke();
          if (isPartOfOuter(row, col)) {
            fill(40);
          }
          resetWall();
          square((size * col) + xOffset, (size * row) + yOffset, size);
          drawOutline(row, col);
        }
        else if (map[row][col] == LETTER){
          //fill(0, 255, 0);
          //stroke(0, 255, 0);
          determineColour(row, col, pacTheMan);
          square((size * col) + xOffset, (size * row) + yOffset, size);
          drawOutline(row, col);
        }    
        
      }
    }
  }
}
