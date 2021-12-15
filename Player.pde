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
 
 
 public void moveUp(){
   //2nd row
   for(int i = 0; i < 4; i++){
     if (grid[i][0] == null){
       grid[i][1].setPosition(i, 0);
       grid[i][0] = grid[i][1];
       grid[i][1] = null;
     }
   }
   
   //3rd row
   for(int i = 0; i < 4; i++){
     //moving up 2 case
     if (grid[i][0] == null && grid[i][1] == null){
       grid[i][2].setPosition(i, 0);
       grid[i][0] = grid[i][2];
       grid[i][2] = null;
     }
     //moving up 1
     else {
       grid[i][2].setPosition(i, 1);
       grid[i][1] = grid[i][2];
       grid[i][2] = null;
     }
     
     //4th row
     
 }
 
 
 
 
 
 
 
 
 
 
 
 
}
 
