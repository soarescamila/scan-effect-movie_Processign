import processing.video.*;

Movie video;

int x = 0;
boolean play = true;

void setup() {
  size(798, 800);
  background(255);
  video = new Movie(this, "2001-360.mp4");
  video.loop();
  while (video.height == 0) delay(2);
}

void movieEvent(Movie video) {
  video.read();
}

void draw() {
  int videoH = video.height;  
  int scanY = videoH + 20;
  int scanH = height - 380;

  image(video, 0, 0);

  //mouse ellipse pointer
  if (mouseY < videoH) {
    stroke(255);
    strokeWeight(3);
    noFill();
    ellipse(mouseX, mouseY, 30, 30);
  } else {
    noStroke();
  }

  // -- star the scan! --
  copy(video, mouseX, 0, 1, videoH, x, scanY, 1, scanH);

  //copy and move, than return
  x++;
  if (x > width) {
    x = 0;
  }

  // --- finish the scan! ---
}

//pause the video

void mousePressed() {
  play = !play;

  if (play) {
    video.play();
  } else {
    video.pause();
  }
}
