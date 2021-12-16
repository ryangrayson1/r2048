void setup(){
  size(800, 800);
}

//initialization ----------------------------------------------------------------------------------------------------------
Player player;
boolean gameActive = false; 


//general methods --------------------------------------------------------------------------------------------------------

//takes an x(0-3) and a y(0-3) and returns a PVector with th
public PVector pixCoords(int x, int y){
  return new PVector(5 + 200*x, 5 + 200*y);
}

void draw(){
  //menu screen
  if (!gameActive){
    int clr = 0;
    if (mouseX >= 200 && mouseX <= 600 && mouseY >= 280 && mouseY <= 440){
      clr = 60;
    }
    background(200);
    fill(clr);
    rect(200, 280, 400, 160);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(64);
    text("Start Game", 400, 350);
    fill(100, 150, 250);
    textSize(100);
    text("r2048", 400, 100);
    fill(50, 200, 190);
    textSize(36);
    text("by Ryan Grayson", 400,  680);
  }
  
  //game screen
  if (gameActive){
    background(200);
    line(200, 0, 200, 810); line(400, 0, 400, 810); line(600, 0, 600, 810);
    line(0, 200, 810, 200); line(0, 400, 810, 400); line(0, 600, 810, 600);
    player.displayTiles();
  }
}

//handles input from arrow keys
void keyPressed(){
  if (key == CODED && gameActive){
    switch(keyCode){
      case UP:
        player.moveUp();
        player.printGrid();
        //player.addTile();
        break;
      case DOWN:
        player.moveDown();
        player.printGrid();
        //player.addTile();
        break;
      case LEFT:
        player.moveLeft();
        player.printGrid();
        //player.addTile();
        break;
      case RIGHT:
        player.moveRight();
        player.printGrid();
        //player.addTile();
        break;
    }
  }
  else if (key == 'q' || key == 'Q'){
    gameActive = false;
  }
}

void mouseClicked(){
  if (!gameActive && mouseButton == LEFT && pmouseX >= 200 && pmouseX <= 600 && pmouseY >= 280 && pmouseY <= 440){
    player = new Player();
    gameActive = true;
  } 
}
    
