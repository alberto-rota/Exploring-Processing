color red = #FF0000;
color blue = #0000FF;
color green = #00FF68;
color white = #FFFFFF;

float theta = 0;
float speed;
float radius;
int i =1;
float sinewave[] ;
float cosinewave[];
float hx;
float hy;
float rectX;
float rectY;
boolean pressed = false;
boolean moveh = false;
boolean movev = false;
boolean released = false;

void mousePressed() {
  pressed = true;
}
void mouseReleased() {
  pressed = false;
}

void drawAxis() {
  stroke(0);
  line(50,height/2,width-50,height/2);
  line(200,50,200,height-50);
  translate(200, height/2);
}

void drawProjection() {
  fill(red);
  ellipse(i, sinewave[i], 8,8);
  strokeWeight(1);
  stroke(red);
  line(i, sinewave[i], i, 0);
  fill(blue);
  stroke(0);
  ellipse(i, cosinewave[i], 8,8);
  strokeWeight(1);
  stroke(blue);
  line(i, cosinewave[i], i, 0);
  int j=0;
  beginShape();
  noFill();
  do {
    stroke(red);
    curveVertex(j, sinewave[j]);
    j++;
  }while(j<i);
  endShape();
  j=0;
  beginShape();
  noFill();
  do {
    stroke(blue);
    curveVertex(j, cosinewave[j]);
    j++;
  }while(j<i);
  endShape();
}

void setup() {
  size(1600,800);
  sinewave = new float[1200];
  cosinewave = new float[1200];
  rectX = width/2;
  rectY = height/2;
}

void draw() {
  background(200);
  drawAxis();
  hx = radius*cos(-radians(theta));
  hy = radius*sin(-radians(theta));
  sinewave[i] = hy;
  cosinewave[i] = hx;
  drawProjection();
  fill(255,255,255, 200);
  stroke(0);
  ellipse(0,0, radius*2, radius*2);
  noStroke();
  fill(green);
  ellipse(hx, hy, 10,10);
  theta+=speed;
  if (i>=1199) {
    i=0;
  }
  i++;
  translate(-200,-height/2);
  fill(0);
  strokeWeight(1);
  line(0,height-20, width, height-20);
  fill(green);
  
  //FREQUENCY SLIDER
  rectMode(CENTER);
  rect(rectX, height-10, 100,20);  
  if (mouseButton == LEFT && rectX+50>mouseX && rectX-50<mouseX && height-20<mouseY && height>mouseY && pressed) {
    moveh = true;
  }
  if (!pressed) {
    moveh = false;
  }
  if (moveh) {
    rectX=mouseX;
    if (mouseX<0) {
      rectX = 0;
    } 
  }
  speed = map(rectX, 0, width, 0, 100);
  speed = speed/10;
  
  //AMPLITUDE SLIDER
  fill(255);
  noStroke();
  rect(width-10,rectY, 20,100);  
  if (mouseButton == LEFT && width-20<mouseX && width>mouseY && rectY-50<mouseY && rectY+50>mouseY && pressed) {
    movev = true;
  }
  if (!pressed) {
    movev = false;
  }
  if (movev) {
    rectY=mouseY;
  }
  radius = (int)map(rectY, 0, height, 0, 280);
}
