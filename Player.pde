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
  
  public ArrayList<PVector> getAvailable(){
    return this.available;
  }
  
  public void addTile(){
     if (available.size() == 0){
       gameActive = false;
     }
     else{
      //getting a random available space and making that space unavailable
      int r = (int) random(available.size());
      PVector newSpot = available.get(r);
      available.remove(r);
      
      //updating grid
      grid[(int)newSpot.x][(int)newSpot.y] = new Tile((int)newSpot.x, (int)newSpot.y);
    }
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
 
//MOVE UP ------------------------------------------------------------------------------------------------------------
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
     else if (grid[i][2] != null && grid[i][1] == null){
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
     else if (grid[i][0] != null && grid[i][1] != null && grid[i][2] == null && grid[i][3] != null){
       grid[i][3].setPosition(i, 2);
       grid[i][2] = grid[i][3];
       grid[i][3] = null;
     }
     //moving up 2
     else if (grid[i][3] != null && grid[i][2] == null && grid[i][1] == null){
       grid[i][3].setPosition(i, 1);
       grid[i][1] = grid[i][3];
       grid[i][3] = null;
     }
       
   }
   //merging tiles
   this.mergeUp();
   
   updateAvail();
 }
 
 //merging tiles up after they have moved
 public void mergeUp(){
   for(int i = 0; i < 4; i++){
     
     //double merge case
     if (grid[i][0] != null && grid[i][1] != null && grid[i][2] != null && grid[i][3] != null && grid[i][0].getValue() == grid[i][1].getValue() && grid[i][2].getValue() == grid[i][3].getValue()){
       grid[i][0].nextValue();
       
       grid[i][2].nextValue();
       grid[i][2].setPosition(i, 1);
       grid[i][1] = grid[i][2];
       
       grid[i][2] = null;
       grid[i][3] = null;  
     }
       
     //3 single merge cases
     //merge top 2
     else if (grid[i][0] != null && grid[i][1] != null && grid[i][0].getValue() == grid[i][1].getValue()){
       grid[i][0].nextValue();
       
       if (grid[i][2] == null && grid[i][3] == null){
         grid[i][1] = null;
       }
       else if (grid[i][2] != null){
         grid[i][2].setPosition(i, 1);
         grid[i][1] = grid[i][2];
         
         if (grid[i][3] == null){
           grid[i][2] = null;
         }
         else{
           grid[i][2] = grid[i][3];
           grid[i][2].setPosition(i, 2);
           grid[i][3] = null;
         }
       }
     }
     //merge middle 2
     if (grid[i][1] != null && grid[i][2] != null && grid[i][1].getValue() == grid[i][2].getValue()){
       grid[i][1].nextValue();
       
       
       if (grid[i][3] == null){
         grid[i][2] = null;
       }
       else{
         grid[i][2] = grid[i][3];
         grid[i][2].setPosition(i, 2);
         grid[i][3] = null;
       }
     }
     //merge bottom 2
     else if (grid[i][2] != null && grid[i][3] != null && grid[i][2].getValue() == grid[i][3].getValue()){
       grid[i][2].nextValue();
       grid[i][3] = null;
     }
   }
 }
   
//MOVE DOWN ------------------------------------------------------------------------------------------------------------
 public void moveDown(){
   //3rd row
   for(int i = 0; i < 4; i++){
     if (grid[i][3] == null && grid[i][2] != null){
       grid[i][2].setPosition(i, 3);
       grid[i][3] = grid[i][2];
       grid[i][2] = null;
     }
   }
   
   //2nd row
   for(int i = 0; i < 4; i++){
     //moving down 2 case
     if (grid[i][3] == null && grid[i][2] == null && grid[i][1] != null){
       grid[i][1].setPosition(i, 3);
       grid[i][3] = grid[i][1];
       grid[i][1] = null;
     }
     //moving down 1
     else if (grid[i][1] != null && grid[i][2] == null){
       grid[i][1].setPosition(i, 2);
       grid[i][2] = grid[i][1];
       grid[i][1] = null;
     }
   }
     
     //1st row
     for(int i = 0; i < 4; i++){
     //moving down 3 case
     if (grid[i][3] == null && grid[i][2] == null && grid[i][1] == null && grid[i][0] != null){
       grid[i][0].setPosition(i, 3);
       grid[i][3] = grid[i][0];
       grid[i][0] = null;
     }
     //moving down 1 case
     else if (grid[i][3] != null && grid[i][2] != null && grid[i][1] == null && grid[i][0] != null){
       grid[i][0].setPosition(i, 1);
       grid[i][1] = grid[i][0];
       grid[i][0] = null;
     }
     //moving down 2
     else if (grid[i][0] != null && grid[i][1] == null && grid[i][2] == null){
       grid[i][0].setPosition(i, 2);
       grid[i][2] = grid[i][0];
       grid[i][0] = null;
     }
       
   }
   this.mergeDown();
   updateAvail();
 }
 
 //merging tiles up after they have moved
 public void mergeDown(){
   for(int i = 0; i < 4; i++){
     
     //double merge case
     if (grid[i][3] != null && grid[i][2] != null && grid[i][1] != null && grid[i][0] != null && grid[i][3].getValue() == grid[i][2].getValue() && grid[i][1].getValue() == grid[i][0].getValue()){
       grid[i][3].nextValue();
       
       grid[i][1].nextValue();
       grid[i][1].setPosition(i, 2);
       grid[i][2] = grid[i][1];
       
       grid[i][1] = null;
       grid[i][0] = null;  
     }
       
     //3 single merge cases
     //merge bottom 2
     else if (grid[i][3] != null && grid[i][2] != null && grid[i][3].getValue() == grid[i][2].getValue()){
       grid[i][3].nextValue();
       
       if (grid[i][1] == null && grid[i][0] == null){
         grid[i][2] = null;
       }
       else if (grid[i][1] != null){
         grid[i][1].setPosition(i, 2);
         grid[i][2] = grid[i][1];
         
         if (grid[i][0] == null){
           grid[i][1] = null;
         }
         else{
           grid[i][1] = grid[i][0];
           grid[i][1].setPosition(i, 1);
           grid[i][0] = null;
         }
       }
     }
     //merge middle 2
     if (grid[i][2] != null && grid[i][1] != null && grid[i][2].getValue() == grid[i][1].getValue()){
       grid[i][2].nextValue();
       
       
       if (grid[i][0] == null){
         grid[i][1] = null;
       }
       else{
         grid[i][1] = grid[i][0];
         grid[i][1].setPosition(i, 1);
         grid[i][0] = null;
       }
     }
     //merge top 2
     else if (grid[i][1] != null && grid[i][0] != null && grid[i][1].getValue() == grid[i][0].getValue()){
       grid[i][1].nextValue();
       grid[i][0] = null;
     }
   }
 }
 
//MOVE LEFT ------------------------------------------------------------------------------------------------------------
 public void moveLeft(){
    //2nd col
   for(int i = 0; i < 4; i++){
     if (grid[0][i] == null && grid[1][i] != null){
       grid[1][i].setPosition(0, i);
       grid[0][i] = grid[1][i];
       grid[1][i] = null;
     }
   }
   
   //3rd col
   for(int i = 0; i < 4; i++){
     //moving left 2 case
     if (grid[0][i] == null && grid[1][i] == null && grid[2][i] != null){
       grid[2][i].setPosition(0, i);
       grid[0][i] = grid[2][i];
       grid[2][i] = null;
     }
     //moving left 1
     else if (grid[2][i] != null && grid[1][i] == null){
       grid[2][i].setPosition(1, i);
       grid[1][i] = grid[2][i];
       grid[2][i] = null;
     }
   }
     
     //4th col
     for(int i = 0; i < 4; i++){
     //moving left 3 case
     if (grid[0][i] == null && grid[1][i] == null && grid[2][i] == null && grid[3][i] != null){
       grid[3][i].setPosition(0, i);
       grid[0][i] = grid[3][i];
       grid[3][i] = null;
     }
     //moving left 1 case
     else if (grid[0][i] != null && grid[1][i] != null && grid[2][i] == null && grid[3][i] != null){
       grid[3][i].setPosition(2, i);
       grid[2][i] = grid[3][i];
       grid[3][i] = null;
     }
     //moving left 2
     else if (grid[3][i] != null && grid[2][i] == null && grid[1][1] == null){
       grid[3][i].setPosition(1, i);
       grid[1][i] = grid[3][i];
       grid[3][i] = null;
     }
       
   }
   //merging tiles
   this.mergeLeft();
   
   updateAvail();
 }
 
 
public void mergeLeft(){
  for(int i = 0; i < 4; i++){
     
     //double merge case
     if (grid[0][i] != null && grid[1][i] != null && grid[2][i] != null && grid[3][i] != null && grid[0][i].getValue() == grid[1][i].getValue() && grid[2][i].getValue() == grid[3][i].getValue()){
       grid[0][i].nextValue();
       
       grid[2][i].nextValue();
       grid[2][i].setPosition(1, i);
       grid[1][i] = grid[2][i];
       
       grid[2][i] = null;
       grid[3][i] = null;  
     }
       
     //3 single merge cases
     //merge left 2
     else if (grid[0][i] != null && grid[1][i] != null && grid[0][i].getValue() == grid[1][i].getValue()){
       grid[0][i].nextValue();
       
       if (grid[2][i] == null && grid[3][i] == null){
         grid[1][i] = null;
       }
       else if (grid[2][i] != null){
         grid[2][i].setPosition(1, i);
         grid[1][i] = grid[2][i];
         
         if (grid[3][i] == null){
           grid[2][i] = null;
         }
         else{
           grid[2][i] = grid[3][i];
           grid[2][i].setPosition(2, i);
           grid[3][i] = null;
         }
       }
     }
     //merge middle 2
     if (grid[1][i] != null && grid[2][i] != null && grid[1][i].getValue() == grid[2][i].getValue()){
       grid[1][i].nextValue();
       
       if (grid[3][i] == null){
         grid[2][i] = null;
       }
       else{
         grid[2][i] = grid[3][i];
         grid[2][i].setPosition(2, i);
         grid[3][i] = null;
       }
     }
     //merge right 2
     else if (grid[2][i] != null && grid[3][i] != null && grid[2][i].getValue() == grid[3][i].getValue()){
       grid[2][i].nextValue();
       grid[3][i] = null;
     }
   }
}
 
//MOVE RIGHT ------------------------------------------------------------------------------------------------------------
 public void moveRight(){
   //3rd col
   for(int i = 0; i < 4; i++){
     if (grid[3][i] == null && grid[2][i] != null){
       grid[2][i].setPosition(3, i);
       grid[3][i] = grid[2][i];
       grid[2][i] = null;
     }
   }
   
   //2nd col
   for(int i = 0; i < 4; i++){
     //moving right 2 case
     if (grid[3][i] == null && grid[2][i] == null && grid[1][i] != null){
       grid[1][i].setPosition(3, i);
       grid[3][i] = grid[1][i];
       grid[1][i] = null;
     }
     //moving right 1
     else if (grid[1][i] != null && grid[2][i] == null){
       grid[1][i].setPosition(2, i);
       grid[2][i] = grid[1][i];
       grid[1][i] = null;
     }
   }
     
     //1st col
     for(int i = 0; i < 4; i++){
     //moving right 3 case
     if (grid[3][i] == null && grid[2][i] == null && grid[1][i] == null && grid[0][i] != null){
       grid[0][i].setPosition(3, i);
       grid[3][i] = grid[0][i];
       grid[0][i] = null;
     }
     //moving right 1 case
     else if (grid[3][i] != null && grid[2][i] != null && grid[1][i] == null && grid[0][i] != null){
       grid[0][i].setPosition(1, i);
       grid[1][i] = grid[0][i];
       grid[0][i] = null;
     }
     //moving right 2
     else if (grid[0][i] != null && grid[1][i] == null && grid[2][i] == null){
       grid[0][i].setPosition(2, i);
       grid[2][i] = grid[0][i];
       grid[0][i] = null;
     }
       
   }
   //merging tiles
   this.mergeRight();
   
   updateAvail();
 }
 
 public void mergeRight(){
   for(int i = 0; i < 4; i++){
     
     //double merge case
     if (grid[3][i] != null && grid[2][i] != null && grid[1][i] != null && grid[0][i] != null && grid[3][i].getValue() == grid[2][i].getValue() && grid[1][i].getValue() == grid[0][i].getValue()){
       grid[3][i].nextValue();
       
       grid[1][i].nextValue();
       grid[1][i].setPosition(2, i);
       grid[2][i] = grid[1][i];
       
       grid[1][i] = null;
       grid[0][i] = null;  
     }
       
     //3 single merge cases
     //merge right 2
     else if (grid[3][i] != null && grid[2][i] != null && grid[3][i].getValue() == grid[2][i].getValue()){
       grid[3][i].nextValue();
       
       if (grid[1][i] == null && grid[0][i] == null){
         grid[2][i] = null;
       }
       else if (grid[2][i] != null){
         grid[1][i].setPosition(2, i);
         grid[2][i] = grid[1][i];
         
         if (grid[0][i] == null){
           grid[1][i] = null;
         }
         else{
           grid[1][i] = grid[0][i];
           grid[1][i].setPosition(1, i);
           grid[0][i] = null;
         }
       }
     }
     //merge middle 2
     if (grid[2][i] != null && grid[1][i] != null && grid[2][i].getValue() == grid[1][i].getValue()){
       grid[2][i].nextValue();
       
       if (grid[0][i] == null){
         grid[1][i] = null;
       }
       else{
         grid[1][i] = grid[0][i];
         grid[1][i].setPosition(1, i);
         grid[0][i] = null;
       }
     }
     //merge left 2
     else if (grid[1][i] != null && grid[0][i] != null && grid[1][i].getValue() == grid[0][i].getValue()){
       grid[1][i].nextValue();
       grid[0][i] = null;
     }
   }
 }
   
 public void updateAvail(){
   available.clear();
   
   for (int i = 0; i < 4; i++){
     
      for(int j = 0; j < 4; j++){
        
        if (grid[i][j] == null){
          available.add(new PVector(i, j));
        }
      }
   }
 }
 
 public void printGrid(){
   for(int i = 0; i < 4; i++){
     for(int j = 0; j < 4; j++){
       
       if (grid[j][i] == null){
         if (j == 0 && i != 0){
           System.out.println();
         }
         System.out.print("_  ");
         
       }
       else{
         if (j == 0 && i != 0){
           System.out.println();
         }
         System.out.print(grid[j][i].getValue() + "  ");
       }
     }
   }
   System.out.println("\n\nAvailable: ");
   for(int i = 0; i < this.available.size(); i++){
     System.out.print("(" + (int)this.available.get(i).x + ", " + (int)this.available.get(i).y + "), ");
   }
   System.out.println("\n\n-------------------\n\n");
 }
 
 
}
