//Marcus Dha
//2-1

color brown = #FFE6A7;
color darkBrown = #99582A;

float slideY;

float r = 100;

void setup() {
  size(600,600);
  strokeWeight(5);
  slideY = 500;
}

void draw() {
  background(brown);
  
  fill(darkBrown);
  line(150,100,150,500);
  circle(150, slideY, 40);
  
  circle(400,300,r);
  r = map(slideY, 100,500,5,150);
}

void mouseDragged () {
  slider();
}

void mousePressed () {
  slider();
}

void slider () {
 if (mouseX >120 && mouseX <180 && mouseY> 100 && mouseY<500) {
    slideY = mouseY;
  } 
  r = map(slideY, 100,500,5,150);
}
