//Marcus Dha
//2-1

color olive = #ECF39E;
color lightGreen = #90A955;
color green = #4F772D;
color darkGreen = #31572c;
color white = #FFFFFF;
color darkestGreen = #132A13;

color selected;

void setup() {
  size(600,600);
  selected = green;
  
}

void draw() {
  background(olive);
  stroke(0);
  strokeWeight(5);
  
  tactfunction(360,420);
  fill(lightGreen);
  rect(100,360,400,60);
  
  tactfunction(440,500);
  fill(green);
  rect(100,440,400,60);
  
  tactfunction(520,580);
  fill(darkGreen);
  rect(100,520,400,60);
  
  stroke(darkestGreen);
  fill(selected);
  rect(100,40,400,300);
}

void tactfunction (int y, int y1) {
  
  if (mouseX > 100 && mouseX < 500 && mouseY > y && mouseY < y1) {
    stroke(white);
  } else {
    stroke(darkestGreen);
  }
}

void mouseReleased () {
  if (mouseX > 100 && mouseX < 500 && mouseY > 360 && mouseY < 420) {
    selected = lightGreen;
  }
  
  if (mouseX > 100 && mouseX < 500 && mouseY > 440 && mouseY < 500) {
    selected = green;
  }
  
  if (mouseX > 100 && mouseX < 500 && mouseY > 520 && mouseY < 580) {
    selected = darkGreen;
  }
}
  
