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
    
    //creating first 2 tiles
    this.addTile();
    this.addTile();
        
  }
  
  public void addTile(){
    //getting a random available space and making that space unavailable
    int r = (int) random(available.size());
    PVector newSpot = available.get(r);
    available.remove(r);
    
    //updating grid
    grid[(int)newSpot.x][(int)newSpot.y] = new Tile((int)newSpot.x, (int)newSpot.y);
  }
 
 public void displayTiles(){
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
     if (grid[i][0] == null && grid[i][1] != null){
       grid[i][1].setPosition(i, 0);
       grid[i][0] = grid[i][1];
       grid[i][1] = null;
     }
   }
   
   //3rd row
   for(int i = 0; i < 4; i++){
     //moving up 2 case
     if (grid[i][0] == null && grid[i][1] == null && grid[i][2] != null){
       grid[i][2].setPosition(i, 0);
       grid[i][0] = grid[i][2];
       grid[i][2] = null;
     }
     //moving up 1
     else if (grid[i][2] != null){
       grid[i][2].setPosition(i, 1);
       grid[i][1] = grid[i][2];
       grid[i][2] = null;
     }
   }
     
     //4th row
     for(int i = 0; i < 4; i++){
     //moving up 3 case
     if (grid[i][0] == null && grid[i][1] == null && grid[i][2] == null && grid[i][3] != null){
       grid[i][3].setPosition(i, 0);
       grid[i][0] = grid[i][3];
       grid[i][3] = null;
     }
     //moving up 1 case
     else if ((grid[i][0] == null && grid[i][1] == null || grid[i][0] == null && grid[i][2] == null || grid[i][1] == null && grid[i][2] == null) && grid[i][3] != null){
       grid[i][3].setPosition(i, 2);
       grid[i][2] = grid[i][3];
       grid[i][3] = null;
     }
     //moving up 2
     else if (grid[i][3] != null){
       grid[i][3].setPosition(i, 1);
       grid[i][1] = grid[i][3];
       grid[i][3] = null;
     }
       
   }
   
   updateAvail();
 }
   
 public void moveDown(){
 }
 
 public void moveLeft(){
 }
 
 public void moveRight(){
 }
   
 public void updateAvail(){
   available.clear();
   
   for (int i = 0; i < 4; i++){
     
      for(int j = 0; j < 4; j++){
        
        if (grid[i][j] != null){
          available.add(new PVector(i, j);
        }
      }
   }
 }
 
}
 
 
 
 
 
 
 
 

 
