public class Tile {
  private int value;
  private PVector clr;
  private PVector position; // position from index 0-3 (because tile grid is 4x4)
  private PVector coords;  //coordinate position in pixels
   
  
  //constructor
  Tile(int x, int y){
    if (random(1) < .1){
      this.setValue(4);
    } 
    else {
      this.setValue(2);
    }
    this.position = new PVector(x, y);
    this.coords = pixCoords(x, y);
  }
  
  public void setValue(int val){
    this.value = val;
    this.clr = new PVector(100, val % 255, 100);
  }
  
  public void setPosition(int x, int y){
    this.position = new PVector(x, y);
    this.coords = pixCoords(x, y);
  }
    
  public void display(){
    fill(this.clr.x, this.clr.y, this.clr.z);
    square(coords.x, coords.y, 190);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(64);
    text(this.value, coords.x + 95, coords.y + 95);
  }
}
