//Marcus Dha
//2-1

PImage overwatch;
boolean stampOn; //true or false

color black = #000000;
color white = #FFFFFF;
color red = #FF0000;
color green = #00FF00;
color blue = #0000FF;
color orange = #FCD224;
color purple = #BB24FC;
color yellow = #FFF700;
color brown = #BC8517;

color grey = #98988A;
color dGrey = #797575;

color selected; // changes color

float w = 50;
float h = 50;
int change = 1;
float slideY;
float r;

void setup() {
  size(900, 900);
  background(white);
  selected = black;
  slideY = 800;
  r = 50;
  overwatch = loadImage("overwatch1.png");
  stampOn = true;
}

void draw() {
  println(mouseX, mouseY);

  toolbar(0, 700);

  if (change < 0) {
    pallette(450, 450);
  }



  r = map(slideY, 710, 880, 1, 100);
  w = map(slideY, 710,880, 1, 200);
  h = map(slideY, 710,880, 1, 200);
}


void toolbar(int x, int y) {

  fill(black);
  stroke(black);
  strokeWeight(0);
  rect(0, 700, 900, 300);

  //slider
  fill(dGrey);
  rect(35, 710, 52, 180);
  strokeWeight(5);
  stroke(white);
  fill(white);
  line(60, 720, 60, 880);
  circle(60, slideY, 25);

  //slider indicator
  fill(selected);
  stroke(white);
  strokeWeight(4);
  circle(170, 800, r);

  //color section
  fill(dGrey);
  strokeWeight(0);
  rect(250, 710, 300, 180);
  buttonfunc(290, 755, 40, yellow);
  buttonfunc(350, 755, 40, red);
  buttonfunc(410, 755, 40, blue);
  buttonfunc(470, 755, 40, white);
  buttonfunc(290, 830, 40, green);
  buttonfunc(350, 830, 40, purple);
  buttonfunc(410, 830, 40, orange);
  buttonfunc(470, 830, 40, black);

  //stamp button
  fill(yellow);
  rect(610, 745, 100, 100);
  image(overwatch, 610, 745, 100, 100);
}

void pallette (int x, int y) {
  circle(450, 450, 50);
}


void buttonfunc (int x, int y, int r, color variable) { // color variable

  strokeWeight(3);
  fill(variable);
  tactile(x, y, 20);
  circle(x, y, r);
}



void tactile (int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(grey);
  }
}

void mouseReleased () {


  if (mouseX >40 && mouseX < 80 && mouseY > 710 && mouseY < 880) {
    slideY = mouseY;
  }

  if (dist(290, 755, mouseX, mouseY) < 20) {
    selected = yellow;
  }

  if (dist(350, 755, mouseX, mouseY) < 20) {
    selected = red;
  }

  if (dist(410, 755, mouseX, mouseY) < 20) {
    selected = blue;
  }

  if (dist(470, 755, mouseX, mouseY) < 20) {
    selected = white;
  }

  if (dist(290, 830, mouseX, mouseY) < 20) {
    selected = green;
  }
  if (dist(350, 830, mouseX, mouseY) < 20) {
    selected = purple;
  }
  if (dist(410, 830, mouseX, mouseY) < 20) {
    selected = orange;
  }
  if (dist(470, 830, mouseX, mouseY) < 20) {
    selected = black;
  }
}

void mouseDragged() {

  if (stampOn == false) {
    fill(black);
    strokeWeight(r);
    stroke(selected);
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    image(overwatch, mouseX, mouseY, w, h);
  }

  if (mouseX >40 && mouseX < 80 && mouseY > 710 && mouseY < 880) {
    slideY = mouseY;
  }
}
