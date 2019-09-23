import java.util.*;

int cols;
int rows;
int scl=10;
Cell[][] grid = new Cell[41][41];

Cell current;
Stack<Cell> stack = new Stack<Cell>();  

void setup() {
  size(401, 401);
  
  cols=(width/scl);
  rows= (height/scl);
  for (int i=0; i<=cols; i++) {
    for (int j=0; j<=rows; j++) {
      Cell cell = new Cell(i, j);
      grid[i][j]=cell;
    }
  }
  current=grid[0][0];
}

void draw() {

  background(0,0,255);
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {

      grid[i][j].show();
    }
  }

  current.visited=true;
  current.highlight();
  Cell next=  current.checkNeighbors();

  if (next!= null) {
    // print(next.i,next.j+"\n");
    next.visited= true;
   
   stack.push(current);
   
   
    int x=current.i-next.i;
    if (x==1) {
      current.walls[0]=false;
      next.walls[2]=false;
    } else if (x==-1) {
      next.walls[0]=false;
      current.walls[2]=false;
    } 
    int y=current.j-next.j;
    if (y==1) {
      current.walls[3]=false;
      next.walls[1]=false;
    } else if(y==-1) {
      next.walls[3]=false;
      current.walls[1]=false;
    } 
    
    current=next;
  }
  else if(stack.size()>0){
    current=stack.pop();
  }
}
