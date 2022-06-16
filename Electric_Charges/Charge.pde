class Charge {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PShape circle;
  boolean positive; //TRUE= Positiva FALSE= Negativa
  color c;
  
  Charge(float lx, float ly, boolean pos) {
    location = new PVector(lx, ly);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    positive = pos;
    circle=createShape(ELLIPSE, 0,0,30,30);
    circle.setStrokeWeight(0);
    if (pos) {
      c = #FF0000;
    } else {
      c = #0000FF;
    }
  }
  
  void display() {
    circle.setFill(c);
    noStroke();
    shape(circle, location.x, location.y);
  }
  
  void checkWallCollision() {;
    if (location.x+15>width) {
      velocity.x = velocity.x * (-1);
    }
    if (location.x-15<0) {
      velocity.x = velocity.x * (-1);
    }
    if (location.y+15>height) {
      velocity.y = velocity.y * (-1);
    }
    if (location.y-15<0) {
      velocity.y = velocity.y * (-1);
    }
  }
  
  void interact() {
    for(int j=0; j<charge.size(); j++) {
      charge.get(j).acceleration.mult(0);
      for (int i=0; i<charge.size(); i++) {
        PVector force = PVector.sub(charge.get(j).location, charge.get(i).location);
        float distance = force.mag();
        float k = 1 / (distance*distance);
        force.normalize();
        force.setMag(constrain(k, 0.1, 10));
        if (charge.get(i).positive == charge.get(j).positive) {
          charge.get(j).acceleration.add(force);
          stroke(#FFF303);
        }else {
          charge.get(j).acceleration.add(force.mult(-1));
          stroke(#03FF15);
        }
      }
    }
    location.add(velocity);
    velocity.add(acceleration);
  }
}
