public class Player {
  private ArrayList<PVector> available;
  private Tile grid[][] = new Tile[4][4];
  
  Player(){
    //initializing empty grid
    for (int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){
        grid[i][j] = null;
      }
    }
    
    //setting available to all
    available = new ArrayList<PVector>();
    for (int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){
        available.add(new PVector(i, j));
      }
    }
        
  }
  
  public ArrayList<PVector> getAvailable(){
    return available;
  }
  
  public void addTile(){
    //getting a random available space and making that space unavailable
    int r = (int) random(available.size());
    PVector newSpot = available.get(r);
    available.remove(r);
    
    //updating grid
    grid[(int)newSpot.x][(int)newSpot.y] = new Tile((int)newSpot.x, (int)newSpot.y);
  }
 
 public void showTiles(){
   for (int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){
        if (grid[i][j] != null){
          grid[i][j].display();
        }
      }
   }
 }
 
}
 
