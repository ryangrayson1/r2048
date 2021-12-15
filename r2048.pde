void setup(){
  size(800, 800);
  background(200, 200, 200);
  line(200, 0, 200, 810); line(400, 0, 400, 810); line(600, 0, 600, 810);
  line(0, 200, 810, 200); line(0, 400, 810, 400); line(0, 600, 810, 600);
}

//initialization ----------------------------------------------------------------------------------------------------------
Player player = new Player();
public boolean startGame = false;


//general methods --------------------------------------------------------------------------------------------------------

//takes an x(0-3) and a y(0-3) and returns a PVector with th
public PVector pixCoords(int x, int y){
  return new PVector(5 + 200*x, 5 + 200*y);
}

public void first2(){
  player.addTile();
  player.addTile();
}

void draw(){
  //starting the game with first 2 tiles
  if (startGame == false){
    first2();
    startGame = true;
  }
  
  //will continuously show the tiles
  player.showTiles();
}
