
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
  
  Board(int height, int width) {
    size = 27;
    SPACE = 0;
    WALL = 1;
    SEEN = 2;
    LETTER = 3;

    String[] lines = loadStrings("../levels/level1.txt");
    rows = lines.length;
    cols = lines[0].split(",").length;
    yOffset = (height - (rows * size)) / 2;
    xOffset = (width - (cols * size)) / 2;
    map = new int[rows][cols];
    
    for (int row = 0; row < rows; row++){
      var val = lines[row].split(",");
      for (int col = 0; col < cols; col++){
        map[row][col] = Integer.parseInt(val[col]);
      }
    }
    
  }
  
  private boolean isInBounds(int row, int col) {
    if (row >= 0 && row < rows && col >= 0 && col < cols) {
      return true;
    }
    return false;
  }
  
  private boolean noWallNeighbour(int row, int col) {
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
    int r = (abs(pacTheMan.getRow() - row)) * (255 / (rows / 2));
    int g = (abs(pacTheMan.getCol() - col)) * (255 / (cols / 2));
    fill(20 + r, 20 + g, 100);
    stroke(20 + r, 20 + g, 100);
  }
  
  public void draw(PacTheMan pacTheMan) {
    for (int row = 0; row < rows; row++){
      for (int col = 0; col < cols; col++){
        if (map[row][col] == WALL){
          fill(120);
          noStroke();
          if (isPartOfOuter(row, col)) {
            fill(80);
          }
          resetWall();
          square((size * col) + xOffset, (size * row) + yOffset, size);
          drawOutline(row, col);
        }
        if (map[row][col] == LETTER){
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
