PacTheMan pacTheMan = new PacTheMan(6, 11);
Board board;

void setup(){
  size(1100, 700);
  frameRate(5);
  board = new Board(700, 1100);
}

void keyPressed() {
  if (keyCode == UP && board.noWallNeighbour(pacTheMan.getRow() - 1, pacTheMan.getCol())) {
    pacTheMan.setDirection(0);
  } else if (keyCode == RIGHT && board.noWallNeighbour(pacTheMan.getRow(), pacTheMan.getCol() + 1)) {
    pacTheMan.setDirection(1);
  } else if (keyCode == DOWN && board.noWallNeighbour(pacTheMan.getRow() + 1, pacTheMan.getCol())) {
    pacTheMan.setDirection(2);
  } else if (keyCode == LEFT && board.noWallNeighbour(pacTheMan.getRow(), pacTheMan.getCol() - 1)) {
    pacTheMan.setDirection(3);
  }
}

void draw() {
  background(70, 50, 40); // clear the board
  pacTheMan.move(board);
  board.draw(pacTheMan); // draw the board
  pacTheMan.draw();
}
