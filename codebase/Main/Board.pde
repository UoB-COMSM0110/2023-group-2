// fixed map at first

class Board
{
  
  int[][] map;
  int wall;
  int space;
  int size;
  int rows;
  int cols;
  int yOffset;
  int xOffset;
  
  Board(int height, int width) {
    
    size = 20;
    wall = 1;
    space = 0;
    rows = 31;
    cols = 40;
    yOffset = (height - (rows * size)) / 2;
    xOffset = (width - (cols * size)) / 2;
    map = new int[rows][cols];
    for (int row = 0; row < rows; row++){
      for (int col = 0; col < cols; col++){
        map[row][col] = space;
        if (row == 0 || row == rows-1 || col == cols-1 || col == 0) {
          map[row][col] = wall;
        }
        if (row % 3 == 0 && col % 3 == 0) {
          map[row][col] = wall;
        }
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
    if (isInBounds(row, col) && map[row][col] != wall) {
      return true;
    }
    return false;
  }
  
  private void drawLine(int row, int col, int r1, int c1, int r2, int c2) {
    
    stroke(255, 255, 0);
    beginShape();
    vertex((size * col) + xOffset + (r1*size), (size * row) + yOffset + (c1*size));         // top left
    vertex((size * col) + xOffset + (r2*size), (size * row) + yOffset + (c2*size));         // top right
    endShape();    
  }
  
  public void draw() {
    for (int row = 0; row < rows; row++){
      for (int col = 0; col < cols; col++){
        if (map[row][col] == wall){
          fill(100);
          noStroke();
          square((size * col) + xOffset, (size * row) + yOffset, size);
          noFill();
          stroke(255, 255, 0);
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
      }
    }
  }
}
