class Canvas{
  int canvasWidth;
  int canvasHeight;
  color background = color(255,255,255);
  int gridDensity = 10;
  float gridSpacing;
  boolean gridOn = true;
  
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
  
  void drawCanvas(){
    fill(background);
    strokeWeight(2);
    stroke(0,0,0);
    rect(0,0, canvasWidth, canvasHeight);
    if(gridOn) drawGrid();
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
