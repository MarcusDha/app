//Marcus Dha
//2-1

PImage dollar;
PImage xStamp;
boolean stampOn; //true or false
boolean stampOn1;

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
  dollar = loadImage("dollar.png");
  xStamp = loadImage("x.png");
  stampOn = false;
  stampOn1 = false;
}

void draw() {
  println(mouseX, mouseY);

  toolbar(0, 700);

  if (change < 0) {
    pallette(450, 450);
  }



  r = map(slideY, 710, 880, 1, 100);
  w = map(slideY, 710, 880, 1, 200);
  h = map(slideY, 710, 880, 1, 200);
}


void toolbar(int x, int y) {

  fill(black);
  stroke(black);
  strokeWeight(0);
  rect(0, 700, 900, 300);

  //slider
  rectButton(35, 710, 52, 180, dGrey);
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
  rectButton(610, 710, 80, 80, dGrey);
  image(dollar, 610, 710, 80, 80);

  rectButton(610, 810, 80, 80, dGrey);
  image(xStamp, 610, 810, 80, 80);

  //new button
  rectButton(750, 710, 120, 50, dGrey);
  fill(white);
  text("CLEAR CANVAS", 770, 740);

  //save button
  rectButton(750, 780, 120, 50, dGrey);
  fill(white);
  text("SAVE CANVAS", 770, 810);

  //input button
  rectButton(750, 850, 120, 900, dGrey);
  fill(white);
  text("LOAD IMAGE", 770, 880);
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

void rectButton (int x, int y, int w, int h, color variable) {
  strokeWeight(3);
  fill(variable);
  rectTact(x, y, w, h);
  rect(x, y, w, h);
}

void rectTact (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(white);
  } else {
    stroke(grey);
  }
}

void mouseDragged() {

  if (stampOn) {
    image(dollar, mouseX, mouseY, w, h);
  } else if (stampOn1) {
    image(xStamp, mouseX, mouseY, w, h);
  } else {
    fill(black);
    strokeWeight(r);
    stroke(selected);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }


  if (mouseX >40 && mouseX < 80 && mouseY > 710 && mouseY < 880) {
    slideY = mouseY;
  }
}
void mouseReleased () {


  if (mouseX >40 && mouseX < 80 && mouseY > 710 && mouseY < 880) {
    slideY = mouseY;
  }

  if (dist(290, 755, mouseX, mouseY) < 20) {
    selected = yellow;
    stampFalse();
  }

  if (dist(350, 755, mouseX, mouseY) < 20) {
    selected = red;
    stampFalse();
  }

  if (dist(410, 755, mouseX, mouseY) < 20) {
    selected = blue;
    stampFalse();
  }

  if (dist(470, 755, mouseX, mouseY) < 20) {
    selected = white;
    stampFalse();
  }

  if (dist(290, 830, mouseX, mouseY) < 20) {
    selected = green;
    stampFalse();
  }
  if (dist(350, 830, mouseX, mouseY) < 20) {
    selected = purple;
    stampFalse();
  }
  if (dist(410, 830, mouseX, mouseY) < 20) {
    selected = orange;
    stampFalse();
  }
  if (dist(470, 830, mouseX, mouseY) < 20) {
    selected = black;
    stampFalse();
  }
  //activates stamp
  if (mouseX > 610 && mouseX < 690 && mouseY > 710 && mouseX < 790) {
    stampOn = !stampOn;
  }

  if (mouseX > 610 && mouseX < 710 && mouseY > 810 && mouseX < 890) {
    stampOn1 = true;
  }

  //activates new canvas
  if (mouseX > 750 && mouseX < 870 && mouseY > 710 && mouseY < 760) {
    fill(white);
    rect(0, 0, 900, 700);
  }

  //saves canvas
  if (mouseX > 750 && mouseX < 870 && mouseY > 780 && mouseY < 830) {
    selectOutput("Choose a name for your image file", "saveImage");
  }

  //input canvas
  if (mouseX > 750 && mouseX < 870 && mouseY > 850 && mouseY < 900) {
    selectInput("Choose an image to load", "openImage");
  }
}


void saveImage (File f) {
  if (f != null) {
    PImage canvas = get(0, 0, 900, 700);
    canvas.save(f.getAbsolutePath());
  }
}

void openImage (File f) {
  if (f != null) {
    int n = 0;
    while (n < 100) {
      PImage picture = loadImage(f.getPath());
      image(picture, 0, 0);
      n = n + 1;
    }
  }
}

void stampFalse () {
  stampOn1 = false;
  stampOn = false;
}
