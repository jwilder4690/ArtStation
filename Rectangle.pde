class Rectangle extends Shape{
  PVector corner;
  
  Rectangle(float a, float b, float c, float d){ 
    super(a,b);
    corner = new PVector(c,d);
  }
  
  void drawShape(){
    rectMode(CORNERS);
    fill(paint);
    if(lineThickness == 0){
      noStroke();
    }
    else{
      strokeWeight(lineThickness);
    }
    rect(pos.x, pos.y, corner.x, corner.y);
  }
  
  void modify(float x, float y){
    corner.set(x,y);
  }
  
}
