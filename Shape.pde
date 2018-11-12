abstract class Shape{
  PVector pos;
  boolean finished = false;
  color paint = color(0,255,0);
  float lineThickness = 0;
  
  Shape(float x, float y){
    pos = new PVector(x,y);
  }
  
  abstract void drawShape();
  
  abstract void modify(float x, float y);
  
  void finishShape(){
    finished = true;
  }
}
