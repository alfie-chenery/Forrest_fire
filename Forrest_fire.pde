float spawn_chance = 0.00001; //chance to spontaneously become tree
float spread_chance = 0.05; //chance to grow tree next to existing tree
float burn_chance = 0.0001; //chance to spontaneously burn
int res = 10;

ArrayList<Cell> grid;

void setup(){
  size(800,800);
  frameRate(30);
   grid = new ArrayList();
   noStroke();
   
   for(int y=0; y<height/res; y++){
     for(int x=0; x<width/res; x++){
       Cell c = new Cell(x,y);
       grid.add(c);
     }
   }
}

int getState(int x, int y){
  if(x < 0 || x >= width/res || y < 0 || y >= height/res){ //invalid coords
    return 0; //has effect of edge's neighbours off grid are always empty
  }
  int loc = x + (y*(width/res));
  Cell c = grid.get(loc);
  return c.state;
}

void draw(){
  for(Cell c : grid){
    c.update();
    c.show();
  }
}
