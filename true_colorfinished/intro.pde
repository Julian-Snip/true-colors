color dblue = #FFFFFF;

void intro() {
  //sound
  theme.play();
  gameover.pause();

  //gif draw
  image(gif[f], 0, 0, width, height);
  f=f+1;
  if (f==numberOfFrames) f=0;

  //text
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(100);
  textFont(GROBOLD);
  text("TRUE COLOR", height/2, width/2);
  tactileRecti(300, 600, 200, 100, #ED187C);

  fill(0);
  textSize(50);
  text("play", 400, 650);
}

void introClicks() {
  if (touchingRect(300, 600, 200, 100)) {
    mode= GAME;
  }
}

boolean touchingRecti(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y & mouseY < y+h) {
    return true;
  } else {
    return false;
  }
}

void tactileRecti(int x, int y, int w, int h, color f) {
  //rect button
  fill(f);
  if (touchingRect(x, y, w, h)) {
    stroke(white);
  } else {
    stroke(black);
  }
  rect(x, y, w, h);
}
