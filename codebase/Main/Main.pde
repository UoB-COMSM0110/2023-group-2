PacTheMan pacTheMan = new PacTheMan(1, 1);

void setup(){
  size(1100, 700);
  stroke(255);
  background(50);
  Board board = new Board(700, 1100);
  board.draw();
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
  pacTheMan.move();
}

void draw() {
  pacTheMan.draw();
}
