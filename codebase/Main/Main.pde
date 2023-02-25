PacTheMan pacTheMan = new PacTheMan(6, 11);
Board board;

void setup(){
  size(1100, 700);
  board = new Board(700, 1100);
}

void keyPressed() {
  if (keyCode == UP) {
    pacTheMan.setDirection(0);
  } else if (keyCode == RIGHT) {
    pacTheMan.setDirection(1);
  } else if (keyCode == DOWN) {
    pacTheMan.setDirection(2);
  } else if (keyCode == LEFT) {
    pacTheMan.setDirection(3);
  }
  pacTheMan.move(board);
}

void draw() {
  background(70, 50, 40); // clear the board
  board.draw(pacTheMan); // draw the board
  pacTheMan.draw();
}
