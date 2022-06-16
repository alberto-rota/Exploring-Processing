class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float acc;
  PShape ball;

  Ball() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(random(-1,1), random(-1,1));
    location.add(velocity.setMag(8));
    acceleration = new PVector(0,0);
    ball = createShape(ELLIPSE, 0, 0, 30,30);
    ball.setStrokeWeight(0);
    ball.setFill(white);
    acc = 3;
  }
  
  void updateLocation() {
    acceleration = velocity.normalize();
    acceleration.setMag(acc);
    velocity.add(acceleration);
    location.add(velocity);
    this.checkWallBounce();
    if (acc<=2) {
      acc=2;
    }else if (acc>=15) {
        acc = 15;
      }
  }
  void display() {
    shape(ball, location.x, location.y);
  }
  void checkWallBounce() {
    if (location.x-25<=0) {
      location.x =25;
      velocity.x = velocity.x*(-1);
      acc--;
      acceleration = velocity.normalize();
      acceleration.setMag(acc);
      velocity.add(acceleration);
      if (acc<=2) {
        acc=2;
      }else if (acc>=15) {
        acc = 15;
      }
    }
    if (location.x+25>=width) {
      location.x = width-25;
      velocity.x = velocity.x*(-1);
      acc--;
      acceleration = velocity.normalize();
      acceleration.setMag(acc);
      velocity.add(acceleration);
      if (acc<=2) {
        acc=2;
      }else if (acc>=15) {
        acc = 15;
      }
    }
  }
  
  void checkBrickBounce(Brick brick) {
    float relativeX;
    if (brick.equals(mybrick)) {
      if (location.y > height-20) {
        if (brick.location.x-75 < this.location.x && brick.location.x+75 > this.location.x) {
          velocity.y = velocity.y*(-1);
          relativeX = this.location.x-brick.location.x;
          relativeX = map(relativeX, -75, 75, radians(170), radians(10));
          PVector impactV = new PVector(cos(relativeX), -sin(relativeX));
          acc++;
          impactV.setMag(8);
          acceleration = velocity.normalize();
          acceleration.setMag(acc);
          velocity.add(acceleration);
          velocity.add(impactV);
        }
      }
    }
    if (brick.equals(enbrick)) {
      if (location.y <20 ){
        if (brick.location.x-75 < location.x && brick.location.x+75 > location.x) {
          velocity.y = velocity.y*(-1);
          relativeX = this.location.x-brick.location.x;
          relativeX = map(relativeX, -75, 75, radians(170), radians(10));
          PVector impactV = new PVector(cos(relativeX), -sin(relativeX));
          acc++;
          impactV.setMag(8);
          acceleration = velocity.normalize();
          acceleration.setMag(acc);
          velocity.add(acceleration);
        }
      }
    }
  }
  
  void checkIfLost() {
    if (this.location.y>height+10){
      lostp = true;
    }
    if (this.location.y<-10) {
      loste= true;
    }
  }
}
