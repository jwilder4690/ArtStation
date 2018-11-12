class Circle extends Shape{
  float radius;
  
  Circle(float x, float y, float r){
    super(x,y);
    radius = r;
  }
  
  void drawShape(){
    fill(paint);
    strokeWeight(lineThickness);
    ellipse(pos.x, pos.y, radius, radius);
  }
    
  void modify(float x, float y){
    radius = 2*dist(x,y, pos.x, pos.y);
  }
  
}
