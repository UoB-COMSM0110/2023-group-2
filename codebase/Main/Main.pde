PacTheMan pacTheMan; // = new PacTheMan(6, 11);
Board board;

void setup(){
  size(1100, 700);
  frameRate(5);
  board = new Board(700, 1100);
  pacTheMan = new PacTheMan(6, 11, board);
}

void keyPressed() {
  if (keyCode == UP) {
    pacTheMan.setLastClicked(0);
  } else if (keyCode == RIGHT) {
    pacTheMan.setLastClicked(1);
  } else if (keyCode == DOWN) {
    pacTheMan.setLastClicked(2);
  } else if (keyCode == LEFT) {
    pacTheMan.setLastClicked(3);
  }
}

void draw() {
  background(70, 50, 40); // clear the board
  pacTheMan.update();
  pacTheMan.move(board);
  board.drawBoard(pacTheMan); // draw the board
  pacTheMan.drawMan();
}
