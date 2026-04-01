//Marcus Dha
//2-1

float slideY;

void setup() {
  size(600,600);
  strokeWeight(5);
  slideY = 500;
}

void draw() {
  background(255);
  line(150,100,150,500);
  fill(0);
  circle(150, slideY, 50);
}
