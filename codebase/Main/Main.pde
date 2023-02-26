PacTheMan pacTheMan;
color[] ghostColors = {
  color(255, 0, 0), 
  color(255, 64, 196), 
  color(0, 255, 255), 
  color(255, 128, 0), 
  color(0, 255, 0), 
};
Ghost[] ghosts = new Ghost[ghostColors.length];
Board board;

void setup(){
  size(1100, 700);
  frameRate(100);
  board = new Board(700, 1100);
  pacTheMan = new PacTheMan(6, 11, board);
  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i] = new Ghost(7, 12, i, board);
  }
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
  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i].draw (board, pacTheMan.getRow(), pacTheMan.getCol(), pacTheMan.getLastClicked(), pacTheMan.getPowerUpActive());
  }
}
