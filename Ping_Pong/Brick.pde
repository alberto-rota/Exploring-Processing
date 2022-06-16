class Brick {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PShape rectangle;
  
  Brick(float x, float y, color c) {
    location = new PVector (x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    rectMode(CENTER);
    rectangle = createShape(RECT, 0, 0, 150, 10);
    rectangle.setStrokeWeight(0);
    rectangle.setFill(c);
  }
  
  void updateLocation(float pos) {
    location.x = pos;
  }
  
  void display() {
    shape(rectangle, location.x, location.y);
  }
}
