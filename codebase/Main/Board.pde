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
    rows = 30;
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
  
  void draw() {
    for (int row = 0; row < rows; row++){
      for (int col = 0; col < cols; col++){
        if (map[row][col] == wall){
          fill(100);
          stroke(255, 255, 0);
          square((size * col) + xOffset, (size * row) + yOffset, size);
        }
      }
    }
  }
}
