class Canvas{
  int canvasWidth;
  int canvasHeight;
  color background = color(255,255,255);
  int gridDensity = 10; //must be less than canvasWidth if int division is used
  float gridSpacing; 
  boolean gridOn = true;
  ArrayList<Shape> shapes = new ArrayList<Shape>();
  
  Canvas(int w, int h){
   canvasWidth = w;
   canvasHeight = h;
   gridSpacing = canvasWidth/float(gridDensity);
  }
  
  int getWidth(){
    return canvasWidth;
  }
  
  int getHeight(){ 
    return canvasHeight;
  }
  
  void drawCanvas(float mx, float my){
    fill(background);
    strokeWeight(2);
    stroke(0,0,0);
    rect(0,0, canvasWidth, canvasHeight);
    if(gridOn) drawGrid();
    if(mousePressed){
      shapes.get(shapes.size()-1).modify(mx, my);
    }
    for(int i = 0; i < shapes.size(); i++){
      shapes.get(i).drawShape(); 
    }
  }
  
  void drawShape(float x, float y, ShapeType type){
    switch(type){
      case CIR: shapes.add(new Circle(x,y,50)); break;
      case REC: shapes.add(new Rectangle(x,y, 50,50)); break;
      case TRI: break;
      case LIN: break;
    }
  }
  
  void completeShape(){
    shapes.get(shapes.size() -1).finishShape();
  }

  void drawGrid(){
    strokeWeight(2);
    stroke(155,155,155);
    for(int i = 1; i < gridDensity; i++){
      line(i*gridSpacing, 0, i*gridSpacing, canvasHeight);     
    }
    int i = 1;
    while(i*gridSpacing < canvasHeight){
      line(0,i*gridSpacing, canvasWidth, i*gridSpacing);  
      i++;
    }
  }
}
