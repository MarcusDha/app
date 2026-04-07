//Marcus Dha
//2-1

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

color selected; // changes color

int change = -1;
float slideY;

void setup() {
  size(900, 900);
  background(white);
}

void draw() {
  println(mouseX, mouseY);

  toolbar(0, 700,100);

  if (change > 0) {
    pallette(450, 450);
  }
}

void mouseDragged() {
  fill(selected);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void toolbar(int x, int y, int r) {

  fill(black);
  stroke(black);
  rect(0, 700, 900, 300);
  
  //slider
  strokeWeight(5);
  stroke(white);
  fill(white);
  line(60,720,60,880);
  circle(60,800,25);
  
  //slider indicator
  circle(150, 800, r);
}

void pallette (int x, int y) {
  circle(450, 450, 50);
}

void mouseReleased () {

  if (dist(150, 800, mouseX, mouseY) < 50) {
    change = change * -1;
  }
  
  if (mouseX >40 && mouseX < 80 && mouseY > 
}
