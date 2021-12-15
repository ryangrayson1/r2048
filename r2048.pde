void setup(){
  size(800, 800);
  background(0, 0, 0);
}
Board board = new Board();

public boolean generate = true;


void draw(){
  if (generate){
    double randGen = Math.random() * board.getAvailable();
  }
}
