class Cell{  
  int x;
  int y;
  int state; //0 = empty, 1 = tree, 2 = fire
  
  Cell(int X, int Y){
    x = X;
    y = Y;
    state = 0;
  }
  
  void show(){
    if(state == 0){
      fill(0);
    }else if(state == 1){
      fill(0,255,0);
    }else if(state == 2){
      fill(255,0,0);
    }
    rect(x*res, y*res, res, res);
  }
  
  void update(){ 
    if(state == 0){
      //if 1 tree neighbour
      int neighbours = 0;
      neighbours += (getState(x-1,y) == 1 ? 1 : 0); //if tree add 1 to count
      neighbours += (getState(x,y-1) == 1 ? 1 : 0);
      neighbours += (getState(x+1,y) == 1 ? 1 : 0);
      neighbours += (getState(x,y+1) == 1 ? 1 : 0);
      if(neighbours > 0){
        if(random(1) < spread_chance){
         state = 1; 
        }
      }
      
      if(random(1) < spawn_chance){ //also has random chance to spawn
        state = 1; 
      }
      
    }else if(state == 1){ //tree
      //if 1 burning neighbour, burn
      int neighbours = 0;
      neighbours += (getState(x-1,y) == 2 ? 1 : 0); //if burning add 1 to count
      neighbours += (getState(x,y-1) == 2 ? 1 : 0);
      neighbours += (getState(x+1,y) == 2 ? 1 : 0);
      neighbours += (getState(x,y+1) == 2 ? 1 : 0);
      if(neighbours > 0){
        state = 2; 
      }
      
      if(random(1) < burn_chance){ //also has random chance to start burning
         state = 2; 
      }
       
    }else if(state == 2){ //fire
      state = 0;
    }
  }
}
