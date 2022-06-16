//VARIABLES
ArrayList <Charge> charge;
boolean interact;
boolean showlines = false;

//EVENT HANDLING
void mousePressed() {
  if (mouseButton == LEFT) {
    charge.add(new Charge(mouseX, mouseY, true));
  }else if (mouseButton == RIGHT) {
    charge.add(new Charge(mouseX, mouseY, false));
  }
}

void keyPressed() {
  if (key == ' ') {
    for (int i=0; i<charge.size(); i++) {
      charge.get(i).interact();  
    }
  }
  if (key == 'l' && !showlines) {
    showlines = true;
  }else if (key == 'l' && showlines) {
    showlines = false;
  }
}

void keyReleased() {
  if (key == 'c')
  for (int i=0; i<charge.size(); i++) {
      charge.clear(); 
    }
}

//FUNCTIONS
void drawVector(PVector vec, PVector app, color c, float scale) {
  pushMatrix();
  stroke(c);
  float m = vec.mag();
  m = constrain(m, 0,100);
  line(app.x, app.y, app.x+vec.x*scale*m, app.y+vec.y*scale*m);
  translate(app.x+vec.x*scale*m, app.y+vec.y*scale*m);
  beginShape();
  vertex(0,0);
  if (vec.x<0) {
    rotate(PVector.angleBetween(vec, new PVector(0,10))+PI/4);
  }else if (vec.x>0) {
    rotate(-PVector.angleBetween(vec, new PVector(0,10))+PI/4);
  }
  noFill();
  rotate(PI/2);  
  vertex(0,8);
  vertex(-8,0);
  fill(c);
  endShape();
  popMatrix();
}  

//MAIN LOOP
void setup() {
  size(1000,800);
  charge = new ArrayList();
}

void draw() {
  background(240);
  for (int i=0; i<charge.size(); i++) {
    charge.get(i).display();
    charge.get(i).checkWallCollision();
    if (showlines)
      drawVector(charge.get(i).acceleration, charge.get(i).location, charge.get(i).c, 8000);
  }
  textSize(20);
  fill(0);
  text("LEFT: + charge         RIGHT: - charge         SPACE: interaction         C: clear        L: show vectors", 30, height-30);
}
