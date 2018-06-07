import processing.video.*;
Movie myMovie;
Movie myMovie2;

void setup() {
  size(1000, 1000);
  myMovie = new Movie(this, "SECONDAEXPO.mp4");
  myMovie.loop();
  
}

void draw() {
 // tint(255, 255);
 if (myMovie.available()) {
   myMovie.read();
 }
  image(myMovie, mouseX, mouseY, 500, 500);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

void mousePressed() {
  myMovie.jump(random(myMovie.duration()));
}