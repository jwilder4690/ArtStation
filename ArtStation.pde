boolean gridOn = true;
int gridSpacing = 50;
int drawingAreaWidth = 600;
int drawingAreaHeight = 600;

void setup(){
  size(1280, 720);
  surface.setResizable(true);  //extremely buggy
}

void draw(){
  background(55,55,55);
  fill(205,205,205);
  rect(height/8, width/3, drawingAreaWidth, drawingAreaHeight);
  if(gridOn){
    drawGrid(drawingAreaWidth, drawingAreaHeight, gridSpacing);
  }
}

void mousePressed(){
 surface.setSize(1280, 720); 
}

void drawGrid(int w, int h, int space){
  fill(100,100,100);
  for(int i = 0; i < w; i+=space){
    line(
  }

}
