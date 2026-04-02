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

color grey = #98988A;

color selected; // changes color

void setup() {
 size(900,900); 
 background(white);
}

void draw() {
 
 toolbar(0,0,0);
 
}

void mouseDragged() {
  fill(selected);
 line(pmouseX,pmouseY,mouseX,mouseY); 
}


void toolbar(int x, int y, int anchor) {
  
 pushMatrix();
 translate(x,y);
 fill(grey);
 stroke(grey);
 rect(anchor,600,900,600); // toolbar 
 rect(anchor + 440,560,70,50);
 
 button(600,600);
 
 popMatrix();
}

void button (int x, int y) {
  circle(50,50,50);
}
