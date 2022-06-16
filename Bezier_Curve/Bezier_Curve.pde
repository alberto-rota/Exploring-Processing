//FUNCTIONS
boolean hovering(float x, float y) {
  if (mouseX<x+5 && mouseX>x-5 && mouseY<y+5 && mouseY>y-5){
    return true;
  }else {
    return false;
  }
}

void display() {
  fill(yellow);
  noStroke();
  ellipse(coord[0], coord[1], 10,10);
  ellipse(coord[2], coord[3], 10,10);
  ellipse(coord[4], coord[5], 10,10);
  ellipse(coord[6], coord[7], 10,10);
  strokeWeight(3);
  noFill();
  stroke(255);
  bezier(coord[0], coord[1], coord[2], coord[3], coord[4], coord[5], coord[6], coord[7]);
  strokeWeight(0.5);
  stroke(255);
  line(coord[0], coord[1], coord[2], coord[3]);
  line(coord[4], coord[5], coord[6], coord[7]);
}

//EVENTS
void mousePressed() {
  mp = true;
}

void mouseReleased() {
  mr = true;
}


//GLOBALS
color yellow = #F3F70A;
float coord[];
int j;
boolean mp = false;
boolean mr = false;
boolean move = false;
int modX, modY;

//MAIN LOOP
void setup() {
  size(800,800);
  background(0);
  coord = new float[8];
  j = 0;
}

void draw() {
  if (move) {
    do{
      println("pressing");
      coord[modX] = mouseX;
      coord[modY] = mouseY;
      background(0);
      display();
    }while(!mr);
    move = false;
  }else if (mouseButton == LEFT && mp) {
    if (j<7) {
      fill(yellow);
      noStroke();
      ellipse(mouseX, mouseY, 10,10);
      coord[j] = mouseX;
      j++;
      coord[j] = mouseY;
      j++;
      mp = false;
    }
  }
   if (j==8) {
    display();
    for (int i=0; i<8; i+=2) {
      if (hovering(coord[i], coord[i+1]) && mouseButton == LEFT && mp) {
        modX = i;
        modY = i+1;
        move = true;
      }
    }
   }    
  if (mouseButton == RIGHT && mp) {
    background(0);
    for (int i=0; i<8; i++) {
      coord[0] = 0;
    }
    j=0;
  }
}
