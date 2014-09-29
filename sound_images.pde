import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer speech;
int x;
int time;
float level;
float prev_level = 0;

void setup () {
  size(1500, 600, P3D);
  background(255);
  stroke(255);
  minim = new Minim(this);
  speech = minim.loadFile("sample.wav", 1024);
  speech.play();

  rectMode(CENTER);
  time = millis();
  x = 10;
}

void draw() {
  
  /*for(int i = 0; i < speech.bufferSize() - 1; i++) {
    float x1 = map( i, 0, speech.bufferSize(), 0, width );
    float x2 = map( i+1, 0, speech.bufferSize(), 0, width );
    line( x1, 50 + speech.left.get(i)*50, x2, 50 + speech.left.get(i+1)*50 );
    line( x1, 150 + speech.right.get(i)*50, x2, 150 + speech.right.get(i+1)*50 );
  }*/
  
  noStroke();
  fill( 0 );
  
  level = speech.left.level()*height*6;
  
  draw_rect(x, (level + prev_level)/2 );
  
  prev_level = level;
  x += 15;
  
  //if( millis() >= time + 10) {
    draw_rect(x, level);
    x += 15;
  //}
  
  //rect( 0, 0, speech.left.level()*width, 100 );
  //rect( 0, 100, speech.right.level()*width, 100 );

}

void draw_rect(int pos, float level) {
  rect(pos, 300, 10, level);
}
