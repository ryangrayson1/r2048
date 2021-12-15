public class Tile {
  private int value;
  private int Xcoord;
  private int Ycoord;
  
  Tile(){
    if (random(1) < .1){
      value = 4;
    } 
    else {
      value = 2;
    }
  }
}
