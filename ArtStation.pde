//colorMode;
Canvas pad = new Canvas(600,600);
float scaleFactor;
float verticalPadding = 0.05;
float verticalScreenShare = 1 - 2*verticalPadding;
float horizontalPadding = 0.15;
float horizontalScreenShare = 1 - 2*horizontalPadding;

void setup(){
  size(1280, 720);
  surface.setResizable(true);  //extremely buggy
}

void draw(){
  background(55,55,55);
  scaleCanvas();
  pushMatrix();
    scale(scaleFactor,scaleFactor);
    translate(width*horizontalPadding, height*verticalPadding);
    pad.drawCanvas();
  popMatrix();
}

void mousePressed(){
 surface.setSize(1280, 720); 
}

void scaleCanvas(){
  scaleFactor = (horizontalScreenShare*width)/float(pad.getWidth());
  if( scaleFactor > (verticalScreenShare*height)/float(pad.getHeight())){
    scaleFactor = (verticalScreenShare*height)/float(pad.getHeight());
  }
}
