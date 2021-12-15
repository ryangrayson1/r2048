void setup(){
  size(800, 800);
  background(0, 0, 0);
}
Player player = new Player();

public boolean generate = true;


void draw(){
  if (generate){
    double randGen = Math.random() * player.getAvailable();
  }
}
