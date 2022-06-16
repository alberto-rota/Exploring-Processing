float speed;
Ball ball;

class Ball {
  float x; 
  float y;
  float[] dir = new float[2];
  
  Ball(float startX, float startY) {
    this.x = startX;
    this.y = startY;
    noStroke();
    fill(255);
    ellipse(x, y, 30, 30);
    dir[0] = random(-1,1);
    dir[1] = random(-1,1);
  }
  
  void move() {
    speed = 10/sqrt(dir[0]*dir[0] + dir[1]*dir[1]);
    x = x + speed*dir[0];
    y = y + speed*dir[1];
    fill(255);
    ellipse(x, y, 30, 30);
  }
  
  void checkCollision() {
    boolean caught=false;
    if ((x+30)>width || (x-30)<0) {
      dir[0] = dir[0]*-1;
    }
    if (y-30<0) { 
      dir[1] = dir[1]*-1;
    }
    if (y+30>(height-20)){
      if ((mouseX-100)<x && (mouseX+100)>x) {
        dir[1] = dir[1]*-1;
      }else {
        ball = new Ball(width/2, height/2);
      }
    }

  }
}

void setup() {
  size(800, 600);
  background(100);
  ball = new Ball(width/2, height/2);
}

void draw() {
  noCursor();
  background(100);
  ball.move();
  ball.checkCollision();
  rectMode(CENTER);
  fill(#96C1F7); 
  rect(mouseX, 590 ,200,5);
}
