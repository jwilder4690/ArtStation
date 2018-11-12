//colorMode;
enum ShapeType {CIR, REC, TRI, LIN}
ShapeType currentTool = ShapeType.CIR;
Canvas pad = new Canvas(600,600);
float scaleFactor;
int toolbarWidth = 200;
float verticalPadding = 0.05;
float verticalScreenShare = 1 - 2*verticalPadding;
float horizontalPadding = 0.15;
float horizontalScreenShare = 1 - 2*horizontalPadding;
boolean[] keys = new boolean[255];
float canvasX;
float canvasY;

void setup(){
  size(displayWidth, displayHeight);
  //frame.setResizable(true);  //extremely buggy
  surface.setResizable(true);  //extremely buggy
}

void draw(){
  checkInput();
  background(55,55,55);
  drawCanvasArea();
  drawFrames();
  drawToolbar();
}

void mousePressed(){
 if(canvasX >= 0 && canvasY >= 0 && canvasX <= pad.getHeight() && canvasY <= pad.getWidth()){
   pad.drawShape(canvasX, canvasY, currentTool);
 }
}

void mouseReleased(){
  pad.completeShape();
}

void keyPressed(){
  if(key < 255){
    keys[key] = true;
  }
}

void checkInput(){
  if(keys['f'] == true){
    surface.setResizable(true);
    surface.setSize(displayWidth, displayHeight);
    surface.setResizable(false); //dragging the corner will eventually freeze the window, so until a fix is found toggle resizeable back off
    keys['f'] = false;
  }
  if(keys['s'] == true){
    surface.setResizable(true);
    surface.setSize(1280,720);
    surface.setResizable(false);
    keys['s'] = false;
  }
  if(keys['1'] == true){
    currentTool = ShapeType.CIR;
    keys['1'] = false;
  }
  if(keys['2'] == true){
    currentTool = ShapeType.REC;
    keys['2'] = false;
  }
  if(keys['3'] == true){
    currentTool = ShapeType.TRI;
    keys['3'] = false;
  }
  if(keys['4'] == true){
    currentTool = ShapeType.LIN;
    keys['4'] = false;
  }
    
  
}

void drawToolbar(){
  rectMode(CORNER);
  fill(215,215,215);
  rect(0,0, toolbarWidth, height);
}

void drawFrames(){
  rectMode(CORNER);
  noStroke();
  fill(55,55,55);
  rect(0,0, width*horizontalPadding +toolbarWidth, height);
  rect(0,0, width, height*verticalPadding);
  rect(0, height*verticalPadding + (pad.getHeight()*scaleFactor), width, height*verticalPadding);
  rect( width*horizontalPadding +toolbarWidth + (pad.getWidth()*scaleFactor), 0, width*horizontalPadding, height);
}

void drawCanvasArea(){
  scaleCanvas();
  pushMatrix();
    translate(width*horizontalPadding +toolbarWidth, height*verticalPadding);
    scale(scaleFactor,scaleFactor);
    pad.drawCanvas(canvasX, canvasY);
    canvasX = (mouseX - screenX(0,0))/scaleFactor;
    canvasY = (mouseY - screenY(0,0))/scaleFactor; 
  popMatrix();
}

void scaleCanvas(){
  scaleFactor = (horizontalScreenShare*(width-toolbarWidth))/float(pad.getWidth());
  if( scaleFactor > (verticalScreenShare*height)/float(pad.getHeight())){
    scaleFactor = (verticalScreenShare*height)/float(pad.getHeight());
  }
}
