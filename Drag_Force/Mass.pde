class Mass {
  PShape circle;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector gravity = new PVector (0, 2);
  float mass;
  
  Mass (float radius){
    circle = createShape(ELLIPSE, 0,0, radius, radius);
    mass = radius;
    location = new PVector(random(0, width), 80);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0.1);
  }
  
  void update() {
    velocity.add(acceleration);
    drawVector(gravity, location, #ff0000);
    location.add(velocity);
  }
  
  void checkCollision() {
    PVector copy = location;
    if (location.y>=height-mass) {
      velocity.mult(0); 
      acceleration.mult(0);
      location.y = height-mass/2;
    }
  }
 
  void applyForce(PVector force) {
    acceleration.setMag(0);
    acceleration.add(gravity);
    float f = map(force.mag()/mass, 0,0.1, 1, 2);
    force.setMag(f);
    acceleration.add(force);
  }
  
  void display() {
    fill(150,150,150);
    stroke(0);
    ellipse(location.x, location.y, mass, mass);  
  }
}
