public class Player {
  private int emptySpaces;
  private Tile spaces[] = new Tile[16];
  private int occupied[] = new int[16];
  private int available;
  
  Player(){
    for (int i = 0; i < 15; i++){
      occupied[i] = 0;
    }
  }
  
  public int getAvailable(){
    return available;
  }
}
