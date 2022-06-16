void setup() {
  size(800,600);
  background(0, 30);
}
int colour = 255;
void draw() {
  translate(width/2, height/2);
  fill(colour);
  ellipse(0, 0, mouseX-width/2, mouseY-height/2);
}
void mousePressed() {
  if (colour == 255) {
    background(255);
    colour=0;
  }else{
    background(0);
    colour=255;
  }
}
