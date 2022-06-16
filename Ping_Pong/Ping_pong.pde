//VARIABLES
color black = #000000;
color red = #FF0000;
color green = #03FA5B;
color white = #FFFFFF;
color yellow = #FFF308;

boolean lostp = false;
boolean loste = false;

int pointp, pointe;

Ball ball;
Brick mybrick;
Brick enbrick;
PFont font; 

//EVENT HANDLING

//FUNCTIONS

//MAIN
void setup() {
  size(800,600);
  font = createFont("OCRAExtended", 40, true);
  ball = new Ball();
  mybrick = new Brick(width/2, height-4, green);
  enbrick = new Brick(width/2, 5, red);
  pointp = 0; 
  pointe = 0;
}

void draw() {
  background(0);
  ball.updateLocation();
  ball.display();
  mybrick.updateLocation(mouseX);
  mybrick.display();
  enbrick.updateLocation(lerp(enbrick.location.x, ball.location.x, 0.15));
  enbrick.display();
  ball.checkBrickBounce(mybrick);
  ball.checkBrickBounce(enbrick);
  ball.checkIfLost();
  textAlign(CENTER);
  textFont(font);
  fill(yellow);
  text(pointp, 30, height-20);
  text(pointe, width-30, 40);
  if (lostp) {
    pointe++;
    ball = new Ball();
    mybrick = new Brick(width/2, height-4, green);
    enbrick = new Brick(width/2, 5, red);
    lostp=false;
  }
  if (loste) {
    pointp++;
    ball = new Ball();
    mybrick = new Brick(width/2, height-4, green);
    enbrick = new Brick(width/2, 5, red);
    loste=false;
  }
}
