

int WIDTH  = 400;
int HEIGHT = 400;
int BACKGROUND = 0;
int FOREGROUND = 255;
Grid grid = null;
ArrayList rest = new ArrayList();
int count = 0;


void begin() {
  grid = new Grid( 0, 0, WIDTH, HEIGHT );
  grid.draw();
  
  rest = grid.rest();
}

void setup() {
  size( WIDTH, HEIGHT );
  background( BACKGROUND );
  frameRate( 1 );
  begin();
}



void draw() {
  
  //print( rest );
  // Draw first
  ArrayList items = new ArrayList();
  for( int i=0; i < rest.size(); i++ ) {
    Grid g = (Grid) rest.get( i );
    g.draw();
    
    ArrayList _rest = g.rest();
    println( _rest );
    for( int j=0; j<_rest.size(); j++ ) {
      items.add( (Grid) _rest.get( j ) );
    }
    
  }
 
  rest = items;
  
  //println( items );
  
  if( count++ >= 3 ) {
    noLoop();
  }
 
 
}



class Grid {

  int xpos, ypos, wid, hei;
  
  Grid( int x, int y, int w, int h ) {
    xpos = x;
    ypos = y;
    wid = w;
    hei = h;
  }
  
  
  void draw() {
    fill( FOREGROUND );
    int st_x = wid / 3;
    int st_y = hei / 3;
    rect( startx(), starty(), st_x, st_y );
  }
  
  
  int startx() {
    return xpos + ( wid / 3 );
  }
  
  int starty() {
    return ypos + ( hei / 3 );
  }
  
  String toString() {
    return "X:" + xpos + "Y:" + ypos + "W:" + wid + "H:" + hei;
  }
  
  ArrayList rest() {
    
    
    ArrayList _a = new ArrayList();
    
    float x = xpos;
    float w = (float)Math.ceil( wid / 3 );
    float h = (float)Math.ceil( hei / 3 );
    float xmax = x + wid;
    
    while(  ( ( xmax - x ) >= w )  ) {
      
      float y = ypos;
      float ymax = y + hei;
      while( ( ymax - y ) > h  ) {
        //println( "X: " + x + " Y:" + y + "W: " + w + "H:" + h );
        if( ! ( x == startx() && y == starty() )) {
          if( w > 0 && h > 0 ) {
            _a.add( new Grid( (int)x, (int)y, (int)w, (int) h ) );
          }
        }
        y += h;
      }
      
      x += w;
      
    }
    
    
    return _a;
    
  }
  
  
}



