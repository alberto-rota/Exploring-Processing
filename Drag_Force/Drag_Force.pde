Fluid water;
ArrayList <Mass> m;

boolean mp;
void mousePressed() {
  mp = true;
}

void drawVector(PVector vec, PVector app, color c) {
  pushMatrix();
  stroke(c);
  fill(c);
  float m = vec.mag();
  m = constrain(m, 0,100);
  m = map (m, 0,5, 0, 100);
  PVector copy = vec.get();
  copy.mag();
  line(app.x, app.y, app.x+vec.x*m, app.y+vec.y*m);
  translate(app.x+vec.x*m, app.y+vec.y*m);
  if (copy.y<0) {
    rotate(PVector.angleBetween((new PVector(1,0)), copy));
  }else if (copy.y>0) {
    rotate(-PVector.angleBetween((new PVector(1,0)), copy));
  }
  beginShape();
  vertex(0,0);
  vertex(10, -3);
  vertex(10,3);
  endShape();
  popMatrix();
} 

void setup() {
  size(800,600);
  m = new ArrayList();
  water = new Fluid(new PVector(width/2, 3*height/4), width, height/2, 0.2);
  for (int i = 0; i<7; i++) {
    m.add(new Mass(random(10,60)));
  }
}

void draw() {
  background(220);
  water.display();
  for (int i = 0; i<m.size(); i++) {
    if (water.affects(m.get(i))) {
      water.drag(m.get(i));
    }
    m.get(i).update();
    m.get(i).display();
    m.get(i).checkCollision();
  }
  if (mouseButton == LEFT && mp) {
    setup();
  }
}
